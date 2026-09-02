# Atlazora Data Architecture

## Transactional Source of Truth

PostgreSQL is the approved source of transactional truth for the Atlazora transactional platform.

Authoritative business state must not be silently duplicated across systems.

## Domain-Owned Data

Transactional truth is owned by explicit business domains.

Conceptually:

- Identity owns users, organizations, and memberships.
- Supplier owns supplier participation and verification.
- Catalog owns Products and catalog definition.
- Sourcing owns RFQs, Quotes, and QuoteVersions.
- Commerce owns Offers, Orders, and accepted commercial snapshots.
- Finance owns Payments, Refunds, Ledger, Commission, and Settlement.
- Logistics owns Shipments and delivery lifecycle.
- Inspection owns inspection workflow and evidence.
- Disputes owns dispute workflow and decisions.
- Trust owns Reviews and reputation records.
- Growth owns subscriptions, entitlements, and promotions.
- Platform owns applicable platform-level operational/configuration records.

## Shared PostgreSQL Cluster

A shared PostgreSQL cluster is acceptable for the initial modular architecture.

This does not remove domain ownership boundaries.

Rules:

- every authoritative data type has one owner.
- direct cross-domain writes are not allowed merely because schemas share a cluster.
- modules must interact through controlled application boundaries.
- physical co-location must not become semantic ownership coupling.
- future service extraction must preserve one authoritative owner.

## One Source of Truth

During both normal operation and migration, every data type must have one clearly identified authoritative source.

Temporary replication and derived projections are permitted.

Ambiguous write ownership and uncontrolled dual writes are not.

## Historical Integrity

Historical commercial and financial truth must remain stable.

Examples:

- QuoteVersion is immutable.
- accepted Order commercial terms are immutable.
- later Product or Offer changes do not rewrite historical Orders.
- financial corrections use auditable adjustments.
- verification or subscription expiry does not erase historical transaction data.
- review moderation remains auditable.

## Transaction Separation

Important transactional concepts are separate:

- Order is not Payment.
- Order is not Shipment.
- Shipment is not Inspection.
- Dispute decision is not Financial execution.
- current Product/Offer data is not historical Order truth.

These records may participate in one business flow while retaining independent authoritative lifecycle state.

## Money and Currency

V1 requires explicit Money/Currency semantics.

Authoritative monetary values must not use floating-point representation.

The exact physical representation of money remains unresolved until the appropriate Engineering Foundation/contracts decision.

Currency, payment, settlement, and applicable FX concepts must be represented explicitly rather than hidden in SAR-only assumptions.

## Derived Data

Search indexes, caches, analytical projections, and intelligence outputs are derived data.

They must be reproducible from authoritative sources where applicable.

## Search

Search is explicitly derived and rebuildable.

Loss or corruption of a search index must not imply loss of authoritative marketplace or transaction data.

## Redis

Redis is approved for ephemeral workloads only.

It must not be the sole durable source for transactional business truth.

Applicable uses may include:

- caching.
- short-lived coordination.
- rate-control state.
- disposable derived state.

## Analytics and Intelligence

Analytics and Python intelligence workloads may read, derive, score, enrich, or project data according to approved interfaces.

They do not become owners of transactional business state.

Python intelligence must not directly mutate Core-owned transactional truth.

## Object Storage

Object storage must use an S3-compatible abstraction.

Documents/files require explicit classification such as:

- public.
- private.
- sensitive.

Access must be authorization-aware.

Storage processing may require validation, security scanning, metadata, and audit according to document sensitivity.

## Managed Production Data Services

Production data infrastructure should use managed services where this improves:

- reliability.
- backups.
- high availability.
- patching.
- monitoring.
- operational safety.

## Events and Transactional Consistency

Transactional state changes that require reliable event publication use the Transactional Outbox pattern.

Event delivery may be duplicated.

Consumers must be idempotent where duplicate delivery can occur.

Cross-domain distributed database transactions are not the normal integration model.

## Migration

Atlazora uses Progressive Semantic Migration.

Migration must explicitly define:

- current source of truth.
- target source of truth.
- ownership transition.
- semantic mapping.
- compatibility period.
- validation.
- rollback/recovery strategy.
- completion criteria.

Missing legacy facts must not be invented during migration.

## Open Physical Design

Phase 05 does not finalize:

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

These are resolved through later Engineering Foundation and domain Work Units without changing the approved domain invariants.

## Related Documentation

- `../domains/README.md`
- `../phases/phase-05/README.md`
- `domain-boundaries.md`
- `event-architecture.md`
- `../decisions/ADR-0007-postgresql-transactional-truth.md`
- `../decisions/ADR-0008-transactional-outbox-day-one.md`
- `../decisions/ADR-0009-idempotency-day-one.md`
- `../decisions/ADR-0017-search-derived-rebuildable.md`
- `../decisions/ADR-0019-progressive-semantic-migration.md`
- `../decisions/ADR-0020-one-source-of-truth-during-migration.md`
