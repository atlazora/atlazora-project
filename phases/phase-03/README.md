# Phase 03 — End-to-End Business Flows

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 03 defines the approved end-to-end business flows that connect Atlazora domains into complete marketplace journeys.

These flows are the baseline for E2E implementation and validation.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Approved Flows

Eight end-to-end flows are approved.

## Flow A — Supplier Onboarding

Account
→ Organization
→ Sell on Atlazora
→ Supplier Profile
→ Verification Center
→ Submit Verification
→ Operations Review
→ Verified / Changes Required / Rejected
→ Prepare Storefront, Products, and Offers
→ Moderation
→ Discoverable Supplier
→ First Lead

A supplier may prepare applicable storefront, product, and offer data while verification is pending.

Verification expiry may cause review or restriction.

Historical supplier and transaction data must not be deleted merely because verification expires.

## Flow B — Direct Wholesale Order

Search
→ Results
→ Product
→ Buy Direct
→ Quantity / Tier
→ Specifications / Variants
→ Destination
→ Shipping
→ Incoterm
→ Optional Inspection
→ Commercial Breakdown
→ Immutable Commercial Snapshot
→ Order: Awaiting Payment
→ Payment
→ Provider Confirmation
→ Paid / Protected
→ Supplier Fulfillment

Before order creation or payment, price and availability must be revalidated where applicable.

A failed payment may be retried safely.

Customization or non-standard commercial requirements may redirect the buyer into RFQ / negotiation rather than silently altering direct-order terms.

## Flow C — RFQ and Quote

Create RFQ
→ Requirements
→ Open RFQ / Supplier Targeting
→ Matching
→ Supplier Quote / Decline / Questions
→ Quote Comparison
→ Versioned Quote Revisions
→ Optional Sample
→ Final Quote
→ Acceptance
→ Immutable Commercial Snapshot
→ Order
→ Payment

Multiple supplier awards create separate supplier Orders.

A single multi-supplier Order is not part of the V1 model.

## Flow D — Sample to Wholesale

Sample Request
→ Sample Terms
→ Shipping Terms
→ Sample Order / Payment when required
→ Supplier Preparation
→ Shipment
→ Delivery
→ Sample-marked Review
→ Wholesale Quote / Negotiation
→ Wholesale Order

Sample-to-wholesale conversion must be traceable and measurable.

Samples remain first-class commerce transactions rather than informal side workflows.

## Flow E — Fulfillment to Settlement

Order Snapshot
→ Deposit where applicable
→ Protected / Production Authorized
→ Fulfillment Milestones
→ Goods Ready
→ Inspection where required
→ Balance Payment where commercial terms require
→ Ready to Ship
→ Shipping Model Selected / Confirmed
→ Shipment / Partial Shipments
→ Delivered / Proof of Delivery
→ Buyer Acceptance or Dispute
→ Completion
→ Commission
→ Supplier Settlement
→ Review

Inspection may be a required gate before shipping.

Order, Payment, Shipment, Inspection, Dispute, and Settlement each retain their own domain state even though this flow coordinates them.

## Flow F — Dispute

Problem Identified
→ Evidence Collected
→ Attempt Resolution
→ Open Dispute
→ Evidence Package
→ Counterparty Response
→ Operations Review
→ Resolution Decision
→ Actual Financial Execution
→ Audit
→ Close

A dispute decision does not become financially effective merely because a dispute status changed.

The approved resolution must propagate to the Finance domain so refund, release, partial refund, partial settlement, or other applicable financial action is actually executed and recorded.

## Flow G — Platform Assisted Shipping

Shipping Request
→ Cargo Information
→ Operations Review
→ Partner Quote
→ Recorded Shipping Quote
→ Buyer / Commercial Acceptance
→ Applicable Fee
→ Pickup
→ Shipment and Documents
→ Transit
→ Delivery / Proof of Delivery

V1 may use operationally managed shipping partners without implementing a full freight marketplace.

## Flow H — Subscription and Promotion

### Supplier Subscription

Free Supplier
→ Professional Supplier Plan Selection
→ Payment
→ Entitlements Activated
→ Subscription Lifecycle

Subscription entitlements must remain separate from verification state.

### Promotion

Product / Offer
→ Placement
→ Duration
→ Budget
→ Payment
→ Moderation
→ Active Promotion
→ Metrics

Sponsored placement is not the same as recommendation, verification, or reputation.

## Cross-Flow Business Rules

The following rules apply across the flows:

- The payment provider confirms provider-controlled payment success.
- Browser return or redirect is not authoritative proof of payment.
- Chat is communication, not the official commercial agreement.
- Accepted Quote / Order commercial terms are authoritative historical truth.
- Inspection may gate shipment where required.
- Dispute decisions must propagate to financial execution.
- Multiple RFQ awards produce separate supplier Orders in V1.
- One supplier per Order in V1.
- Samples participate in the formal commerce model.
- Operational changes must remain auditable.

## Architecture Implications

These business flows require cross-domain orchestration while preserving independent domain ownership and sources of truth.

No domain may silently overwrite another domain's authoritative state.

Examples:

- Commerce owns Order state.
- Finance owns payment, refund, ledger, and settlement state.
- Logistics owns Shipment state.
- Inspection owns inspection state.
- Disputes owns dispute workflow state.
- Messaging does not own accepted commercial terms.

Cross-domain transitions must use explicit contracts and reliable state propagation.

Where asynchronous integration is used, retry, duplication, and failure handling must be designed explicitly.

## Failure and Recovery Expectations

Implementation must account for cases such as:

- payment failure and safe retry.
- delayed or duplicated provider callbacks.
- shipment delays.
- partial shipments.
- inspection failure.
- dispute escalation.
- failed financial execution after dispute resolution.
- settlement failure.
- notification failure.

A UI success screen must never replace authoritative backend/provider confirmation.

## Deferred

Advanced automation is deferred in areas such as:

- supplier matching.
- logistics orchestration.
- inspection orchestration.
- promotion optimization.

The underlying workflow and ownership foundations remain required.

## Rejected Alternatives

- Browser return as payment authority.
- Chat as commercial agreement.
- Multi-supplier Order in V1.

## Open / Unresolved

Phase 03 intentionally leaves unresolved:

- provider-specific workflow details.
- exact policy timings and deadlines.

These must be decided in the appropriate implementation Work Units and policy/ADR process.

## Related Documentation

- `../../product/business-flows.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
- `../../product/v1-scope.md`
- `../../product/vision.md`

## Execution Relationship

These eight flows are the approved E2E baseline for V1 implementation and testing.

Implementation Work Units may refine technical details but must not silently change the approved commercial behavior.
