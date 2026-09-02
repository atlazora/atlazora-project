# Atlazora Product Vision

## Purpose

Atlazora is a MENA-origin, globally accessible B2B wholesale marketplace connecting business buyers with manufacturers, suppliers, wholesalers, distributors, importers/exporters, and trading companies.

The product is inspired by marketplace patterns proven by Alibaba.com, but Atlazora adapts those patterns to its own markets, business model, legal structure, operations, and technical architecture.

## Product Vision

Atlazora supports the complete B2B commercial lifecycle across:

- supplier onboarding and verification.
- catalog and commercial offers.
- buyer discovery.
- RFQ and negotiation.
- quotations.
- direct orders.
- sample orders.
- payment and trade-protection workflows.
- fulfillment.
- logistics.
- inspection.
- disputes and refunds.
- settlement.
- reviews and reputation.
- supplier monetization.

The target is not a tiny MVP that proves only UI or lead generation.

V1 must provide the foundations required for a real, secure, operable commercial marketplace.

## Geographic Direction

The approved market foundation supports:

- MENA suppliers selling within MENA.
- MENA suppliers selling globally.
- global-ready country support.
- multi-currency foundations.
- multi-language foundations.
- market-specific payment, shipping, tax, and compliance configuration.

Commercial rollout may be phased.

The platform architecture must not require rebuilding its core foundations simply to expand to another supported market.

Arabic and English are the initial product languages.

## Marketplace Participants

Primary marketplace participants are:

- Buyer / Buyer Organization.
- Supplier / Supplier Organization.
- Shipping, logistics, and inspection service providers.
- Atlazora Admin / Operations.

`User != Organization`.

An organization may participate as buyer, supplier, or both.

There is no hard permanent buyer-account versus supplier-account split.

## Core Commercial Model

### Product and Offer

`Product != Offer`.

A Product represents the catalog item.

An Offer represents supplier-specific commercial terms for that Product, including concepts such as:

- MOQ.
- quantity pricing.
- currency.
- availability.
- lead time.
- shipping terms.
- payment terms.
- sample terms.
- customization.

Multiple suppliers may publish separate Offers for the same Product.

### Transaction Entry Paths

The approved transaction entry paths are:

1. Direct Order.
2. Negotiated Order / RFQ.
3. Sample Order.

These paths converge into one commercial foundation for Order, Payment, Protection, Fulfillment, and Settlement.

### Samples

Samples are a first-class marketplace capability.

Sample activity remains linked to later wholesale negotiation and ordering so Atlazora can support and measure the sample-to-wholesale journey.

### RFQ and Quotes

Atlazora supports direct and open RFQs.

Quotes are structured and versioned.

Accepted commercial terms become immutable historical commercial truth.

Chat supports communication but is not itself the authoritative commercial agreement.

## Trust and Trade Protection

The platform combines multiple independent trust mechanisms:

- business verification.
- supplier verification.
- certification evidence.
- inspection.
- transaction-linked reviews.
- dispute handling.
- payment and trade-protection workflows.

Verification is not the same as a quality guarantee.

Subscription is not verification.

Sponsored placement is not verification or reputation.

Trade-protection and escrow-related language must always reflect the actual licensed provider and legal structure.

## Shipping and Inspection

The approved shipping models are:

- Supplier Arranged.
- Buyer Arranged / Freight Forwarder.
- Platform Assisted through partners.

Pre-Shipment Inspection is part of the marketplace trust model.

Inspection may be used as an order gate before shipping when required by the commercial agreement or product policy.

## International Trade

Atlazora must be capable of recording international-trade concepts such as Incoterms and basic commercial shipping documents.

V1 does not require a full global customs or tax automation engine.

## Finance Principles

Financial truth separates:

- goods.
- shipping.
- inspection.
- services.
- platform fees.
- payment fees.
- settlement.

`Order != Payment`.

`Order != Shipment`.

Payments have their own lifecycle and provider authority.

The platform must support explicit currencies, traceable FX conversion when used, commissions, settlements, refunds, and a financial ledger/audit trail.

## Monetization

The approved business model is hybrid:

- Free Supplier.
- **Professional Supplier Plan**.
- Transaction Commission.
- Promoted Listings and Ads.
- Inspection, Logistics, and Trade service fees or margins.

Paid plans may provide commercial benefits or entitlements, but they must not purchase verification itself.

## Operations

Atlazora requires an operational platform capable of managing the full marketplace lifecycle without routine database manipulation by operators.

Operational coverage includes marketplace participants, commercial workflows, trust, finance, logistics, inspection, disputes, monetization, support, moderation, and audit.

## Product Analytics Direction

The commercial funnel includes:

Visitor → Signup → Search → View → Contact/RFQ → Quote → Order → Payment → Completed

Analytics must eventually help Atlazora measure real marketplace liquidity, conversion, transaction success, operational health, and commercial outcomes rather than vanity metrics alone.

## Product Foundation Principle

Any foundation required for V1 to be correct, secure, operable, scalable, or to avoid painful rebuilding must be implemented from the beginning.

Advanced complexity may be deferred.

Foundational correctness may not.

This includes foundations such as:

- Organizations and permissions.
- multi-currency.
- Product / Offer separation.
- RFQ and Quote versioning.
- immutable Order snapshots.
- Payments separate from Orders.
- financial ledger.
- idempotency.
- audit logging.
- transactional events/outbox.
- search abstraction.
- object storage and private-file security.
- notifications.
- Admin permissions.
- observability.
- security.
- market/feature configuration.
- API and service contract boundaries.

## Legacy Relationship

The Laravel application is a migration and reference source.

Useful behavior, UX, content, localization, and evidence may be preserved.

The legacy business architecture is not the target architecture.

## Explicitly Deferred Complexity

Phase 01 deliberately defers advanced complexity including:

- advanced AI.
- broad provider integrations.
- deep logistics and inspection integrations.
- advanced procurement.
- global customs automation.
- complex enterprise roles and SSO.
- ERP / EDI.
- trade finance.
- BNPL.
- wallet capabilities.
- advanced FX.

Deferral of these capabilities does not remove their necessary architectural foundations when those foundations are required to avoid future rebuilds.

## Open Decisions

Phase 01 intentionally leaves some implementation details unresolved, including:

- exact commercial providers.
- exact rollout markets.
- market-specific legal/compliance implementation.
- exact policy numbers, thresholds, and limits.

These items must not be silently inferred during implementation.

## Planning Source

The detailed approved Phase 01 source is preserved at:

`../phases/source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

Phase 01 formalization was completed during W00-WU01.
