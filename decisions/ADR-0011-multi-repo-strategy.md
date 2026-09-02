# ADR-0011 — Multi-Repository Strategy

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 09
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Cross-Repository Work Units

## Context

Atlazora has distinct application, backend, intelligence, contract, infrastructure, legacy, and governance responsibilities with different toolchains and deployment lifecycles.

## Decision

Atlazora will use the eight official repositories defined in the project governance baseline.

No extra service repository is created merely because a domain module exists.

## Rationale

The repository boundaries align major engineering responsibilities while preventing uncontrolled repository proliferation.

## Alternatives Considered

### Single Monorepo

Not selected in the approved architecture baseline.

### Repository Per Domain/Microservice From Day One

Rejected because it would prematurely lock the project into distributed service boundaries.

## Consequences

### Positive

- Clear toolchain and ownership boundaries.
- Independent CI/deployment where appropriate.
- Contracts and governance have dedicated homes.

### Negative / Trade-offs

- Cross-repository changes require coordination.

## Security Impact

Repository permissions, secrets, CI credentials, and branch protections must be managed consistently.

## Data / Migration Impact

None directly.

## Operational Impact

Shared GitHub governance conventions are required across repositories.

## Supersession

None.
