# Atlazora Event Architecture

## Purpose

Events provide explicit asynchronous integration where asynchronous behavior is appropriate.

Events must not weaken transactional consistency or obscure authoritative ownership.

## Transactional Outbox

Transactional Outbox is a Day One foundation.

When a transactional state change requires publication of an event, the state change and durable intent to publish must be committed atomically within the same transactional boundary where applicable.

Publication is performed asynchronously from the durable outbox state.

## Idempotency

Idempotency is a Day One foundation.

Consumers and externally retryable operations must be designed so duplicate requests or duplicate event delivery cannot silently create duplicate business effects.

Where a business operation can be retried, the idempotency boundary and result behavior must be explicit.

## Event Contracts

Shared executable event schemas belong in `atlazora-contracts`.

Business events must be structured and versioned.

Meaningful event evolution must be compatibility-aware.

The exact event envelope and event-ID conventions remain unresolved until the appropriate Engineering Foundation/contracts decision.

## Ownership

An event describes something that occurred in the owning domain.

Publication of an event does not transfer authoritative ownership of the producer's data.

Consumers may maintain projections or react through their own owned state.

They must not create conflicting ownership of the producer's authoritative state.

## Delivery Assumption

Distributed event delivery must be treated as potentially:

- duplicated.
- delayed.
- retried.
- reordered.

Business correctness must not depend on an unrealistic exactly-once delivery assumption.

## Event Transport Direction

Atlazora will begin with a lightweight, reliable event transport/broker appropriate to actual V1 requirements.

Kafka is not a Day One requirement merely because the platform uses events.

A higher-complexity event platform may be adopted later if justified by real requirements such as:

- throughput.
- replay.
- partitioning.
- consumer scale.
- ecosystem integration.
- operational needs.

The exact broker remains an explicit open decision.

## Transaction Boundaries

Cross-domain distributed database transactions are not the normal integration model.

A domain commits its own authoritative transactional state.

Reliable asynchronous propagation uses the Outbox/event mechanism where applicable.

Consumers update only state they own.

## Failure Handling

Event processing must explicitly consider:

- retries.
- duplicate delivery.
- poison/failing messages.
- backoff.
- dead-letter or equivalent failure handling where appropriate.
- reconciliation.
- replay/rebuild needs.

Exact broker-specific mechanisms are selected when the transport is chosen.

## Observability

Event publication and consumption must be traceable where applicable through:

- structured logs.
- metrics.
- correlation/context identifiers.
- event identifiers once the convention is finalized.
- publication status.
- consumer processing status.
- retry/failure visibility.

## Recovery

Derived consumers must support replay, rebuilding, reconciliation, or equivalent recovery mechanisms where required by business risk.

Search, analytics projections, and similar derived consumers must not require manual recreation of authoritative transactional facts.

## Intelligence Integration

Python Intelligence may consume events or approved data feeds for analysis, scoring, enrichment, or projections.

It must not use event consumption as a path to directly mutate Core-owned transactional truth.

Where an intelligence result affects a transactional decision, the owning Core domain remains authoritative.

## Notifications

Notification delivery may consume approved business events.

Notification state does not replace the originating domain's authoritative business state.

## Open / Unresolved

The following remain intentionally unresolved:

- exact broker/provider.
- exact event envelope.
- exact event-ID convention.
- exact partitioning/routing model.
- exact dead-letter implementation.
- exact retention/replay configuration.

These decisions belong to the appropriate Engineering Foundation Work Units and must not be guessed during planning preservation.
