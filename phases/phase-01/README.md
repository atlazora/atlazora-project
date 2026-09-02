# Phase 01 — Product Vision & Business Model

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 01 defines Atlazora's approved product vision, business model, marketplace actors, commercial principles, trust model, monetization direction, and the foundations that V1 must preserve.

The authoritative preservation source for the original approved planning is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Approved Product Vision

Atlazora is an Alibaba.com-inspired B2B wholesale marketplace focused on suppliers in MENA and buyers within MENA and globally.

Alibaba.com is a reference model, not a product to copy literally. Atlazora adapts marketplace workflows and commercial logic to its target markets.

The approved direction is a MENA-origin, globally accessible B2B marketplace connecting:

- manufacturers
- suppliers
- wholesalers
- distributors
- importers/exporters
- trading companies
- business buyers

The platform covers the commercial lifecycle across discovery, RFQ, negotiation, orders, payment, shipping, inspection, trade protection, disputes, settlement, and reputation.

## Geographic and Market Foundation

The approved foundation supports:

- MENA suppliers selling within MENA.
- MENA suppliers selling globally.
- global-ready countries.
- currencies.
- languages.
- tax and compliance configuration.
- shipping and logistics configuration.
- payment capability by market.

Commercial rollout may be phased even though the product foundations are global-ready.

Arabic and English are the initial languages.

## Foundation Principle

> Any capability or foundation required for V1 to be correct, secure, operable, scalable, or to avoid painful rebuilding must be implemented from the beginning.

Advanced complexity may be deferred.

Foundations may not be deferred merely for convenience.

V1 is intended to be a complete commercial foundation, not a deliberately incomplete tiny MVP.

## Marketplace Actors

The approved primary actors are:

1. Buyer / Buyer Organization.
2. Supplier / Supplier Organization.
3. Service Provider for shipping, logistics, and inspection.
4. Platform Admin / Operations.

Service-provider relationships may be centrally managed by Atlazora during V1.

## User and Organization Model

`User != Organization`.

Users participate through organizations.

An organization may buy, sell, or do both.

There is no permanent hard buyer-account versus supplier-account split.

Initial organization roles include:

- Owner
- Admin
- Member

Supplier organization types include:

- Manufacturer
- Wholesaler
- Distributor
- Importer/Exporter
- Trading Company

## Supplier Participation

Approved supplier onboarding direction:

Registration → Company Profile → Verification Data → Review → Verified Supplier → Full Trading Permissions

A pending supplier may prepare its profile, products, and offers within applicable restrictions while verification is in progress.

Business verification is distinct from a guarantee of product quality.

## Buyer Participation

A buyer may browse, search, contact suppliers, and create RFQs.

A company profile becomes required when entering formal commercial transactions.

A lighter or optional Verified Business Buyer concept may exist.

## Transaction Initiation

Three approved commercial entry paths exist:

1. Direct Order.
2. Negotiated Order / RFQ.
3. Sample Order.

All three converge into the same Order / Payment / Protection / Fulfillment foundation.

## Product and Offer

> Product != Offer

Product represents the catalog item.

Offer represents supplier-specific commercial terms for a Product.

An Offer may include:

- Supplier.
- Product.
- MOQ.
- quantity price tiers.
- currency.
- available quantity.
- lead time.
- shipping terms.
- payment terms.
- sample terms.
- customization capabilities.

The same Product may have Offers from multiple suppliers.

## Samples

Samples are a first-class commercial capability.

Sample terms may include:

- available yes/no.
- free or paid.
- maximum quantity.
- shipping free, buyer-paid, or quoted.
- lead time.
- MOQ bypass.
- linkage between sample history and later wholesale negotiation or order.

## Trade Protection and Commercial Lifecycle

The approved conceptual lifecycle is:

Agreement → Order → Payment → Supplier Fulfillment → Shipment → Buyer Receipt → Settlement

Conceptual order states include:

Awaiting Payment → Paid/Protected → Processing → Ready to Ship → Shipped → Delivered → Completed

