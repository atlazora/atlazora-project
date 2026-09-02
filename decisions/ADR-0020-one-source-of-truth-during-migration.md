# ADR-0020 — One Source of Truth Per Data Type During Migration

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 08
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Migration-Affected Work Units

## Context

Legacy and target systems will temporarily coexist. Allowing both systems to independently write the same business data creates conflict, reconciliation problems, and unclear authority.

## Decision

At every point in migration, each data type must have exactly one authoritative source of truth.

Replication, compatibility views, and derived copies may exist, but write ownership must remain explicit.

## Rationale

This prevents split-brain business state and makes ownership transitions testable.

## Alternatives Considered

### Dual Independent Write Ownership

Rejected because it creates ambiguity and conflict risk.

## Consequences

### Positive

- Clear migration authority.
- Easier reconciliation and incident diagnosis.
- Safer cutover.

### Negative / Trade-offs

- Migration sequencing must explicitly coordinate ownership transitions.

## Security Impact

Authorization and audit behavior must follow the authoritative write path.

## Data / Migration Impact

Every migration plan must state old owner, new owner, transition mechanism, validation, and cutover point.

## Operational Impact

Source-of-truth state must be documented and observable during migration.

## Supersession

None.
