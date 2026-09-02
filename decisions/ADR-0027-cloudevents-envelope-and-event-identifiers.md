# ADR-0027 — CloudEvents Envelope and Event Identifier Convention

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 09 / Phase 10
- **Related Wave(s):** W00
- **Related Work Unit(s):** W00-WU04, W00-WU05, Event-Producing and Event-Consuming Work Units

## Context

Atlazora has already established that:

- asynchronous events are used where asynchronous integration is appropriate.
- events must not weaken transactional consistency or authoritative domain ownership.
- shared executable event schemas belong in `atlazora-contracts`.
- business events must be structured and versioned.
- meaningful event evolution must be compatibility-aware.
- distributed delivery may be duplicated, delayed, retried, or reordered.
- business correctness must not depend on exactly-once delivery.
- publication and consumption require traceability through correlation/context identifiers and event identifiers.
- the exact event envelope and event-ID convention were intentionally deferred to the Engineering Foundation contracts decision.

W00-WU04 must resolve these two conventions without selecting the final event broker, routing model, retry implementation, dead-letter mechanism, or event runtime implementation owned by later work.

No existing Atlazora event-envelope field-name convention has been approved.

A standardized envelope is preferable to a proprietary transport-specific format because Atlazora's event contracts must remain portable across the final broker decision and future integration boundaries.

## Decision

Atlazora will use CloudEvents 1.0 semantics as the foundational business-event envelope.

For JSON-serialized structured event contracts, the envelope follows the CloudEvents JSON Event Format.

The foundational envelope uses the following CloudEvents attributes:

### Required Core Attributes

- `specversion`
- `id`
- `source`
- `type`

`specversion` is `1.0`.

### Required Atlazora Attributes

In addition to the CloudEvents-required attributes, Atlazora business events require:

- `time`
- `datacontenttype`
- `dataschema`
- `data`

`time` represents when the business occurrence happened, not when a later consumer received the event.

For W00-WU04 JSON business-event contracts:

- `datacontenttype` is `application/json`.
- `data` contains the domain-owned event payload.
- `dataschema` identifies the versioned schema governing `data`.

### Optional Context Attributes

CloudEvents `subject` may be used when an event has a meaningful subject within the context identified by `source`.

Correlation and causation metadata may be represented through CloudEvents-compatible extension attributes when required by a producing flow.

Their exact runtime propagation behavior belongs to the appropriate implementation Work Units.

Sensitive authorization tokens, credentials, secrets, or unnecessary personally sensitive context must not be embedded in the event envelope.

## Event Type Convention

`type` identifies the semantic business event, not the broker topic, queue, routing key, handler, or implementation class.

Event types must be stable, explicit, and version-aware through the versioned contract/schema system.

Transport topology must not redefine event semantics.

## Source Convention

`source` identifies the authoritative producing context/domain for the event.

It must remain stable enough that the combination of `source` and `id` identifies a distinct event according to CloudEvents semantics.

`source` must not encode secrets, infrastructure credentials, ephemeral host identities, pod names, or deployment-specific addresses.

## Event Identifier Convention

Atlazora event `id` values use RFC 9562 UUID Version 7.

The serialized representation uses the canonical textual UUID form.

A new distinct business event receives a new UUIDv7.

A retry or redelivery of the same already-created event preserves the same event `id`.

A consumer must not treat a newly generated delivery attempt ID as the business event identity.

Event identity is independent from:

- broker message identifiers.
- delivery attempt identifiers.
- outbox row identifiers.
- request identifiers.
- correlation identifiers.
- domain aggregate identifiers.

Those identifiers may be related operationally but must not silently substitute for the CloudEvent `id`.

## Duplicate Semantics

The event identity boundary follows CloudEvents semantics:

`source + id`

identifies a distinct event.

Repeated delivery with the same `source` and `id` is therefore eligible to be treated as duplicate delivery of the same event.

This convention supports, but does not itself implement, W00-WU05 idempotent consumption.

## Time Convention

CloudEvents `time` uses an RFC 3339 timestamp normalized to UTC.

The event occurrence timestamp and UUIDv7 event identifier serve different purposes.

The embedded time ordering of UUIDv7 must not be treated as a substitute for the explicit `time` attribute.

Business ordering correctness must not rely solely on UUID lexical ordering or event delivery order.

## Payload Ownership

`data` describes something that occurred in the authoritative producing domain.

Publishing an event does not transfer ownership of the producer's authoritative data.

Consumers may project or react through state they own, but event consumption must not establish conflicting write ownership of producer-owned transactional truth.

## Schema and Versioning

The executable event envelope and event payload schemas belong in `atlazora-contracts`.

Event schemas must be versioned and compatibility-aware.

`dataschema` points to the applicable versioned event-data schema.

A schema change that is materially breaking must be detected by the contract compatibility workflow established by W00-WU04.

Exact business-domain event catalogs are introduced by their owning later Work Units rather than invented in W00-WU04.

## Transport Independence

This decision does not select:

