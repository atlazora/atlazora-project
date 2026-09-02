# Phase 02 — V1 Functional Scope

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 02 defines the approved functional scope of Atlazora V1.

V1 is functionally complete across the real commercial lifecycle. It is not a tiny MVP that omits foundations required for marketplace correctness, security, operability, or future expansion.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## V1 Completion Principle

V1 must demonstrate complete end-to-end marketplace operation across:

- buyer participation.
- supplier onboarding.
- supplier verification.
- catalog and offer publishing.
- search and discovery.
- RFQ and quotation.
- negotiation and messaging.
- direct wholesale orders.
- sample orders.
- payments.
- trade-protection workflows.
- fulfillment.
- shipping.
- inspection.
- disputes.
- refunds.
- settlements.
- reviews and reputation.
- monetization.
- Admin / Operations.

Two important journeys must work end-to-end:

1. Sample → Wholesale.
2. Supplier Onboarding → Verification → Publish → Sell → Settlement.

Routine marketplace operations must not require direct database manipulation or developer intervention.

## Accounts and Organizations

V1 includes:

- email/mobile and password authentication.
- account verification.
- user profile.
- password recovery/change.
- logout and session/device security.
- organization legal name.
- trade name.
- country/address.
- business type.
- registration information.
- website.
- phone.
- description.
- logo.
- market information.

An Organization may act as:

- Buyer.
- Supplier.
- Both.

There is no final permanent buyer-account versus supplier-account choice.

Initial V1 organization roles are:

- Owner.
- Admin.
- Member.

V1 includes email invitations for organization membership.

Buyer onboarding should remain comparatively lightweight.

Supplier onboarding includes:

- supplier profile.
- verification documents.
- settlement identity where required.
- submission and review.
- Verification Center.

An optional Verified Business Buyer concept may be supported.

Supplier organizations have public storefront capability.

Social authentication may be added later and is not required for the V1 baseline.

## Catalog and Offers

V1 includes:

- central hierarchical categories.
- Product separate from Offer.
- Arabic and English catalog content.
- units.
- category-attribute foundation.
- simplified variants.
- product and offer media.
- commercial documents.
- document/file scanning where applicable.
- moderation lifecycle.
- filters and sorting.
- favorites.
- simplified comparison.

Offer terms include concepts such as:

- currency.
- MOQ.
- unit.
- tier pricing.
- availability.
- lead time.
- negotiable terms.
- samples.
- customization.
- shipping terms.
- trade terms.

The platform supports supplier capabilities such as:

- OEM.
- ODM.
- private label.

Certification state distinguishes uploaded evidence from verified evidence.

Commercial terms that become part of a transaction must be versioned or snapshotted so later changes do not rewrite historical agreements.

## RFQ, Quotes, and Messaging

V1 includes:

- Direct RFQ.
- Open RFQ.
- structured RFQ fields.
- RFQ lifecycle.
- deadlines.
- simple supplier matching.
- structured Quotes.
- versioned Quotes.
- counteroffers and revisions.
- quote comparison.
- direct product negotiation.
- contextual messaging.
- RFQ notifications.
- spam/report/block controls.
- RFQ privacy and moderation.

Quote acceptance creates an immutable commercial snapshot that becomes the basis of an Order.

Material changes after acceptance must occur through an explicit commercial change process rather than silently rewriting accepted terms.

One RFQ may create multiple separate Orders where different suppliers are awarded business.

## Orders and Samples

V1 order origins include:

- Direct Order.
- Accepted RFQ.
- Negotiated Order.
- Sample Order.

All use the same commerce foundation where appropriate.

Orders include:

- accepted commercial snapshot.
- lifecycle/status.
- milestones.
- Order Change Requests.
- cancellation.
- inspection states.
- multiple or partial shipments.
- documents.
- timeline/history.
- internal operational notes.
- buyer PO number where applicable.
- reorder capability based on current terms.

### One Supplier per Order

V1 uses one supplier organization per Order.

A buyer sourcing from multiple suppliers receives separate supplier Orders.

