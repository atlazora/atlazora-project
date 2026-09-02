# ADR-0028 — Shared API and Platform Contract Conventions

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 05 / Phase 06 / Phase 09 / Phase 10
- **Related Wave(s):** W00
- **Related Work Unit(s):** W00-WU04 and API-Producing Work Units

## Context

W00-WU04 owns the shared executable conventions for API versioning, API errors, pagination, money, identifiers, and timestamps.

Approved planning already requires versioned REST/OpenAPI contracts, explicit currency semantics, no floating-point arithmetic for authoritative money, normalized timestamps, and a public-safe identifier convention.

The approved planning deliberately left the exact money representation and public identifier convention unresolved for the Engineering Foundation.

ADR-0026 established OpenAPI 3.1.2, JSON Schema Draft 2020-12, and the validation and compatibility toolchain.

ADR-0027 established the CloudEvents envelope and UUIDv7 event identifier convention, but explicitly kept event identity separate from business entity identifiers.

The remaining shared conventions must now be made explicit before W00-WU04 creates executable schemas.

## Decision

The following conventions are proposed for shared Atlazora API and platform contracts.

### API Versioning

Externally meaningful synchronous APIs use a major version in the request path.

The initial major version is represented as /v1.

Compatible additive evolution remains within the same major API version.

A change that breaks an established external contract requires an explicitly reviewed compatibility decision and, when compatibility cannot be preserved, a new major API version such as /v2.

OpenAPI info.version identifies the contract release within that API major version and does not replace the path-level major-version boundary.

Clients must not be required to infer API versions from undocumented server behavior.

### API Error Contract

HTTP API problem responses use RFC 9457 Problem Details and the application/problem+json media type where a structured problem body is appropriate.

The shared problem contract uses the RFC 9457 members as applicable:

- type for the stable problem type identifier;
- title for the short human-readable problem summary;
- status for the HTTP status code;
- detail for occurrence-specific human-readable information;
- instance when an occurrence identifier or reference is appropriate.

Atlazora adds a stable machine-readable code extension for application-specific handling.

Validation problems may add an errors extension containing structured field or input violations.

Validation violations identify locations through stable machine-readable pointers rather than requiring clients to parse human-readable text.

Problem details must not expose credentials, secrets, stack traces, database errors, internal topology, or other sensitive implementation details.

HTTP status semantics remain authoritative and must not be redefined by application error codes.

### Pagination

Collection APIs that require pagination use cursor-based pagination as the shared default contract.

Requests use:

- cursor as an opaque continuation token when continuing a traversal;
- limit as the requested page size.

The cursor is an opaque value. Clients must not construct, parse, modify, or derive business meaning from it.

Responses expose the collection items and pagination metadata containing:

- next_cursor when another page can be requested;
- has_more to state whether additional results are available.

Endpoint-specific default and maximum limits may be stricter, but must be documented in the owning OpenAPI operation.

A global exact page-size maximum is not established by this ADR.

Offset-based pagination is not the shared default for mutable transactional collections. A specific endpoint may use another pagination strategy only when explicitly documented and justified by its semantics.

Pagination cursors are continuation state, not authorization credentials, and must not contain exposed secrets or unnecessary sensitive data.

### Money

Shared contract money values are represented as an object containing:

- amount: a base-10 decimal string;
- currency: an ISO 4217 three-letter alphabetic currency code.

amount must not be serialized as a JSON floating-point number.

The decimal string uses ordinary base-10 notation and does not use exponent notation.

The sign and scale permitted for a specific business field remain subject to that field's domain invariant. For example, an amount that cannot be negative must enforce that rule in its owning contract.

Currency is always explicit for monetary amounts.

The shared contract representation does not dictate PostgreSQL storage type, ledger storage strategy, provider representation, or internal calculation precision.

Rounding, minor-unit enforcement, FX precision, settlement precision, and provider-specific amount conversion remain explicit domain or payment implementation concerns and must not be inferred from JSON floating-point behavior.

### Public Contract Identifiers

New Atlazora-owned entity identifiers exposed through shared API contracts use RFC 9562 UUID Version 7 in canonical textual UUID form.

Public contract identifiers are treated as opaque values by clients.

Clients must not derive creation time, authorization, tenancy, sequencing correctness, or business meaning from identifier contents.

A UUIDv7 is an identifier, not a security token or authorization mechanism.

Database-local sequences and legacy identifiers must not become the default public identifier contract.

Where migration or traceability requires a legacy identifier, that identifier is represented separately and does not replace the Atlazora-owned identifier.

Event id remains governed separately by ADR-0027 even though both conventions use UUIDv7.

Request IDs, correlation IDs, idempotency keys, event IDs, and business entity IDs remain distinct semantic identifiers and must not silently substitute for each other.

### Timestamps

Shared API and platform timestamps use RFC 3339 date-time strings.

Authoritative serialized timestamps are normalized to UTC and use the Z UTC designator.

