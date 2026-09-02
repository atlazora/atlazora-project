# Atlazora Data Architecture

## Purpose

The data architecture preserves authoritative ownership, transactional correctness, historical integrity, and safe evolution across domains and during migration.

## Transactional Truth

PostgreSQL is the source of authoritative transactional truth for the target Atlazora platform.

A shared PostgreSQL cluster is acceptable initially.

Shared physical infrastructure does not remove logical domain ownership.

Each authoritative data type has one owning domain.

## Domain Ownership

Domains own their authoritative state.

Another domain must not write directly to another domain's authoritative data merely because tables share a database cluster.

Cross-domain behavior uses controlled application boundaries, APIs, events, or other approved contracts.

## Core Ownership Examples

Approved ownership includes:

- Identity owns User, Organization, Membership, Role/Permission relationships.
- Supplier owns supplier profile and verification workflow state.
- Catalog owns Product, Offer, categories/taxonomy, and catalog media metadata.
- Sourcing owns RFQ, Quote, QuoteVersion, and commercial sourcing workflow.
- Commerce owns Order, OrderItem, accepted commercial snapshot, samples, and OrderChangeRequest.
- Finance owns Payment, Refund, Ledger, Commission, Settlement, and financial execution state.
- Logistics owns Shipment and logistics workflow state.
- Inspection owns inspection requirements, evidence, and outcomes.
- Disputes owns dispute workflow and resolution decisions.
- Trust owns review/reputation records.
- Growth owns subscriptions, entitlements, promotions, and sponsored placement state.
- Platform owns cross-cutting platform records according to explicit capability ownership.

Detailed approved domain boundaries are preserved in `../domains/README.md`.

## One Source of Truth

Every authoritative data type has one source of truth.

This rule applies both to normal target operation and during Progressive Semantic Migration.

Temporary coexistence between legacy and target systems is permitted only when ownership is explicit.

Ambiguous write ownership and uncontrolled dual writes are not approved.

## Migration Ownership Transition

For each migrated data area, the migration plan must identify:

- legacy source of truth.
- target source of truth.
- compatibility/coexistence period.
- write transition.
- read transition where applicable.
- validation.
- rollback/recovery strategy.
- completion/cutover criteria.

A source-of-truth transition must be explicit rather than emerging accidentally from implementation.

## Legacy Traceability

Migrated target records may preserve explicit migration metadata such as:

- `legacy_source`
- `legacy_id`

where required for traceability, idempotent import, reconciliation, audit, or debugging.

Legacy identifiers do not replace the target system's own identity/public-ID strategy.

The exact target/public ID convention remains open.

## Migration Jobs

Migration/ETL jobs must be designed to be repeatable and idempotent.

Re-running an import must not silently duplicate target business records.

Migration jobs should support appropriate:

- extraction.
- transformation.
- loading.
- validation.
- error reporting.
- retry/recovery.
- reconciliation.
- execution visibility.

Exact tooling remains an implementation decision.

## Missing Legacy Facts

Missing legacy facts must not be invented during migration.

When reliable historical evidence is absent, migration must use an approved deterministic derivation rule, preserve an unknown/null state where valid, flag for review where required, or document the limitation.

Historical commercial, financial, verification, dispute, or operational facts must not be fabricated merely to satisfy a target schema.

## Historical Integrity

Accepted commercial and financial history must remain explainable after migration.

Examples include:

- accepted QuoteVersion.
- accepted Order commercial snapshot.
- Payment/provider state.
- Refunds.
- Ledger adjustments.
- Commission snapshots.
- Settlement state.
- Shipment history.
- Inspection outcomes.
- dispute decisions.
- eligible Reviews.

Migration must preserve reliable historical meaning rather than mechanically preserve legacy table shape.

## QuoteVersion

A QuoteVersion is immutable once issued.

A later negotiation produces another version rather than mutating the historical quote.

## Order Snapshot

An accepted Order stores the commercial truth required to understand what was agreed.

Later Product, Offer, pricing, supplier, or catalog changes must not rewrite that accepted historical agreement.

## Order Ownership

Each V1 Order has:

- one Buyer Organization.
- one Supplier Organization.

One RFQ may result in multiple supplier Orders when multiple suppliers are awarded.

## Order Changes

Post-acceptance changes must be explicit.

An OrderChangeRequest or equivalent approved workflow must preserve the original accepted agreement and the approved change history.

## Samples

Samples are first-class commercial records/workflows.

A Sample may use sample-specific terms and may bypass normal wholesale MOQ when those sample terms permit it.

## Money

Money must be represented explicitly and must not use floating-point arithmetic for authoritative financial values.

Phase 05/08 do not finalize the exact physical money representation.

Currency is explicit.

Where FX is used, enough rate/context information must be recorded to explain the financial result.

Exact FX implementation remains open.

## Payment

`Order != Payment`.

Payment is independently modeled and Finance-owned.

Provider-controlled payment confirmation is authoritative where a provider controls the payment rail.

Browser/client return flow alone must not establish successful payment truth.

Retryable payment commands and callbacks must be idempotent.