### Samples

Samples are first-class Orders and participate in the shared commerce model while supporting sample-specific terms and behavior.

The system must preserve the relationship:

Sample → Later Negotiation / Quote → Wholesale Order

so sample-to-wholesale conversion can be understood and measured.

## Payments, Finance, and Trade Protection

V1 includes:

- commercial amount breakdowns.
- multi-currency foundations.
- explicit Offer, Payment, Settlement, and Display currency distinctions.
- multiple payment records where required.
- full payment.
- simplified deposit + balance.
- Trade Protection workflows.
- supplier settlements.
- configurable commission.
- full refunds.
- partial refunds.
- disputes.
- evidence.
- resolution outcomes.
- inspection-related financial effects.
- financial ledger.
- reconciliation foundations.
- secure settlement account handling.
- Financial Admin capability.

Payment-provider state is authoritative for provider-controlled payment confirmation.

Payment processing must be idempotent.

Trade Protection must not be described as escrow unless the actual legal/provider model supports that claim.

## Shipping and Logistics

V1 supports:

1. Supplier Arranged shipping.
2. Buyer Arranged / Freight Forwarder.
3. Platform Assisted shipping.

Shipping data includes concepts such as:

- origin.
- destination.
- responsibility.
- method.
- dates.
- cost.
- Incoterm.
- shipment records.
- tracking.
- shipping documents.

Manual tracking is acceptable as an initial implementation where deep carrier integration is unavailable.

V1 may support freight-forwarder details and Platform Assisted Shipping through:

Request → Quote → Accept → Partner/Fee execution

without requiring a complete freight marketplace.

## Inspection

V1 includes an inspection workflow capable of supporting:

- inspection request.
- inspection partner.
- checklist.
- custom inspection requirements.
- inspection-before-shipping gates.
- reinspection.
- inspection fee.
- proof/evidence.
- inspection problems or findings.
- sample-related inspection where applicable.

Inspection may affect shipment progression and financial/dispute decisions according to the agreed commercial workflow.

## Reviews, Reputation, and Trust

V1 includes transaction-linked reviews for eligible completed wholesale transactions.

Sample reviews are allowed but must be clearly identified as sample reviews.

Review capability may include:

- rating dimensions.
- written comments.
- photos.
- verified-transaction indication.
- supplier reply.
- policy-based administrative removal with audit.

Trust and reputation must distinguish between:

- business verification.
- inspection.
- customer review.
- Trade Protection.
- paid promotion.

These signals must not be collapsed into one misleading trust indicator.

## Supplier Dashboard

The Supplier experience includes:

- needs-attention dashboard.
- product management.
- offer management.
- RFQ Opportunity Center.
- Inbox.
- simple lead states.
- fulfillment.
- finance.
- analytics.
- storefront management.

## Supplier Monetization

V1 monetization includes:

- Free Supplier.
- **Professional Supplier Plan**.
- transaction commissions.
- promoted listings / sponsored placements.
- simple promotion campaigns.
- service fees or margins where applicable.

The Professional Supplier Plan may provide benefits such as:

- higher limits.
- enhanced storefront capabilities.
- additional analytics.
- additional RFQ opportunities.
- support benefits.
- team benefits.
- promotional benefits.
- enhanced verification-related options.

However:

`Subscription != Verification`

Verification itself is not sold.

Commission may vary by applicable commercial rules.

Sponsored content must be clearly identified.

All suppliers may have a storefront; storefront existence is not reserved only for paid suppliers.

## Buyer Workspace

The Buyer experience includes:

- saved products.
- saved suppliers.
- RFQs.
- Quotes.
- Quote comparison.
- messages.
- samples.
- Orders.
- shipments.
- inspections.
- disputes.
- documents.
- buying dashboard.
- simplified shortlists.
- purchase history.
- reorder.
- document center.
- organization/team roles.

Complex enterprise procurement approval chains are deferred.

## Admin and Operations

V1 requires a unified Admin / Operations capability including:

