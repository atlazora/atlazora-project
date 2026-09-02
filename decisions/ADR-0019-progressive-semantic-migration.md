# ADR-0019 — Progressive Semantic Migration

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 08 — Migration Strategy
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Migration-Affected Work Units

## Context

The target Atlazora architecture and domain model are not a mechanical copy of the legacy Laravel system. A big-bang rewrite or table-for-table migration would preserve legacy constraints and create high cutover risk.

## Decision

Atlazora will use Progressive Semantic Migration.

Business capabilities and data will move progressively into the target domain model while preserving explicit compatibility and ownership rules during transition.

## Rationale

This enables controlled migration while allowing the target system to implement the approved domain architecture rather than mirror legacy structure.

## Alternatives Considered

### Big-Bang Migration

Rejected due to cutover and validation risk.

### Mechanical Schema Copy

Rejected because it would encode legacy design into the target model.

## Consequences

### Positive

- Lower migration risk.
- Domain redesign can be implemented intentionally.
- Progressive validation and rollback opportunities.

### Negative / Trade-offs

- Temporary coexistence increases migration coordination complexity.

## Security Impact

Migration paths must preserve authorization, privacy, and audit requirements.

## Data / Migration Impact

Every migrated data type requires mapping, validation, ownership transition, and completion criteria.

## Operational Impact

Migration monitoring, reconciliation, fallback, and cutover runbooks are required.

## Supersession

None.
