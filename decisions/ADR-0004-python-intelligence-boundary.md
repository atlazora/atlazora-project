# ADR-0004 — Python Intelligence Boundary

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 — Target Architecture
- **Related Wave(s):** Cross-cutting
- **Related Work Unit(s):** Intelligence and Data Work Units

## Context

Atlazora requires data-oriented, analytical, ranking, intelligence, and future ML capabilities while maintaining a clear transactional source of truth.

## Decision

Python workloads will live in `atlazora-intelligence`.

Python components may analyze, derive, enrich, rank, or process data but must not silently become the authoritative transactional system.

## Rationale

Python is well suited for data and intelligence workloads while the boundary preserves transactional ownership in the Go core.

## Alternatives Considered

### Put All Intelligence Logic in the Transactional Core

Rejected because it unnecessarily couples data-oriented workloads to transactional runtime concerns.

### Use Python as Transactional Source of Truth

Rejected because it violates the approved architecture boundary.

## Consequences

### Positive

- Clear responsibility boundary.
- Appropriate ecosystem for analytics and ML.
- Independent evolution of intelligence workloads.

### Negative / Trade-offs

- Requires explicit contracts between transactional and intelligence systems.

## Security Impact

Intelligence workloads must receive only the data and permissions they require.

## Data / Migration Impact

Derived intelligence outputs must remain distinguishable from authoritative transactional data.

## Operational Impact

Python environments, dependency management, CI, observability, and deployment standards are required.

## Supersession

None.
