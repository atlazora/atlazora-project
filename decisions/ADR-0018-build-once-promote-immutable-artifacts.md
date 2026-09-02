# ADR-0018 — Build Once, Promote Immutable Artifacts

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 07
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** CI/CD and Deployment Work Units

## Context

Rebuilding application artifacts independently per environment can introduce unverified differences between tested and production software.

## Decision

Atlazora will build an artifact once and promote that same immutable artifact through environments.

Environment-specific behavior must come from configuration and secret injection rather than rebuilding application code.

## Rationale

This increases deployment confidence and traceability.

## Alternatives Considered

### Rebuild Separately for Each Environment

Rejected because it weakens artifact identity and reproducibility.

## Consequences

### Positive

- Same tested artifact reaches production.
- Stronger rollback and traceability.
- Easier provenance verification.

### Negative / Trade-offs

- Configuration management must be cleanly separated from build output.

## Security Impact

Artifact integrity, provenance, image/package scanning, and registry permissions become important controls.

## Data / Migration Impact

Database migrations must be coordinated with immutable application releases.

## Operational Impact

CI/CD must record artifact identity and promotion state.

## Supersession

None.
