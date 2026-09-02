# ADR-0016 — Redis Is Ephemeral Only

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 07
- **Related Wave(s):** Cross-cutting
- **Related Work Unit(s):** Cache, Coordination, and Rate-Control Work Units

## Context

Redis is useful for low-latency ephemeral workloads but using it as the only durable source of business truth increases data-loss and recovery risk.

## Decision

Redis may be used only for ephemeral concerns.

It must not be the sole authoritative durable store for transactional business data.

## Rationale

This preserves clear transactional truth in PostgreSQL while allowing Redis where its characteristics are appropriate.

## Alternatives Considered

### Redis as Primary Transactional Database

Rejected.

## Consequences

### Positive

- Clear durability boundary.
- Redis loss can be treated as recoverable for properly designed use cases.

### Negative / Trade-offs

- Systems must tolerate cache loss, eviction, and restart behavior.

## Security Impact

Redis network access, authentication, tenant separation, and sensitive cache data require appropriate controls.

## Data / Migration Impact

No authoritative business state may depend solely on Redis persistence.

## Operational Impact

Applications must support cache rebuilding or equivalent recovery.

## Supersession

None.
