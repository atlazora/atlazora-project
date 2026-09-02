# ADR-0007 — PostgreSQL as Transactional Source of Truth

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 05 / Phase 06
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Transactional Data Work Units

## Context

Marketplace transactions require durable relational state, consistency, constraints, transactions, and reliable recovery.

## Decision

PostgreSQL is the authoritative transactional datastore for the target Atlazora platform.

## Rationale

PostgreSQL provides strong transactional semantics, relational integrity, indexing capabilities, mature operational tooling, and broad managed-service support.

## Alternatives Considered

### Redis as Transactional Store

Rejected. Redis is ephemeral only.

### Search Engine as System of Record

Rejected. Search is derived and rebuildable.

## Consequences

### Positive

- Strong transactional consistency.
- Explicit authoritative data location.
- Mature migration and backup ecosystem.

### Negative / Trade-offs

- Schema evolution and migrations require discipline.

## Security Impact

Database access must follow least privilege and managed secret practices.

## Data / Migration Impact

Legacy transactional truth progressively migrates into PostgreSQL-controlled target schemas.

## Operational Impact

Backups, recovery, availability, monitoring, and managed production operation are mandatory concerns.

## Supersession

None.
