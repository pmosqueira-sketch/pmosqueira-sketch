# Runbook: recuperar la inteligencia y corregir WF7

Estado: listo para ejecutar desde el equipo · Preparado: 2026-09-23

## Diagnóstico de retención (validado hoy)

- **No se borró nada.** No hay trabajos en `pg_cron`, no hay triggers de borrado en las tablas de inteligencia y ninguna función hace `DELETE` sobre ellas.
- **El problema es de captura:** los datos nunca entraron.
  - `ransomware_mx_victims` se llenó una sola vez (2026-04-08).
  - WF7 escribe en `darkweb_intel` filas derivadas de CVEs, no víctimas.
- `ransomware_mx_victims` no tiene índice único, así que una recarga sin cuidado duplicaría filas. La migración lo resuelve.
- Conclusión: la información perdida se recupera **volviendo a consultar el histórico** de ransomware.live PRO. No hace falta ni sirve restaurar un respaldo de Supabase.

## Paso 1: Respaldo (5 min)

1. Exportar el JSON completo de WF7 desde n8n.
2. Guardarlo en `n8n_workflows.definition` (hoy solo guarda el nombre del archivo).
3. Revisar el historial de ejecuciones de WF7 de los últimos 30 días y buscar errores 401 o 429 de ransomware.live PRO.

## Paso 2: Migración (VoBo)

Revisar y aplicar `intel/migrations/20260923_intel_victims_hardening.sql`. Los `UPDATE` van comentados para correrlos aparte.

## Paso 3: Nodo nuevo en WF7 (o flujo WF7b "Victims MX")

```
Schedule 6h
 → HTTP  GET {PRO}/countryvictims/MX          (X-API-KEY)
 → Code  normalizar: victim_name, group_slug, attack_date, discovered_at,
         description, victim_domain, data_size, press_urls, raw
 → Supabase upsert ransomware_mx_victims
         on conflict (lower(victim_name), group_slug, attack_date)
         → actualizar last_seen_at, description, press_urls, raw
 → IF    fila nueva
 → Supabase insert darkweb_intel
         provenance='observed', confidence='unverified',
         source='ransomware.live', intel_type='victim_announcement',
         company_name, threat_group, summary (de qué se trata), victim_ref
 → Log   system_log.metadata = {http_status, fetched, inserted, updated, errors}
```

- **Group Intel:** después del upsert, `GET {PRO}/groups/{group_slug}` → guardar en `blacktrace_group_intel`. Hoy se pierde en `comops_events.blacktrace_group_profile` (1 de 377).
- **Prensa:** `GET {PRO}/press/recent` → llenar `press_urls` de la víctima que corresponda.

## Paso 4: Recarga del histórico (una sola vez)

- Correr el nodo del Paso 3 manualmente sobre todo `countryvictims/MX` (o por rango, desde 2026-04-08 hasta hoy).
- Cuota: 3000 llamadas al día; basta con una llamada por país más una por grupo nuevo.
- Resultado esperado: víctimas en México de abril a septiembre de 2026 dentro de `ransomware_mx_victims` y `darkweb_intel`.

## Paso 5: Validación (consultas)

```sql
-- datos frescos
select max(first_seen_at), max(last_seen_at), count(*) from ransomware_mx_victims;
-- víctimas reales en darkweb_intel
select provenance, confidence, count(*) filter (where company_name is not null) con_empresa, count(*)
from darkweb_intel group by 1,2;
-- sin duplicados
select lower(victim_name), group_slug, attack_date, count(*) from ransomware_mx_victims
group by 1,2,3 having count(*)>1;
-- bitácora con detalle
select created_at, metadata from system_log where action='blacktrace_intel' order by created_at desc limit 5;
```

## Pendientes

- Atender la cola: 74 eventos de `comops_events` con AP ≥ 7 sin procesar.
- Monitoreo de Telegram y de revendedores de datos (casos Aeroméxico / "Eternal"): hace falta un proveedor comercial, porque ransomware.live no lo cubre.
- Dar de alta a "Eternal" en `villain_canonical` como revendedor o intermediario (requiere VoBo).
- RLS apagado en 10 tablas `zdu_flow_*` / `zdu_video_*` (aviso de Supabase).
