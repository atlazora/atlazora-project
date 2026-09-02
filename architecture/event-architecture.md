# Atlazora Event Architecture

## Purpose

Events provide explicit asynchronous integration where asynchronous behavior is appropriate.

Events must not weaken transactional consistency or obscure ownership.

## Transactional Outbox

Transactional Outbox is a Day One foundation.

When a transactional state change requires publication of an event, the state change and the durable intent to publish must be committed atomically within the same transactional boundary where applicable.

## Idempotency

Idempotency is a Day One foundation.

Consumers and externally retryable operations must be designed so duplicate requests or duplicate event delivery cannot silently create duplicate business effects.

## Event Contracts

Shared event schemas belong in `atlazora-contracts`.

Meaningful event evolution must be versioned and compatibility-aware.

## Ownership

An event describes something that occurred in the owning domain.

Consumers must not use an event stream to create conflicting ownership of the producer's authoritative state.

## Delivery Assumption

Distributed delivery must be treated as potentially duplicated, delayed, retried, or reordered unless a specific transport contract guarantees otherwise.

Business correctness must not depend on an unrealistic exactly-once delivery assumption.

## Observability

Event publication and consumption should be traceable through appropriate logs, metrics, correlation identifiers, and failure/dead-letter handling where applicable.

## Recovery

Derived consumers must support replay, rebuilding, reconciliation, or equivalent recovery mechanisms where required by business risk.