An explicit timestamp remains authoritative even when another identifier, such as UUIDv7, contains time-related bits.

Consumers must not depend on a fixed number of fractional-second digits unless an owning contract explicitly imposes such a requirement.

Display localization and user timezone rendering occur at presentation boundaries and do not change the authoritative UTC contract value.

Date-only business concepts must use an explicit date contract rather than being fabricated as midnight timestamps.

## Rationale

Path-level major API versioning makes the compatibility boundary visible in requests and OpenAPI descriptions while allowing additive evolution inside a stable major version.

RFC 9457 provides a standardized machine-readable HTTP problem model rather than creating an Atlazora-specific error envelope from scratch.

Cursor pagination avoids establishing offset semantics as the default for mutable transactional collections and keeps continuation details opaque to clients.

A decimal string plus explicit ISO 4217 currency avoids JSON floating-point representation for authoritative monetary boundaries while remaining independent of physical database representation.

UUIDv7 provides a current standardized UUID convention for new Atlazora-owned public identifiers without exposing database-local sequence identifiers.

RFC 3339 UTC timestamps provide a portable and explicit cross-language representation while keeping presentation timezone concerns separate.

## Alternatives Considered

### Header-Only or Media-Type-Only API Versioning

Not selected as the shared default because the major compatibility boundary would be less explicit in URLs, routing, logs, and basic OpenAPI consumption.

### Custom API Error Envelope

Not selected because RFC 9457 already defines the standard HTTP Problem Details model and supports extension members.

### Offset Pagination as the Shared Default

Not selected for mutable transactional collections because page traversal can become unstable as rows are inserted or removed and because large offsets may create undesirable implementation costs.

### JSON Number for Money

Rejected because approved Atlazora planning prohibits floating-point arithmetic for authoritative money and JSON numbers do not establish safe decimal financial semantics across consumers.

### Integer Minor Units as the Universal Contract Representation

Not selected as the universal external representation because currency minor-unit rules, unit pricing, FX, provider conversions, and domain precision requirements can differ. Individual domains may still use integer minor units internally where explicitly appropriate.

### Database Sequence as Public Identifier

Rejected because it leaks persistence-local sequencing and couples the public contract to a physical storage choice.

### UUIDv4 as the New Public Identifier Default

Valid but not selected. UUIDv7 is standardized by RFC 9562 and provides a common current UUID convention already adopted for Atlazora event identifiers while semantic identifier roles remain separate.

### Local-Time or Offset-Preserving Authoritative Timestamps

Not selected as the shared authoritative representation because Atlazora requires normalized timestamps and supports multiple countries and timezones.

## Consequences

### Positive

- API compatibility boundaries become explicit.
- HTTP errors use an interoperable standard.
- Collection traversal has a common opaque cursor contract.
- Money is explicit, currency-aware, and free from JSON floating-point representation.
- New public entity identifiers have a consistent standardized format.
- Timestamps have one authoritative UTC interchange convention.
- Executable shared schemas can now be created consistently after acceptance.

### Negative / Trade-offs

- Path-level major versions require routing and lifecycle discipline when a future major version is introduced.
- Cursor pagination requires server-managed continuation semantics and is less suitable for arbitrary page-number navigation.
- Decimal-string money requires explicit decimal parsing and validation in every runtime.
- UUIDv7 contains time-related bits and therefore must never be treated as a secret or privacy boundary.
- UTC serialization requires presentation layers to apply user or market timezone conversion explicitly.

## Security Impact

Problem responses must avoid internal and sensitive implementation disclosure.

Pagination cursors and UUID identifiers do not provide authorization. Every resource access remains subject to the applicable authentication, authorization, tenant, and ownership checks.

Legacy IDs and internal database sequences should not be exposed accidentally through the public contract.

Money values require strict lexical and domain validation before use in financial logic.

Timestamp parsing must reject malformed or ambiguous values according to the executable contract.

## Data / Migration Impact

This decision defines shared serialized contract representations and does not require a particular physical database schema.

Legacy identifiers may continue to be retained for migration traceability through explicit separate mappings.

Existing legacy money assumptions must be mapped into explicit amount-and-currency semantics during migration.

API compatibility must support coexistence during migration rather than assuming all clients change atomically.

## Operational Impact

W00-WU04 must provide executable schemas and fixtures for these conventions.

Local and CI validation must reject malformed problem details, pagination structures, money values, identifiers, and timestamps.

Compatibility tests must prove that prohibited breaking changes are detected.

Future deviations from these shared defaults require explicit contract documentation and, when architectural, an ADR.

## Related Decisions

- ADR-0009 — Idempotency Day One
- ADR-0010 — REST and OpenAPI Versioned Contracts
- ADR-0021 — Testing and Security in Every Work Unit
- ADR-0022 — Security and Supply-Chain Baseline
- ADR-0026 — Contract Specifications and Validation Toolchain
- ADR-0027 — CloudEvents Envelope and Event Identifier Convention

## Supersession

None.
