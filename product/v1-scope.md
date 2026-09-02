# Atlazora V1 Scope

## V1 Definition

Atlazora V1 is a functionally complete B2B marketplace baseline.

It must support real end-to-end commercial operation rather than only discovery, lead generation, or isolated transaction screens.

V1 must support the commercial lifecycle across:

Buyer / Supplier Participation → Discovery → RFQ / Quote / Negotiation → Order / Sample → Payment → Fulfillment → Shipping / Inspection → Completion / Dispute / Refund → Settlement → Review

It must also support supplier progression:

Onboarding → Verification → Publish → Sell → Fulfill → Settle

Routine Operations must be possible without normal developer intervention or direct database manipulation.

## Execution Waves

V1 is implemented through:

1. W00 — Engineering Foundation
2. W01 — Identity & Organizations
3. W02 — Supplier & Verification
4. W03 — Catalog
5. W04 — Offers
6. W05 — Search & Discovery
7. W06 — RFQ / Quotes / Messaging
8. W07 — Orders & Samples
9. W08 — Payments / Finance / Protection
10. W09 — Logistics
11. W10 — Inspection
12. W11 — Disputes / Completion
13. W12 — Reviews / Reputation
14. W13 — Monetization
15. W14 — Platform Completion
16. W15 — Legacy Final Migration
17. W16 — Cutover Readiness
18. W17 — Legacy Retirement

Wave ordering is execution sequencing.

It does not permit a required foundation to be postponed until a later Wave.

## Included Functional Scope

### Identity and Organizations

V1 includes secure accounts, account verification and recovery, user profiles, organization profiles, organization membership, Owner/Admin/Member roles, and email-based invitations.

Organizations may buy, sell, or do both.

Buyer onboarding remains relatively lightweight.

Supplier onboarding includes verification and settlement identity where required.

### Supplier and Verification

V1 includes supplier profiles, Verification Center, document submission/review, supplier operational states, and public supplier storefronts.

Verification is independent from paid membership.

### Catalog and Offers

V1 includes hierarchical categories, Products, supplier Offers, attributes, units, simplified variants, samples, customization concepts, OEM/ODM/private-label capabilities, media/documents, moderation, filters, favorites, and simplified comparison.

Product and Offer remain distinct concepts.

Arabic and English content are supported from the initial product foundation.

### Search and Discovery

Buyers can discover Products, Suppliers, and Categories using relevant marketplace filtering and sorting.

Search is a derived capability and does not own authoritative transactional data.

### RFQ, Quotes, and Messaging

V1 includes:

- Open RFQ.
- Direct RFQ.
- structured RFQ requirements.
- simple matching.
- structured, versioned Quotes.
- revisions and counteroffers.
- Quote comparison.
- acceptance snapshots.
- contextual messaging.
- notifications.
- reporting/blocking/moderation controls.

One RFQ may produce separate Orders for multiple selected suppliers.

### Orders

Orders may originate from:

- direct purchase.
- accepted RFQ.
- negotiated commercial terms.
- Sample Order.

V1 supports commercial snapshots, lifecycle states, milestones, Order Change Requests, cancellation, timelines, documents, inspection states, partial/multiple shipments, PO references, and reorder based on current terms.

V1 uses one supplier per Order.

### Samples

Samples are first-class commerce transactions.

V1 must support the measurable lifecycle from sample request/order through later wholesale negotiation or ordering.

### Payments, Finance, and Protection

V1 includes:

- explicit monetary breakdowns.
- multi-currency foundations.
- multiple payment records where needed.
- full payment.
- simplified deposit + balance.
- Trade Protection.
- commissions.
- settlements.
- full and partial refunds.
- disputes and evidence.
- financial ledger.
- reconciliation.
- payment-provider authority.
- idempotency.
- secure financial administration.

Trade Protection must not be marketed as escrow unless the actual legal/provider model supports it.

### Logistics

V1 supports:

- Supplier Arranged shipping.
- Buyer Arranged / Freight Forwarder.
- Platform Assisted shipping.

It includes shipment records, shipping responsibilities, origin/destination, method, dates, costs, Incoterms, documentation, tracking, and assisted-shipping request/quote workflows.

### Inspection

