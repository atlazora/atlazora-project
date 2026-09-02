# Atlazora Business Flows

## Purpose

This document records the approved end-to-end business journeys that implementation Waves and Work Units must preserve across domain and repository boundaries.

The eight Phase 03 flows form the baseline for V1 E2E behavior.

## 1. Supplier Onboarding

Account
→ Organization
→ Supplier Participation
→ Supplier Profile
→ Verification Center
→ Submit Verification
→ Operations Review
→ Verified / Changes Required / Rejected
→ Storefront, Products, and Offers
→ Moderation
→ Discoverable
→ First Lead

Suppliers may prepare applicable commercial content while verification is pending.

Verification expiry causes policy-driven review or restriction, not deletion of historical marketplace data.

## 2. Direct Wholesale

Search
→ Product Discovery
→ Buy Direct
→ Quantity and Pricing Tier
→ Specifications / Variants
→ Destination
→ Shipping
→ Incoterm
→ Optional Inspection
→ Commercial Breakdown
→ Commercial Snapshot
→ Awaiting Payment
→ Payment
→ Provider Confirmation
→ Paid / Protected
→ Fulfillment

Price and availability must be revalidated where required before commitment.

Payment failure is recoverable through safe retry.

Non-standard customization may move the transaction into RFQ / negotiation.

## 3. RFQ to Order

RFQ Creation
→ Requirements
→ Open / Direct RFQ
→ Matching
→ Supplier Quote / Questions / Decline
→ Comparison
→ Versioned Revisions
→ Optional Sample
→ Final Quote
→ Acceptance
→ Commercial Snapshot
→ Supplier Order
→ Payment

Accepted Quote terms become historical commercial truth.

One RFQ may award multiple suppliers, but each award creates a separate supplier Order.

## 4. Sample to Wholesale

Sample Request
→ Sample Terms
→ Shipping
→ Sample Order / Payment where required
→ Preparation
→ Shipment
→ Delivery
→ Sample-marked Review
→ Wholesale Quote / Negotiation
→ Wholesale Order

Sample-to-wholesale conversion must be measurable.

## 5. Fulfillment to Settlement

Order Snapshot
→ Deposit where applicable
→ Production Authorized
→ Fulfillment Milestones
→ Goods Ready
→ Inspection where required
→ Balance where applicable
→ Ready to Ship
→ Shipping
→ Partial / Full Shipments
→ Delivery / Proof of Delivery
→ Accept or Dispute
→ Completion
→ Commission
→ Settlement
→ Review

Inspection may block shipment when the commercial terms require inspection before shipping.

## 6. Dispute to Financial Resolution

Problem
→ Evidence
→ Attempted Resolution
→ Dispute Opened
→ Evidence Package
→ Response
→ Operations Review
→ Resolution Decision
→ Financial Execution
→ Audit
→ Closure

A dispute resolution must propagate into the Finance domain.

Possible commercial outcomes may include release, refund, partial refund, or partial settlement according to the approved decision and provider capabilities.

Changing a dispute status alone is not financial execution.

## 7. Platform Assisted Shipping

Shipping Request
→ Cargo Information
→ Operations
→ Partner Quote
→ Recorded Shipping Quote
→ Acceptance
→ Fee
→ Pickup
→ Shipment / Documentation
→ Transit
→ Delivered / Proof of Delivery

This flow may initially be operations-assisted and partner-driven.

A complete freight marketplace is not required for V1.

## 8. Subscription and Promotion

### Subscription

Free Supplier
→ Professional Supplier Plan
→ Payment
→ Entitlements
→ Subscription Lifecycle

Subscription and verification remain independent.

### Promotion

Product / Offer
→ Placement
→ Duration
→ Budget
→ Payment
→ Moderation
→ Active
→ Metrics

Sponsored does not mean recommended, verified, or reputable.

## Authoritative-State Rules

### Payments

The payment provider is authoritative for provider-controlled payment confirmation.

Browser redirects, return pages, or client-side success state are not authoritative payment confirmation.

Payment callbacks and retries must be handled idempotently.

### Commercial Terms

Chat supports communication.

Chat is not the official commercial agreement.

Structured accepted Quote or Order terms are the authoritative commercial record.

### Orders

V1 uses one supplier per Order.

Multiple RFQ awards produce separate supplier Orders.

### Inspection

Inspection may gate shipment when required.

Inspection outcome remains distinct from Shipment state and Payment state.

### Disputes and Finance

Dispute workflow owns the resolution process.

Finance owns actual refund, release, settlement, ledger, and reconciliation effects.

A dispute decision therefore requires explicit financial execution.

## Cross-Domain Flow Principle

The approved flows cross multiple domains without removing their ownership boundaries.

Conceptually:

Commerce
↔ Finance
↔ Logistics
↔ Inspection
↔ Disputes
↔ Trust
↔ Notifications
↔ Operations

Cross-domain coordination must use explicit APIs, contracts, events, or orchestrated workflows.

Direct database shortcuts between domains are not an acceptable integration model.

## Reliability Requirements

Applicable flows require:

- authorization.
- validation.
- immutable commercial snapshots.
- explicit state transitions.
- idempotency.
- transactional outbox/events.
- retries.
- duplicate handling.
- audit history.
- correlation/traceability.
- operational visibility.
- failure recovery.

## Failure-First Scenarios

Implementation and E2E tests must cover meaningful failure paths, including where applicable:

- price or availability changed before commitment.
- failed payment.
- duplicate or delayed payment callback.
- provider confirmation arriving after client disconnect.
- inspection failure.
- shipment delay.
- partial shipment.
- dispute escalation.
- failed refund.
- failed settlement.
- notification failure.

## Migration Rule

While legacy and new implementations coexist, each data type must have one authoritative source of truth at any point in the migration.

Business-flow orchestration must not introduce uncontrolled dual writes.

## Deferred Automation

Advanced automation may be deferred for:

- matching.
- logistics.
- inspection.
- promotion optimization.

The core workflow remains part of V1.

## Open Decisions

Provider-specific flow behavior and exact policy timings remain unresolved until the appropriate implementation Work Units.

## Planning Source

Detailed approved Phase 03 planning is preserved at:

`../phases/source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

Phase 03 formalization was completed during W00-WU01.
