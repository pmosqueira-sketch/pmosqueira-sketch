-- PROPUESTA · NO APLICADA · Requiere VoBo de Pablo antes de correr en zdu-universe
-- Objetivo: guardar víctimas reales (no solo CVEs), con procedencia, nivel de confianza y el "de qué se trata".

-- 1) ransomware_mx_victims: deduplicar y guardar el contexto completo
alter table public.ransomware_mx_victims
  add column if not exists discovered_at   timestamptz,           -- 'discovered' de ransomware.live
  add column if not exists description     text,                  -- de qué se trata (texto del grupo o de la prensa)
  add column if not exists victim_domain   text,
  add column if not exists data_types      text[],                -- p.ej. {nombre,correo,telefono,rfc}
  add column if not exists record_count    bigint,
  add column if not exists data_size       text,                  -- p.ej. '172.9 GB'
  add column if not exists last_seen_at    timestamptz default now(),
  add column if not exists raw             jsonb;                 -- respuesta completa de la API (auditoría)

create unique index if not exists ux_rw_mx_victim
  on public.ransomware_mx_victims (lower(victim_name), group_slug, attack_date);

-- 2) darkweb_intel: separar lo observado de lo inferido
alter table public.darkweb_intel
  add column if not exists provenance    text default 'observed'
    check (provenance in ('observed','inferred','manual')),
  add column if not exists confidence    text default 'unverified'
    check (confidence in ('verified','corroborated','unverified','disputed')),
  add column if not exists summary       text,                    -- de qué se trata, 1–3 líneas
  add column if not exists data_types    text[],
  add column if not exists record_count  bigint,
  add column if not exists victim_ref    uuid references public.ransomware_mx_victims(id) on delete set null,
  add column if not exists raw           jsonb;

-- 3) Corregir la procedencia de las 508 filas históricas inferidas a partir de CVEs (paso de datos; correr por separado)
-- update public.darkweb_intel
--    set provenance = 'inferred', source = 'blacktrace_inference'
--  where cve_id is not null and company_name is null and source = 'ransomware.live';

-- 4) Marcar los dos registros manuales de hoy
-- update public.darkweb_intel set provenance='manual', confidence='verified'
--  where id = '5260ade3-3514-4e40-b655-4aa501c14cad';
-- update public.darkweb_intel set provenance='manual', confidence='unverified'
--  where id = '8d8c2c1d-3556-45c1-ad45-e387fd6900fe';