V1 supports inspection requests, partners, checklists, custom requirements, shipment gates, inspection outcomes/evidence, reinspection, fees, and interaction with dispute/finance workflows.

### Reviews and Reputation

V1 supports eligible transaction-linked reviews, separately marked sample reviews, rating dimensions, comments/photos, supplier responses, policy-based moderation, and auditable removal.

Verification, inspection, reviews, Trade Protection, and sponsored placement remain distinct concepts.

### Supplier Workspace and Monetization

Suppliers receive operational dashboards covering products, Offers, RFQ opportunities, messages/leads, fulfillment, finance, analytics, and storefront management.

V1 monetization includes:

- Free Supplier.
- Professional Supplier Plan.
- transaction commission.
- promoted/sponsored listings.
- simple campaigns.
- applicable marketplace service fees or margins.

Verification itself is not sold.

Sponsored placement is clearly labeled.

### Buyer Workspace

Buyer functionality includes:

- saved Products.
- saved Suppliers.
- RFQs.
- Quotes.
- comparisons.
- messages.
- Samples.
- Orders.
- shipments.
- inspections.
- disputes.
- documents.
- purchase history.
- reorder.
- shortlists.
- team roles.

Complex enterprise procurement approvals are deferred.

### Admin and Operations

V1 requires unified operational capability for:

- users and Organizations.
- verification.
- marketplace moderation.
- Orders and RFQs.
- finance.
- disputes.
- inspections.
- logistics.
- settlements and commissions.
- subscriptions and promotions.
- reviews.
- CMS/localization.
- market and feature configuration.
- support.
- risk/history.
- audit.

Normal operations must not depend on direct database status manipulation.

### Notifications

In-app and email notifications are required.

SMS may be used for important events depending on market/provider support.

Push-notification foundations may be prepared for later use.

### Localization

Arabic and English are the initial languages.

The product foundation is extensible to additional languages and market preferences.

Preferences may include language, country, timezone, and display currency.

### Analytics

V1 analytics cover commercial and marketplace health including funnel progression, GMV, revenue, active users, RFQ/Quote activity, conversion, AOV, sample conversion, refunds, disputes, and revenue streams.

## V1 Foundation Rule

Simplification is allowed.

Missing foundations are not.

Whenever required for correctness or safe future expansion, V1 must include foundations for:

- authorization.
- validation.
- organization isolation.
- versioned contracts.
- commercial snapshots.
- transactional integrity.
- events/outbox.
- idempotency.
- audit.
- financial ledger.
- observability.
- security.
- secure file handling.
- provider adapters.
- infrastructure as code.
- safe migration.
- CI and automated quality controls.

## Architecture Boundary

V1 uses:

- Vue 3 + TypeScript for Marketplace Web.
- Vue 3 + TypeScript for Admin / Operations.
- Go for the transactional Core.
- Python for Intelligence/Data capabilities.
- PostgreSQL as transactional source of truth.
- Redis only for ephemeral concerns.
- rebuildable derived search.
- versioned REST/OpenAPI contracts.
- transactional events/outbox.
- GCP deployment foundations.
- Terraform-managed infrastructure.

## Repository Boundary

The V1 repository baseline remains exactly the eight official Atlazora repositories documented in the root `README.md`.

A new service repository is created only when a module is genuinely extracted into an independently deployable service through an approved architecture decision.

## Explicitly Deferred from V1

V1 does not require:

- advanced AI.
- advanced intelligent search.
- automated negotiation.
- advanced translation.
- auctions.
- complex SSO and enterprise role models.
- ERP/EDI.
- full CRM.
- global customs automation.
- freight marketplace.
- warehouse-management platform.
- factory audits/labs/IoT inspection.
- letters of credit.
- trade finance.
- BNPL.
- advanced FX.
- wallets.
- advanced procurement.
- advanced advertising.
- advanced analytics.

## Open Decisions

The following remain unresolved rather than silently assumed:

- exact supplier-plan limits.
- exact external providers.
- exact policy time windows.
- exact auto-completion behavior.
- exact market capability matrix values.

## Planning Source

Detailed approved Phase 02 planning is preserved at:

`../phases/source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

Phase 02 formalization was completed during W00-WU01.
