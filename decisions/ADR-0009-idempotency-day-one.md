# ADR-0009 — Idempotency From Day One

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 10
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Retryable APIs, Events, Payments, Orders, and Similar Flows

## Context

Network retries, client retries, event redelivery, webhook retries, and infrastructure failures can cause the same logical operation to be processed more than once.

## Decision

Idempotency is a foundational design requirement from Day One for operations where duplicate execution could create incorrect business effects.

## Rationale

Idempotency protects correctness under realistic distributed-system retry behavior.

## Alternatives Considered

### Assume Requests Are Delivered Once

Rejected because it is not a reliable distributed-system assumption.

### Handle Duplicates Manually After Incidents

Rejected because prevention is part of correctness.

## Consequences

### Positive

- Safer retries.
- Reduced duplicate financial/commercial effects.
- More robust integrations.

### Negative / Trade-offs

- Requires idempotency keys, deduplication state, unique constraints, or equivalent mechanisms depending on the flow.

## Security Impact

Idempotency identifiers must not create information leaks or cross-tenant collisions.

## Data / Migration Impact

Some flows require persisted deduplication/idempotency records.

## Operational Impact

Duplicate attempt metrics and idempotency failures should be observable where important.

## Supersession

None.
