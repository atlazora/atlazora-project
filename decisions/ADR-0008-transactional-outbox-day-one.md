# ADR-0008 — Transactional Outbox From Day One

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 10
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Event-Producing Transactional Work Units

## Context

Writing transactional state and publishing integration events as independent operations can create inconsistent system state if one succeeds and the other fails.

## Decision

Atlazora will use the Transactional Outbox pattern from the beginning for transactional changes that require reliable event publication.

## Rationale

The pattern allows the business transaction and durable publication intent to be committed atomically.

## Alternatives Considered

### Direct Publish After Database Commit

Rejected because failures between commit and publish can permanently lose events.

### Distributed Transactions

Rejected as unnecessary complexity for the target architecture.

## Consequences

### Positive

- Reliable event publication.
- Better recovery and reconciliation.
- Clear retry model.

### Negative / Trade-offs

- Requires outbox processing, cleanup, monitoring, and idempotent consumers.

## Security Impact

Outbox data may contain sensitive business metadata and must follow appropriate access controls.

## Data / Migration Impact

Transactional schemas may include outbox storage.

## Operational Impact

Outbox lag, failures, retries, and backlog must be observable.

## Supersession

None.
