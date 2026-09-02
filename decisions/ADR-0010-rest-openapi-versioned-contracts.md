# ADR-0010 — REST and OpenAPI Versioned Contracts

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** API-Producing Work Units

## Context

Multiple repositories and clients require explicit, testable, evolvable API contracts.

## Decision

Atlazora will use REST APIs with versioned OpenAPI contracts for externally meaningful synchronous service interfaces.

Shared API definitions belong in `atlazora-contracts`.

## Rationale

OpenAPI provides a machine-readable source for documentation, validation, tooling, client generation, and contract testing.

## Alternatives Considered

Alternative protocols may be introduced only when justified by a future decision.

## Consequences

### Positive

- Explicit interfaces.
- Stronger client/server coordination.
- Contract testing and tooling support.
- Controlled compatibility evolution.

### Negative / Trade-offs

- Contract changes require disciplined versioning and review.

## Security Impact

API contracts must represent authentication/authorization requirements and avoid exposing sensitive implementation details.

## Data / Migration Impact

Legacy and target APIs may temporarily coexist under explicit migration compatibility rules.

## Operational Impact

Contract validation and compatibility checks should be automated in CI.

## Supersession

None.
