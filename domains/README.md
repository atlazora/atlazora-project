# Domains

## Purpose

This directory is the Git-tracked index for Atlazora business and platform domain documentation.

Domain documentation describes responsibility, ownership, authoritative data, invariants, externally meaningful behavior, and cross-domain boundaries.

Executable API and event schemas remain owned by `atlazora-contracts`.

## Approved Domain Map

### Identity

Owns:

- User.
- Organization.
- Membership.
- organization participation and authorization context.

Key rule:

`User != Organization`.

### Supplier

Owns:

- Supplier Profile.
- supplier participation state.
- Verification / KYB workflow.
- supplier verification evidence and status.

Verification is independent from subscription or sponsored placement.

### Catalog

Owns:

- Category.
- Product.
- attributes.
- units.
- catalog metadata.

Key rule:

`Product != Offer`.

### Sourcing

Owns:

- RFQ.
- Quote.
- immutable QuoteVersion.
- sourcing/negotiation state.

Chat is not authoritative commercial truth.

### Commerce

Owns:

- Offer.
- Order.
- accepted commercial snapshot.
- Sample Order.
- Order Change Request.

Key rules:

- one supplier per Order in V1.
- one buyer Organization per Order.
- accepted commercial terms remain historical truth.
- Samples are first-class commerce transactions.

### Finance

Owns:

- Payment.
- Refund.
- Ledger.
- Commission.
- Settlement.
- reconciliation.
- financial adjustments.

Key rules:

- `Order != Payment`.
- payment handling is idempotent.
- provider state is authoritative for provider-controlled confirmation.
- financial corrections preserve history through adjustments.

### Logistics

Owns:

- Shipment.
- shipping/tracking state.
- shipment documents.
- delivery / proof-of-delivery state.

Key rule:

`Order != Shipment`.

An Order may have multiple or partial Shipments.

### Inspection

Owns:

- Inspection Request.
- checklist / requirements.
- evidence.
- outcome.
- reinspection where applicable.

Inspection may gate shipment but does not own Shipment or Finance state.

### Disputes

Owns:

- Dispute.
- evidence.
- review workflow.
- resolution decision.

Financial outcomes are executed by Finance rather than by changing dispute status alone.

### Trust

Owns:

- Reviews.
- review eligibility.
- reputation/trust records.
- moderation history.

Verification, inspection, reviews, Trade Protection, and sponsored placement remain distinct signals.

### Growth

Owns:

- Supplier Subscription.
- Professional Supplier Plan entitlements.
- Promotion / Sponsored Placement.

Key rules:

- `Subscription != Verification`.
- sponsored placement does not alter verification or reputation.
- subscription expiry does not delete historical supplier or transaction data.

### Platform

Provides cross-cutting capabilities including:

- Notifications.
- localization.
- files/documents.
- audit.
- configuration.
- feature controls.
- analytics event collection.
- operational support foundations.

Files/documents require public/private/sensitive classification and explicit authorization.

## Domain Ownership Rule

Every authoritative data type has one owning domain.

A shared PostgreSQL cluster may be used initially, but shared physical infrastructure does not create shared write ownership.

Direct cross-domain table mutation is not an approved integration mechanism.

## Derived Data

The following are derived rather than transactional truth:

- search indexes.
- Redis caches/ephemeral state.
- analytics projections.
- intelligence/ranking outputs.
- reporting projections.

They must be reproducible from authoritative data where applicable.

## Historical Integrity

Domain implementations must preserve historical truth.

Examples include:

- immutable QuoteVersion.
- immutable accepted Order terms.
- financial adjustments rather than destructive corrections.
- historical reviews and moderation audit.
- historical supplier/verification context.
- historical commission/settlement context.

## Domain Document Standard

A domain document should describe, where applicable:

- purpose and business responsibility.
- aggregate/ownership boundaries.
- authoritative data.
- commands and behaviors.
- externally visible contracts.
- emitted and consumed events.
- authorization concerns.
- invariants.
- historical integrity rules.
- operational considerations.
- dependencies on other domains.
- failure/retry/idempotency expectations.

Domain documentation must not create a second conflicting source of truth for executable API schemas or event schemas.

Those belong in `atlazora-contracts`.

## Open Physical Design

The approved domain model does not by itself finalize:

- physical tables.
- schema names.
- ID formats.
- exact money storage.
- API resource shape.
- event envelope format.

Those decisions are completed in the relevant Engineering Foundation and implementation Work Units.
