# ADR-0030: React + Vite Admin Application Framework

- **Status:** Proposed
- **Date:** 2026-09-04
- **Decision Owners:** Architecture / Engineering
- **Scope:** `atlazora-admin`, W00-WU08 Admin Foundation
- **Related:** ADR-0025, ADR-0029

## Context

ADR-0029 establishes React + TypeScript as the intended frontend presentation ecosystem and intentionally delegates the exact Admin/Operations application framework selection to W00-WU08 readiness and architecture review.

W00-WU08 readiness found no Admin-specific requirement for SSR, SSG, SEO, public anonymous rendering, or another capability that requires a server-oriented web application framework. The Admin/Operations surface is an authenticated operational application that consumes approved APIs and authoritative contracts.

ADR-0025 remains authoritative for Admin/Operations application boundaries. Routine Admin workflows must not bypass approved application APIs, domain behavior, authorization, attribution, validation, or auditability.

## Decision

`atlazora-admin` will use:

- React
- TypeScript
- Vite

for the W00-WU08 Admin application foundation.

Vite is selected as the Admin application build and development framework. Next.js is not selected for the W00-WU08 Admin foundation because the assessed Admin scope does not establish an Admin-specific SSR, SSG, SEO, public-facing rendering, or server-framework requirement.

This decision resolves the Admin framework selection intentionally delegated by ADR-0029. It does not supersede ADR-0029 and does not change the framework decision for `atlazora-web`.

## Application Boundaries

The Admin presentation foundation must:

- consume approved application APIs and authoritative domain behavior;
- treat `atlazora-contracts` as the authoritative contract source;
- preserve clear Services/Adapters boundaries where external or infrastructure concerns meet presentation code;
- support permission-aware navigation and presentation behavior without treating frontend visibility as authorization authority;
- preserve backend/domain authorization as authoritative;
- avoid routine direct database manipulation;
- avoid creating an uncontrolled alternative source of business truth;
- preserve attribution, validation, and auditability for privileged or materially consequential actions.

## Consequences

### Positive

- The Admin runtime remains focused on authenticated operational workflows.
- The Admin application avoids adopting server-framework complexity without an identified requirement.
- React + TypeScript conventions can remain aligned across the frontend ecosystem while allowing `atlazora-web` and `atlazora-admin` to use runtime choices appropriate to their separate responsibilities.
- W00-WU08 gains an explicit framework baseline before implementation begins.

### Trade-offs

- Server-rendering capabilities are not part of the W00-WU08 Admin foundation by default.
- A future requirement that materially needs SSR, SSG, SEO, server components, server actions, or equivalent server-framework capabilities requires explicit architecture review rather than silent framework expansion.
- Shared frontend conventions must not create accidental runtime coupling between `atlazora-web` and `atlazora-admin`.

## Non-Goals

This ADR does not:

- authorize W00-WU08 implementation;
- transition W00-WU08 to `IN_PROGRESS`;
- change `atlazora-web`;
- move backend business rules into the Admin application;
- authorize routine direct database access;
- absorb W00-WU09 infrastructure ownership;
- absorb W00-WU10 CI/CD and software supply-chain ownership;
- absorb W00-WU11 observability-platform ownership;
- absorb W00-WU12 broad security-baseline ownership;
- absorb W00-WU13 cross-foundation integration certification.

## Implementation Governance

W00-WU08 may begin implementation only after its separate `READY -> IN_PROGRESS` lifecycle transition is reviewed, committed, pushed, and validated according to repository governance.
