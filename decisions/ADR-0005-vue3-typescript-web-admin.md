# ADR-0005 — Vue 3 and TypeScript for Web and Admin

- **Status:** Superseded
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 — Target Architecture
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Frontend Work Units

## Context

Atlazora requires separate buyer/supplier marketplace and admin/operations frontends with maintainable typed client code.

## Decision

`atlazora-web` and `atlazora-admin` will use Vue 3 with TypeScript.

## Rationale

The stack provides a modern component model, strong TypeScript integration, ecosystem maturity, and maintainable frontend architecture.

## Alternatives Considered

Alternative frontend frameworks were not selected in the approved architecture baseline.

## Consequences

### Positive

- Shared frontend engineering conventions.
- Strong compile-time typing.
- Clear separation of marketplace and administrative surfaces.

### Negative / Trade-offs

- Shared code must be intentionally managed to avoid hidden coupling between the two applications.

## Security Impact

Frontend authorization checks are user-experience controls only. Authoritative authorization remains server-side.

## Data / Migration Impact

None directly.

## Operational Impact

Both repositories require frontend CI, dependency scanning, testing, build, and deployment pipelines.

## Supersession

Superseded by ADR-0029 — React and TypeScript Web Presentation Architecture.