- the final broker/provider.
- Kafka.
- broker topics or queues.
- routing or partition keys.
- dead-letter implementation.
- retry/backoff implementation.
- retention periods.
- replay configuration.
- publisher or consumer runtime implementation.
- Transactional Outbox physical schema.

Those remain owned by the applicable Engineering Foundation and feature Work Units.

## Rationale

CloudEvents provides a vendor-neutral standardized event metadata model and avoids creating an Atlazora-specific envelope where a mature interoperability standard already exists.

Its required `id`, `source`, `specversion`, and `type` attributes establish clear portable event identity and semantics.

The JSON Event Format provides an explicit structured representation suitable for machine-readable schemas in `atlazora-contracts`.

Using explicit `time`, `dataschema`, and `datacontenttype` attributes strengthens traceability and schema/version validation.

UUIDv7 is a standardized UUID format with time-ordered characteristics and does not depend on MAC-address identity.

Preserving the same event ID across retries and redeliveries supports the already-approved duplicate-delivery and idempotency architecture.

Separating event identity from broker message identity, outbox identity, request identity, and correlation identity prevents transport or persistence details from becoming business-event semantics.

## Alternatives Considered

### Custom Atlazora Event Envelope

Not selected.

A proprietary envelope would require Atlazora to define and maintain semantics already covered by a widely adopted vendor-neutral event specification.

It would also increase coupling between producers, consumers, tooling, and future transport choices.

### Broker-Native Message Envelope

Rejected as the foundational contract.

The final event broker remains intentionally unresolved.

Contract semantics must not depend on broker-specific metadata or topology.

### UUIDv4 Event Identifiers

A valid uniqueness mechanism, but not selected.

UUIDv7 provides standardized UUID identity while also providing useful time-ordered characteristics for operational inspection and storage locality where applicable.

Consumers must still use explicit event time and business semantics rather than infer correctness from UUID ordering.

### ULID Event Identifiers

A credible time-sortable identifier format, but not selected.

UUIDv7 is standardized by RFC 9562 within the UUID family and avoids introducing an additional identifier standard when a current UUID standard satisfies the requirement.

### Database Sequence Event Identifiers

Rejected.

Database-local sequential identifiers couple event identity to a particular persistence boundary and complicate distributed uniqueness and future service extraction.

### New ID on Every Delivery Attempt

Rejected.

A retry or duplicate delivery is not a new business occurrence.

Changing the event ID on redelivery would weaken duplicate detection and idempotency behavior.

### Event ID Reused as Correlation ID

Rejected.

Event identity and cross-operation correlation represent different concepts and must remain independently meaningful.

## Consequences

### Positive

- Vendor-neutral event-envelope semantics.
- Explicit portable event identity.
- Stable duplicate-detection boundary.
- Clear separation between event, request, correlation, broker, and persistence identifiers.
- Explicit schema linkage.
- Stronger event traceability.
- Transport independence is preserved.
- W00-WU05 can implement idempotency without redefining event identity.
- Future producers and consumers share one executable envelope contract.

### Negative / Trade-offs

- Producers and consumers must preserve CloudEvents semantics.
- UUIDv7 generation must be implemented correctly in producing runtimes.
- Required `dataschema` maintenance introduces explicit schema-governance work.
- CloudEvents extension attributes require governance when new cross-cutting metadata is introduced.
- Developers must distinguish event occurrence time from delivery time and UUID ordering.

## Security Impact

Event envelopes must not expose secrets, authentication tokens, infrastructure credentials, or unnecessary sensitive information.

`source`, `subject`, correlation metadata, and `data` require the same data-classification and least-disclosure discipline as other contracts.

UUIDv7 must not be treated as an authorization mechanism or an unguessable security token.

Consumers must validate event structure and schema before trusting payload content.

Schema/version checks must not silently weaken authentication, authorization, privacy, or tenant/domain isolation requirements.

## Data / Migration Impact

This decision does not change authoritative data ownership.

Legacy event formats, if introduced during migration, require explicit mapping into the target CloudEvents-compatible contract rather than becoming competing permanent envelope conventions.

Duplicate and replay processing must preserve source-of-truth rules.

The event `id` does not replace business entity identifiers or legacy traceability identifiers.

## Operational Impact

Logs, traces, publisher state, consumer processing state, retries, and reconciliation workflows should retain the CloudEvent `id` and `source` where applicable.

Operational tooling may use UUIDv7 time ordering as an aid, but correctness must not depend on it.

Broker-specific message metadata may be recorded separately without replacing the event's contract identity.

W00-WU05 will implement the runtime Outbox/publisher/retry/idempotency behavior against this contract boundary.

## Related Decisions

- ADR-0003 — Go Transactional Core
- ADR-0007 — PostgreSQL as Transactional Source of Truth
- ADR-0008 — Transactional Outbox From Day One
- ADR-0009 — Idempotency From Day One
- ADR-0010 — REST and OpenAPI Versioned Contracts
- ADR-0021 — Testing and Security Integrated Into Every Work Unit
- ADR-0022 — Git as Permanent Project Memory
- ADR-0026 — Contract Specifications and Validation Toolchain

## Supersession

None.
