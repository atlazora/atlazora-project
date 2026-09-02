# ADR-0017 — Search Is Derived and Rebuildable

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06
- **Related Wave(s):** W05 and Cross-cutting
- **Related Work Unit(s):** Search and Discovery Work Units

## Context

Search systems are optimized for discovery rather than transactional consistency and should not become hidden systems of record.

## Decision

Atlazora search indexes are derived projections and must be rebuildable from authoritative data sources.

## Rationale

This protects transactional ownership and permits search technology or index changes without losing business truth.

## Alternatives Considered

### Search Index as Primary Business Database

Rejected.

## Consequences

### Positive

- Search can evolve independently.
- Index corruption can be repaired through rebuild.
- Clear source-of-truth ownership.

### Negative / Trade-offs

- Requires indexing pipelines and reconciliation/rebuild procedures.

## Security Impact

Search projections must not expose unauthorized or sensitive records merely because indexed data exists.

## Data / Migration Impact

Search data may lag or be rebuilt but cannot own authoritative transactional state.

## Operational Impact

Index lag, indexing failures, rebuild duration, and consistency expectations must be observable.

## Supersession

None.