- needs-attention dashboard.
- users.
- organizations.
- verification.
- roles.
- Orders.
- RFQs.
- message metadata where allowed by policy.
- reviews.
- disputes.
- history/risk.
- restrict/suspend/reactivate actions with audit.
- verification queues.
- product moderation.
- prohibited-product controls.
- taxonomy.
- attributes.
- units.
- certifications.
- RFQ moderation.
- unified Order view.
- finance controls.
- dispute operations.
- inspection operations.
- logistics operations.
- settlement.
- commission.
- subscriptions.
- advertising/promotions.
- review moderation.
- CMS.
- localization.
- market configuration.
- feature controls.
- support.
- audit.

Finance and transactional state must not be managed through routine direct database status hacks.

Admin and Operations work through controlled platform interfaces and APIs.

## Notifications

V1 requires:

- in-app notifications.
- email notifications.

SMS may be used for important events according to market/provider availability.

Push-notification foundations may be introduced for later expansion.

## Localization

Initial supported product languages are:

- Arabic.
- English.

The localization foundation must remain extensible.

User/organization preferences may include:

- language.
- country.
- timezone.
- display currency preference.

## Analytics

V1 analytics include marketplace and commercial measures such as:

- funnel progression.
- GMV.
- revenue.
- active users.
- RFQs.
- Quotes.
- conversions.
- average order value.
- sample-to-wholesale conversion.
- revenue streams.
- refunds.
- disputes.
- useful segmentation.

Analytics implementation must not become the source of transactional truth.

## V1 Business Rules

- V1 is functionally complete, not a deliberately incomplete MVP.
- Simplified capability does not mean missing foundational architecture.
- One supplier per Order in V1.
- One RFQ may produce multiple separate supplier Orders.
- Product != Offer.
- User != Organization.
- Samples are first-class.
- Accepted commercial terms are historical immutable truth.
- Chat is not the commercial source of truth.
- Provider state is authoritative for provider-controlled payment confirmation.
- Subscription != Verification.
- Sponsored != Verified.
- Routine Ops must not require database hacks.

## Architecture and Engineering Implications

All core domains and cross-cutting foundations must be introduced early enough to support V1 correctly.

This includes, where applicable:

- authorization.
- validation.
- organization isolation.
- versioned API contracts.
- transactional consistency.
- outbox/event reliability.
- idempotency.
- auditability.
- observability.
- secure document handling.
- financial ledger.
- immutable commercial snapshots.
- provider adapters.
- Admin authorization.
- infrastructure as code.
- CI and security controls.
- migration safety.

Wave sequencing must not be used as justification to postpone a foundation that is already required.

## Explicitly Deferred

The following capabilities are not required for the V1 functional baseline:

- advanced AI.
- advanced search intelligence.
- advanced automated negotiation.
- advanced automated translation.
- auctions.
- complex enterprise SSO.
- complex organization role systems.
- ERP integration.
- EDI.
- full CRM.
- global customs automation.
- freight marketplace.
- warehouse-management platform.
- factory audits.
- laboratories.
- IoT inspection.
- letters of credit.
- trade finance.
- BNPL.
- advanced FX.
- wallet.
- advanced procurement.
- advanced advertising systems.
- advanced analytics.

Their necessary foundations must still be preserved when required to avoid structural rebuilding.

## Rejected Alternatives

The following are explicitly rejected:

- a tiny MVP that omits core foundations.
- selling verification as part of a supplier subscription.
- routine Admin/Ops database status manipulation.

## Open / Unresolved

Phase 02 did not finalize:

- exact paid-plan limits.
- exact providers.
- exact policy time windows.
- exact automatic-completion rules.
- exact values in the market capability matrix.

These items remain open until formally decided in their appropriate Work Units or ADR/policy process.

## Related Documentation

- `../../product/v1-scope.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
- `../../product/vision.md`
- `../../ROADMAP.md`

## Execution Relationship

V1 is implemented through W00–W17.

Wave order represents implementation sequencing, not permission to defer necessary foundations.