Dispute states include:

Opened → Under Review → Resolved

Evidence may include:

- accepted commercial agreement or quote.
- relevant messages.
- payment records.
- shipping documents.
- tracking or proof of delivery.
- inspection reports.
- dispute evidence.

Possible dispute outcomes include:

- release.
- full refund.
- partial refund.
- partial settlement.

Atlazora must not claim that it legally holds escrow unless the real provider and legal structure support that statement.

Marketplace-protection language must match the actual payment/provider/legal model.

## Shipping

The approved shipping models are:

- Supplier Arranged.
- Buyer Arranged / Freight Forwarder.
- Platform Assisted via partners.

The domain foundation must support, where relevant:

- samples.
- parcels.
- cartons.
- pallets.
- air.
- sea.
- road.

## Inspection

Pre-Shipment Inspection is part of the Trust and Trade Protection model.

Conceptual flow:

Order → Request Inspection → Supplier Prepares → Inspector Visits → Report → Buyer Reviews → Approve or Raise Issue → Shipping

The initial model may use a Partner Inspection Network.

Inspection may check:

- existence.
- quantity.
- model.
- specifications.
- packaging.
- visible condition.
- photos/video.
- formal report.

Approved conceptual outcomes:

- Passed.
- Passed with Notes.
- Failed.

An order may require an inspection-before-shipping gate.

## Verification, Trust, and Reviews

Supplier trust concepts include:

- Registered.
- Business Verified.
- optional On-site Verified.
- optional Verified Manufacturer through a partner.

Company verification may include:

- legal name.
- registration/license.
- country/address.
- authorized representative.
- settlement identity.
- optional tax/export documentation.

Certifications distinguish:

- Supplier Uploaded.
- Platform / Third-party Verified.

Reviews must be connected to eligible completed transactions.

Sample reviews must be distinguishable from wholesale transaction reviews.

Review dimensions may include:

- quality.
- communication.
- shipping / lead time.
- accuracy.
- overall rating.

## Monetization

The approved business model is hybrid:

- Free Supplier.
- Paid Supplier Membership.
- Transaction Commission.
- Promoted Listings and Ads.
- Inspection / Logistics / Trade service fees or margins.

The approved paid supplier plan name is:

**Professional Supplier Plan**

The following distinctions are mandatory:

`Subscription != Verification`

`Featured / Sponsored != Verified`

Paid placement must not be represented as trust or verification.

## Catalog and Search Direction

Product information may include:

- name.
- description.
- images/video.
- category.
- specifications.
- brand.
- SKU/model.
- origin.
- certifications.
- unit.
- variants.

Offer information may include:

- MOQ.
- tier pricing.
- currency.
- unit.
- availability.
- lead time.
- sample terms.
- customization.
- private label.
- shipping.
- payment terms.

Pricing may be:

- fixed price.
- price on request / negotiable.

Availability concepts include:

- In Stock.
- Made to Order.
- Available on Request.

Customization concepts include:

- logo.
- packaging.
- specifications.
- OEM.
- ODM.
- private label.

Search must support Products, Suppliers, and Categories with relevant filters such as:

- supplier country.
- ship-to.
- MOQ.
- price.
- verification.
- supplier type.
- sample availability.
- customization.
- ready-to-ship.

## RFQ, Quotes, and Messaging

RFQ models include:

- Open RFQ.
- Direct RFQ.

A structured Quote may contain:

- price.
- quantity.
- currency.
- total.
- MOQ.
- specifications.
- lead time.
- shipping terms.
- payment terms.
- sample terms.
- inspection terms.
- expiry.

Quotes are versioned.

Negotiation may create revisions or counteroffers.

Accepted commercial terms become the basis for an Order.

Messaging may be contextual to:

- Product.
- RFQ.
- Quote.
- Order.
- Sample.
- Dispute.

Chat is communication.

The accepted Quote or Order is the official commercial truth.

