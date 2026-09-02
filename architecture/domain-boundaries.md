# Atlazora Domain Boundaries

## Purpose

Domain boundaries prevent business concepts, data ownership, and transactional responsibilities from collapsing into a single undifferentiated application model.

The detailed approved Phase 05 model is preserved in:

- `../domains/README.md`
- `../phases/phase-05/README.md`
- `data-architecture.md`

## Confirmed Modeling Boundaries

### User and Organization

A User and an Organization are different domain concepts.

Identity of an individual must not be used as a substitute for organizational ownership, membership, permissions, or commercial participation.

An Organization may buy, sell, or do both according to its capabilities and state.

### Product and Offer

A Product describes catalog identity and shared product information.

An Offer represents supplier-specific commercial terms associated with a Product.

The two concepts must not be merged merely for implementation convenience.

### Order and Payment

An Order records authoritative accepted commercial terms and commerce lifecycle state.

Payment is Finance-owned state.

`Order != Payment`.

Commerce must not infer authoritative provider-controlled payment confirmation merely from browser/client flow.

### Order and Shipment

Shipment is Logistics-owned state.

`Order != Shipment`.

An Order may have multiple or partial Shipments.

### Inspection

Inspection owns its workflow, requirements, evidence, and outcome.

Inspection may gate shipment where required but does not become the owner of Shipment or Finance state.

### Dispute and Financial Execution

Disputes owns dispute workflow and resolution decisions.

Finance owns actual financial execution.

Changing dispute status alone is not a substitute for executing the corresponding financial action.

### Subscription and Verification

Supplier subscription and supplier verification are separate concepts.

`Subscription != Verification`.

Sponsored placement must not modify verification or reputation.

## Approved Domain Map

The approved Phase 05 domain areas are:

- Identity.
- Supplier.
- Catalog.
- Sourcing.
- Commerce.
- Finance.
- Logistics.
- Inspection.
- Disputes.
- Trust.
- Growth.
- Platform.

These are logical ownership boundaries.

They do not imply one microservice per domain.

## Execution-Aligned Areas

Execution Waves may use more granular capability names such as:

- Organizations.
- Verification.
- Offers.
- Search / Discovery.
- RFQ.
- Quotes.
- Messaging.
- Orders.
- Samples.
- Payments / Finance / Protection.
- Disputes / Completion.
- Reviews / Reputation.
- Monetization.

Execution decomposition does not change authoritative domain ownership.

## Ownership Rule

Each authoritative data type has one owning domain/system.

A shared PostgreSQL cluster may be used initially.

Physical co-location does not grant another domain permission to write another domain's authoritative data.

Cross-domain interaction uses controlled:

- application/module boundaries.
- APIs.
- events.
- approved contracts.

Direct accidental table coupling is not an approved integration mechanism.

## Go Core Boundary

The initial transactional target is a modular Go Core.

Modules preserve explicit domain boundaries even when deployed together.

The initial architecture does not require network calls between every domain.

## Intelligence Boundary

Python Intelligence may:

- analyze.
- rank.
- score.
- enrich.
- project.

It must not directly mutate Core-owned transactional truth.

When intelligence affects transactional behavior, the owning Core domain consumes the result and applies the authoritative decision.

## Admin Boundary

Admin/Operations uses approved APIs and application behavior.

Direct database manipulation is not an approved mechanism for normal operational workflows.

Administrative operations remain subject to:

- authorization.
- domain validation.
- audit.
- financial/workflow controls.

## Service Extraction Rule

A module is extracted only when a future Accepted ADR establishes a justified independent service boundary.

A new service repository is created only when the service is actually extracted.

Extraction must preserve one authoritative owner for each data type.

## Historical Integrity

Domain boundaries must preserve historical truth.

Examples include:

- immutable QuoteVersion.
- immutable accepted Order commercial snapshot.
- financial corrections through adjustments.
- independently owned Shipment history.
- auditable dispute resolution.
- auditable review moderation.

## Detailed Domain Model

The Phase 05 Domain & Data Model is formally preserved in Git.

Physical schema details, public ID conventions, and exact money representation remain intentionally open for the relevant Engineering Foundation and implementation Work Units.
