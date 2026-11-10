-- Banco de dados do Prisma Portal (Supabase / PostgreSQL)
-- Cole este arquivo em: Supabase > SQL Editor > New query > Run

create table if not exists public.kv (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.kv enable row level security;

-- ATENÇÃO: política de DEMONSTRAÇÃO. Libera leitura e escrita para quem tiver a
-- chave "anon" (que fica visível no código do site). Use só com dados fictícios.
drop policy if exists kv_demo on public.kv;
create policy kv_demo on public.kv for all to anon using (true) with check (true);