Atlazora may encourage users to remain on-platform for protection without relying on aggressive blocking of all contact exchange.

## International Trade Foundation

The commercial model may record Incoterms such as:

- EXW.
- FOB.
- CIF.
- DDP.

Basic trade documents include concepts such as:

- Commercial Invoice.
- Packing List.

V1 does not require a complete global customs or tax engine.

## Finance Model

Financial modeling separates:

- goods.
- shipping.
- inspection.
- services.
- platform fees.
- payment fees.
- supplier settlement.

The system distinguishes:

- Offer currency.
- Payment currency.
- Settlement currency.
- Display currency.

Where currency conversion occurs, the system must record conversion information such as rate, source, and time.

Payment models include:

- full payment.
- simplified deposit + balance.

The system must support:

- full refunds.
- partial refunds.
- configurable commission.
- financial ledger and audit.

`Order != Payment`

`Order != Shipment`

## Operations

Atlazora requires a unified Operations capability covering, as applicable:

- users and organizations.
- verification.
- products and categories.
- RFQs and quotes.
- orders.
- payments.
- shipments.
- inspections.
- disputes.
- refunds.
- settlements.
- commissions.
- subscriptions.
- ads.
- reviews.
- reports.
- CMS and translations.
- fraud/risk.
- support.

Sensitive operational actions require audit history.

## Notifications, Analytics, and Security Direction

Notification channels include:

- in-app.
- email.
- SMS where appropriate.
- push foundation for later expansion.

The marketplace funnel includes:

Visitor → Signup → Search → View → Contact/RFQ → Quote → Order → Payment → Completed

Security foundations include:

- supplier/business verification.
- MFA for sensitive access.
- roles and permissions.
- secure sessions/tokens.
- encryption.
- rate limiting.
- audit logging.
- file scanning.
- backups.
- secrets management.
- monitoring.

## Approved Product Rules

- User != Organization.
- Product != Offer.
- Samples are first-class.
- Subscription != Verification.
- Sponsored != Verified or Reputation.
- Chat != Commercial Agreement.
- Accepted commercial terms become immutable historical truth.
- Multi-country, multi-currency, and multi-language foundations begin from Day One.
- No unsupported escrow claim.

## Day-One Technical Implications

Phase 01 requires foundations for:

- Organizations and permissions.
- multi-currency.
- Product / Offer separation.
- RFQ and Quote versioning.
- Order snapshots.
- Payments separate from Orders.
- financial ledger.
- idempotency.
- audit logging.
- events and transactional outbox.
- search abstraction.
- object storage and private files.
- notifications.
- Admin permissions.
- observability.
- security.
- feature and market configuration.
- Go / Python contract boundaries.
- API contract versioning.

## Deferred

The following were deliberately deferred rather than treated as missing foundations:

- advanced AI.
- many provider integrations.
- deep carrier integrations.
- deep inspection integrations.
- advanced ads.
- advanced procurement.
- global customs automation.
- factory audits and laboratories.
- container-loading inspection.
- complex roles and SSO.
- ERP / EDI.
- trade finance.
- BNPL.
- wallet.
- advanced FX capabilities.

## Rejected or Explicitly Not Adopted

- Hard buyer/supplier account split.
- Product = Offer.
- Paid plan = verification.
- Sponsored = verified.
- Unsupported escrow claims.

A complete global customs/tax engine is deferred from V1.

## Open / Unresolved

Phase 01 did not finalize:

- exact providers.
- exact rollout markets.
- exact legal/compliance implementation per market.
- exact policy numbers and thresholds.

These must remain unresolved until formally decided through the appropriate Work Unit and ADR/process.

## Related Documentation

- `../../product/vision.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
- `../../decisions/ADR-0001-product-offer-separation.md`
- `../../decisions/ADR-0002-user-organization-separation.md`

## Execution Relationship

Phase 01 is a planning Phase.

Implementation is governed through the execution Waves and Work Units in `ROADMAP.md` and `waves/`.
