# ADR-0006 — Modular Architecture First, Progressive Microservices

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 — Target Architecture
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** All Core Architecture Work Units

## Context

Premature microservice decomposition creates distributed complexity, operational overhead, and fragmented ownership before scale or organizational needs justify it.

## Decision

Atlazora will begin with a modular architecture centered on the Go transactional core.

Modules may be extracted into independently deployed services only when justified by concrete scaling, reliability, security, ownership, or operational requirements.

## Rationale

This preserves clean boundaries without paying unnecessary distributed-system costs from day one.

## Alternatives Considered

### Microservices From Day One

Rejected due to excessive early complexity.

### Unstructured Monolith

Rejected because it would make future extraction and ownership boundaries painful.

## Consequences

### Positive

- Lower operational complexity.
- Explicit modular boundaries.
- Easier transactional consistency.
- Future service extraction remains possible.

### Negative / Trade-offs

- Requires discipline to preserve internal module boundaries.

## Security Impact

Module boundaries must not weaken authorization or privilege separation.

## Data / Migration Impact

Data ownership remains explicit even while modules share the initial runtime.

## Operational Impact

Service extraction requires a future ADR.

## Supersession

None.