Duplicate provider delivery must not create duplicate financial effects.

## Refunds

Refunds are explicit Finance records/actions.

Refund execution must respect applicable limits such as the amount actually eligible/refundable.

Refund state must not be inferred only from Commerce or Dispute status.

## Ledger

Financial corrections are represented through auditable adjustments rather than destructive rewriting of historical financial records.

The Ledger must support traceability from financial effects to their business cause.

## Commission

Commission terms applicable to a transaction must be snapshotted so later pricing/plan configuration changes do not rewrite historical transaction economics.

## Settlement

Settlement eligibility and settlement execution are Finance-owned concerns.

Completion of an Order does not by itself imply that every settlement action has occurred.

## Shipment

`Order != Shipment`.

An Order may have:

- one Shipment.
- multiple Shipments.
- partial Shipments.

Logistics owns Shipment lifecycle state.

## Inspection

Inspection is independently modeled.

Where commercial terms require inspection before shipping or another milestone, Inspection outcome may gate the applicable workflow.

Inspection does not become the owner of Shipment or Finance state.

## Disputes

Dispute workflow and resolution are independently modeled.

A dispute decision requiring a financial outcome must explicitly propagate to Finance for actual execution.

Changing dispute status alone must not silently create or imply a refund/payment effect.

## Reviews

Reviews require transaction-based eligibility.

Sample-related review context must remain distinguishable where required.

Moderation must not destroy the historical relationship between the Review and its eligible transaction.

## Growth / Monetization

`Subscription != Verification`.

Subscription expiry must not delete supplier identity, verification history, or commercial history.

Sponsored placement must not modify verification or reputation truth.

## Documents and Files

Files/documents require explicit classification such as:

- public.
- private.
- sensitive.

Access is authorization-controlled according to classification and business ownership.

Migration of legacy media must preserve applicable access/security semantics rather than assuming legacy accessibility is the target policy.

## Analytics and Intelligence

Analytics and Intelligence data is derived unless explicitly designated otherwise by an approved ownership decision.

Derived data must not silently become the authoritative source for transactional state.

Python Intelligence must not directly mutate Core-owned transactional truth.

## Search

Search indexes are derived and rebuildable.

Search must not become the only source of Product, Offer, Supplier, Order, or other authoritative business state.

## Redis

Redis is ephemeral only.

Redis must not contain the only durable copy of authoritative transactional state.

## Object Storage

Object storage uses an S3-compatible application abstraction.

Object storage contains file/blob content according to approved classification and ownership rules; authoritative business metadata remains owned by the appropriate domain.

## Events / Outbox

Transactional Outbox is a Day One foundation.

When transactional state requires reliable event publication, the durable publication intent is committed with the applicable transactional change.

Consumers must be idempotent where duplicate delivery can create duplicate effects.

Event-derived projections do not gain ownership of producer transactional truth.

## Progressive Semantic Migration

Atlazora uses Progressive Semantic Migration.

Legacy data and behavior are mapped by business meaning into the target domain model.

Migration is not:

- blind table-to-table copying.
- line-by-line application translation.
- uncontrolled dual writing.
- permanent accidental hybrid architecture.

Legacy behavior is migration/reference input, not the target specification.

## Migration Validation

Migration validation must be risk-appropriate and may include:

- counts.
- referential checks.
- semantic/business-rule validation.
- duplicate detection.
- missing-data detection.
- financial reconciliation.
- target invariant checks.
- representative/manual sampling.

Successful script execution alone is not sufficient proof of successful migration.

## Migration Cutover

A migrated data area becomes target-owned only after its approved cutover criteria pass.

Cutover must define:

- previous source of truth.
- new source of truth.
- write transition.
- read transition where applicable.
- compatibility period.
- validation.
- rollback/recovery strategy.
- completion criteria.

## Legacy Retirement

The legacy Laravel runtime is retired only after verified migration/cutover.

Required historical access and retention must be preserved.

Retirement includes appropriate final data validation and final legacy database backup/export.

The legacy repository remains archived/reference material rather than being deleted as if the historical implementation never existed.

## Open Physical Design

Phase 05/08 do not finalize:

- physical schema names.
- table names.
- exact aggregate persistence shape.
- ID strategy.
- public ID format.
- exact money representation.
- event envelope format.
- API representation.
- retention periods.
- exact FX implementation.
- exact ETL framework.
- exact migration batch sizes.

These are resolved through later Engineering Foundation and domain Work Units without changing the approved domain/migration invariants.

## Related Documentation

- `../domains/README.md`
- `../phases/phase-05/README.md`
- `../phases/phase-08/README.md`
- `domain-boundaries.md`
- `event-architecture.md`
- `infrastructure.md`
- `../decisions/ADR-0007-postgresql-transactional-truth.md`
- `../decisions/ADR-0008-transactional-outbox-day-one.md`
- `../decisions/ADR-0009-idempotency-day-one.md`
- `../decisions/ADR-0017-search-derived-rebuildable.md`
- `../decisions/ADR-0019-progressive-semantic-migration.md`
- `../decisions/ADR-0020-one-source-of-truth-during-migration.md`
