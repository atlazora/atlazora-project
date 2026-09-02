# Atlazora Product Policies

## Purpose

This document records approved product-level policies that affect implementation across multiple domains.

Detailed domain behavior remains in the relevant Phase, product, architecture, domain, contract, and Work Unit documentation.

This document does not replace those authoritative detailed records.

## Project / Engineering Policies

### Permanent Project Memory

Git-tracked documentation is the permanent project memory.

Chat history must never be the only source of a product or architecture decision.

### Foundation Before Convenience

Any V1 foundation required for correctness, security, operability, scalability, or avoidance of painful rebuilds must be implemented when first needed.

Advanced complexity may be deferred.

Foundational correctness may not.

### Explicit Source of Truth

Each transactional data type must have one authoritative source of truth.

During migration, ownership may move progressively, but ambiguity about authority is not allowed.

Random dual writes between legacy and target systems are not an approved migration strategy.

### Legacy Role

`Atlazora-original-laravel` is a legacy/reference repository.

Legacy behavior is an input to migration and gap analysis, not an automatic specification for the target architecture.

Missing historical behavior must not be invented merely to imitate the legacy system.

### Contract Discipline

Externally meaningful APIs and shared schemas must be versioned and represented through the contracts repository.

### Security and Testing

Testing and security are integrated into every applicable Work Unit and are not end-of-project activities.

### Completion Discipline

A Work Unit is not `COMPLETE` until its applicable Definition of Done passes and a formal Handoff exists.

## Identity / Organization Policies

### User Is Not Organization

`User != Organization`.

Authentication identity does not itself define the commercial organization.

Organization membership and authority must be explicit.

### Organization Commercial Roles

An Organization may participate as:

- buyer.
- supplier.
- both buyer and supplier.

Atlazora does not impose a permanent hard buyer-account versus supplier-account split.

## Catalog / Commercial Policies

### Product Is Not Offer

`Product != Offer`.

A Product represents the catalog item.

An Offer represents supplier-specific commercial terms for that Product.

Multiple suppliers may therefore publish separate Offers for the same Product.

### Commercial Terms Require Structured Truth

Commercial terms that determine an accepted transaction must be represented through structured domain records.

Chat supports negotiation and communication but is not itself the authoritative commercial agreement.

### Accepted Terms Preserve History

Accepted commercial terms must remain historically traceable.

Quote versions and the commercial snapshot used to create an Order must not be silently rewritten by later negotiation or catalog changes.

Exact physical persistence is finalized in the owning implementation Work Units.

## RFQ / Quote Policies

### Quotes Are Structured and Versioned

Quotes are structured commercial records and require version history.

A new negotiation state must not silently overwrite the historical accepted commercial state.

### Multiple RFQ Awards

One RFQ may result in awards to multiple suppliers.

For V1, each awarded supplier produces a separate supplier Order rather than a single multi-supplier Order.

## Order Policies

### One Supplier Per Order in V1

A V1 Order belongs to one buyer Organization and one supplier Organization.

Multi-supplier cart/order aggregation must not turn the Order aggregate into an ambiguous multi-supplier commercial contract.

### Order Is Not Payment

`Order != Payment`.

Payment has an independent lifecycle and provider authority.

Order state must not be treated as a substitute for financial truth.

### Order Is Not Shipment

`Order != Shipment`.

Fulfillment and shipment have their own lifecycle and may include partial or multiple shipment activity where supported.

### Commercial History Must Remain Traceable

Later Product, Offer, pricing, organization-profile, or policy changes must not silently rewrite historical Order agreement data.

## Sample Policies

### Samples Are First-Class

Samples are a first-class commercial capability.

They are not merely ordinary wholesale Orders with an arbitrary quantity.

Sample-specific commercial behavior may differ from wholesale behavior, including MOQ handling where approved.

### Sample to Wholesale Continuity

Sample activity should remain linked to later RFQ/wholesale activity where applicable so Atlazora can support and measure the sample-to-wholesale journey.

## Payment / Finance Policies

### Provider Confirmation Is Authoritative

Where an external payment provider is used, authoritative provider confirmation determines provider payment outcome.

A browser redirect/return alone is not authoritative proof of payment success.

### Payment Processing Must Be Idempotent

Payment callbacks, retries, duplicate messages, and repeated client actions must not create duplicate financial effects.

### Financial Corrections Are Traceable

Material financial corrections must preserve audit history.

Corrections should use explicit adjustments/reversals or other approved financial records rather than silently rewriting historical financial truth.

### Finance and Commerce Remain Distinct

