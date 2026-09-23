# Validación de WF7 (Blacktrace · Dark Web Forensics) y WF-OTX-FEED

Fecha: 2026-09-23 · Método: consultas de solo lectura a Supabase (`zdu-universe`). No hubo acceso a la instancia de n8n.

## Resumen

**WF7 corre, pero no entrega la inteligencia que se esperaba de él.** Enriquece CVEs, no rastrea víctimas: no detectó a Aeroméxico en septiembre de 2026 y no hubiera detectado a "Eternal".

## Qué funciona

| Punto | Evidencia |
|---|---|
| WF7 activo, cada 6 horas | Último `blacktrace_intel` en `system_log`: 2026-09-21 23:36; última actualización en `comops_events`: 2026-09-23 04:47 |
| Brief de Claude | 377 de 378 eventos procesados tienen `blacktrace_brief` |
| WF-OTX-FEED al día | `otx_pulses`: 636 pulsos, el último del 2026-09-23 12:30 |

## Hallazgos

| # | Hallazgo | Impacto |
|---|---|---|
| 1 | **El respaldo de WF7 en `n8n_workflows` está incompleto.** `definition` solo guarda `{"file": "ZDU_WF7_Blacktrace_v1_0.json", "nodes": 11}`, mientras las notas hablan de 25 nodos (fases OTX y ThreatFox + Tor). | No se puede revisar la lógica real desde Supabase; el respaldo no sirve para recuperar el flujo. |
| 2 | **`ransomware_mx_victims` se cargó una sola vez** (las 216 filas tienen `first_seen_at` del 2026-04-08 23:49). | La lista de víctimas en México lleva 5.5 meses congelada. |
| 3 | **`darkweb_intel` está guiado por CVEs, no por víctimas.** 508 de 510 filas tienen `cve_id` y solo 2 tienen `company_name` (las dos que registramos hoy). Los `threat_group` son atribuciones supuestas ("APT40 (probable)", "Lazarus (probable)"). Todo lleva `source = ransomware.live`. | La etiqueta de fuente es engañosa: parece dato de ransomware.live y es una inferencia. No sirve para buscar empresas atacadas. |
| 4 | **La información de grupos y prensa de ransomware.live PRO no llega a la base.** `blacktrace_group_profile` tiene datos en 1 de 377 eventos; `blacktrace_press_mx` en 0. | Los nodos "Group Intel" y press/recent no se están guardando. |
| 5 | **74 eventos pendientes** con AP ≥ 7 y `blacktrace_triggered = false`. | Hay atraso en la cola. |
| 6 | **`system_log` sin detalle:** la `metadata` de `blacktrace_intel` llega vacía (`{}`); hubo 10 entradas con patrón de error en 30 días. | No se puede diagnosticar desde la bitácora. |
| 7 | **`alert_sent` nunca se usa** (0 de 510 en `true`). | El campo de alertas no tiene efecto. |
| 8 | **No hay cobertura de Telegram ni de brokers de datos.** Las fuentes son ransomware.live, URLhaus, MalwareBazaar y OTX. | Casos como Aeroméxico en Telegram o "Eternal" quedan fuera del radar. |

## Recomendaciones (en orden)

1. **Respaldar el JSON completo de WF7** en `n8n_workflows.definition` (exportarlo desde n8n).
2. **Un flujo de víctimas separado del de CVEs:** consultar `countryvictims/MX` cada 6 horas, guardar en `ransomware_mx_victims` sin duplicar por `victim_name` y `attack_date`, y crear en `darkweb_intel` una fila por víctima con `company_name`.
3. **Corregir la procedencia:** las filas inferidas a partir de un CVE deben llevar `source = 'blacktrace_inference'`, no `ransomware.live`.
4. **Revisar los nodos Group Intel y press/recent:** mapeo de salida, API key y cuota de 3000 llamadas al día.
5. **Guardar en `system_log.metadata`** el estado HTTP, los conteos y el CVE de cada ejecución.
6. **Agregar monitoreo de menciones** (Telegram y foros) por palabras clave de marcas mexicanas, mediante un proveedor comercial de inteligencia de amenazas.

## Pendiente de validar en n8n

- Historial de ejecuciones de WF7 (errores 401/429 de ransomware.live PRO).
- El contenido real de los 25 nodos y si existe el nodo INSERT de `darkweb_intel` que marcaban las notas de abril.