Goods, shipping, inspection, services, platform fees, provider fees, refunds, commissions, settlement, and other applicable financial components must remain explicitly representable.

### Currency Is Explicit

Financial records must identify their currency.

Where FX conversion occurs, the conversion must be traceable according to the implemented finance model.

Exact money representation and FX implementation remain open engineering decisions until formally resolved.

## Trade Protection / Dispute Policies

### No Unsupported Escrow Claim

Atlazora must not describe a payment/protection model as escrow unless the actual licensed provider and legal structure support that claim.

Product language must reflect the real operating/legal model.

### Dispute Resolution Must Propagate to Finance

The dispute workflow owns the dispute decision process.

A financial consequence of that decision must be executed explicitly by the Finance/Payment domain rather than assumed to occur automatically.

### Dispute Evidence Must Remain Traceable

Material dispute decisions, evidence, operational actions, and resulting financial execution require appropriate traceability and audit.

Exact policy timings, evidence windows, and provider-specific rules remain open until formally approved.

## Fulfillment / Inspection Policies

### Inspection May Gate Shipping

Pre-Shipment Inspection may act as an Order/fulfillment gate where required by the commercial agreement or applicable policy.

A failed or unresolved required inspection must not be silently treated as successful fulfillment authorization.

### Shipping Arrangement Is Explicit

Supported commercial models may include:

- Supplier Arranged.
- Buyer Arranged / Freight Forwarder.
- Platform Assisted through partners.

The responsible model must be explicit for the transaction.

## Trust / Verification Policies

### Verification Is Not a Quality Guarantee

Supplier/business verification establishes the approved verification state/evidence.

It must not be represented as an unconditional guarantee of product quality or transaction outcome.

### Subscription Is Not Verification

Purchasing the Professional Supplier Plan or another paid entitlement must not itself grant verification.

### Sponsored Is Not Verified

Paid promotion or sponsored placement must not change verification status or reputation truth.

Advertising must not be disguised as independent trust evidence.

### Reviews Require Transaction Context

Trust/review capabilities should preserve appropriate linkage to eligible marketplace activity according to the implemented review policy.

Exact eligibility/timing rules are finalized in the relevant Work Unit.

## Monetization Policies

### Hybrid Monetization

The approved business model may combine:

- Free Supplier participation.
- Professional Supplier Plan.
- transaction commission.
- promoted listings/ads.
- inspection/logistics/trade-service fees or margins.

### Commercial Payment Does Not Purchase Trust

Paid plans, advertising, or other monetization must not purchase verification or silently rewrite reputation.

## Operations Policies

### Admin / Ops Uses Controlled Product Boundaries

Normal Admin/Ops work must use approved application/API capabilities.

Routine direct database manipulation is not an approved business-operations workflow.

Exceptional Production access remains controlled and auditable.

### Material Operational Actions Are Auditable

Privileged or materially important operational actions require attribution and appropriate auditability.

## Localization / Market Policies

### Arabic and English Initial Languages

Arabic and English are the initial product languages.

The architecture must remain extensible to additional supported languages.

### Global-Ready Does Not Mean Globally Enabled

The foundations should support expansion across countries, currencies, languages, providers, shipping, tax, and compliance configuration.

This does not mean every market is commercially enabled automatically.

Each market requires the applicable formal launch/operational gate.

## Analytics / Learning Policies

### Metric Is Not Target

A Metric defines what is measured.

A Target defines the desired value or range.

Numeric targets must not be invented without appropriate evidence and approval.

### Evidence Before Random Feature Accumulation

Post-launch development follows:

**Measure → Learn → Decide → Develop → Release → Measure**

V1.1 and later priorities are evidence-driven rather than fixed merely because a future capability was discussed during planning.

## Policy Boundaries / Explicitly Open Items

The following remain intentionally unresolved until the appropriate Work Unit or formal decision:

- exact payment providers.
- exact logistics/inspection providers.
- exact market-specific legal/compliance rules.
- exact dispute windows/timings.
- exact verification policy thresholds.
- exact review eligibility/timing rules.
- exact commercial limits.
- exact money representation.
- exact FX implementation.
- exact numeric business targets.
- exact market rollout order.

These items must not be silently inferred.

## Planning Preservation

Approved planning decisions from Phases 01–13 have been formally preserved in Git during W00-WU01.

Detailed records remain available in:

- `../phases/phase-01/README.md` through `../phases/phase-13/README.md`
- `vision.md`
- `v1-scope.md`
- `business-flows.md`
- `../domains/README.md`
- relevant architecture documents
- relevant Accepted ADRs
- `../phases/source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

This policy document is a cross-domain policy consolidation and does not replace those detailed sources.
