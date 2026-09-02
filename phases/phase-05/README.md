# Phase 05 — Domain & Data Model

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 05 defines the approved business-domain model, major entities, invariants, and authoritative ownership boundaries for Atlazora V1.

It deliberately does not finalize physical database schemas, public ID formats, or the exact physical representation of money.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Domain Model

The approved domain areas are:

1. Identity
2. Supplier
3. Catalog
4. Sourcing
5. Commerce
6. Finance
7. Logistics
8. Inspection
9. Disputes
10. Trust
11. Growth
12. Platform

These domains may initially share a PostgreSQL cluster, but logical ownership remains explicit.

Shared infrastructure does not imply shared write ownership.

## Identity Domain

Primary concepts include:

- User.
- Organization.
- Organization Member / Membership.
- role and membership state.
- authentication identity and account lifecycle.

Core rules:

- `User != Organization`.
- organization membership is explicit.
- ownership/member relationships must be retained historically where needed.
- an Organization may buy, sell, or do both.
- authorization decisions depend on user, organization, membership, and applicable role/capability.

## Supplier Domain

Primary concepts include:

- Supplier Profile.
- supplier participation state.
- Verification / KYB.
- verification documents.
- supplier capabilities.
- settlement identity where applicable.

Core rules:

- supplier verification is separate from subscription.
- verification expiry or restriction must not delete historical transactional truth.
- verification status is not changed by sponsored placement.
- supplier participation is attached to an Organization rather than replacing the Organization model.

## Catalog Domain

Primary concepts include:

- Category.
- Product.
- Attribute.
- Unit.
- Variant concepts.
- Certification metadata.
- Media / commercial document associations.

Core rules:

- `Product != Offer`.
- Product represents catalog identity/content.
- supplier-specific commercial terms do not belong in the Product aggregate.
- catalog changes must not rewrite historical accepted transaction terms.

## Sourcing Domain

Primary concepts include:

- RFQ.
- RFQ targeting / visibility.
- Quote.
- QuoteVersion.
- negotiation context.

Core rules:

- Quote versions are immutable historical commercial proposals.
- revisions create new QuoteVersion records rather than rewriting accepted history.
- chat is not the commercial source of truth.
- acceptance of a QuoteVersion creates an authoritative commercial snapshot for Order creation.
- one RFQ may ultimately result in separate Orders for multiple suppliers.

## Commerce Domain

Primary concepts include:

- Offer.
- Order.
- Order Line / commercial line details.
- Sample Order.
- Order Change Request.
- commercial agreement snapshot.

Offer contains supplier-specific terms such as:

- supplier.
- Product.
- MOQ.
- tier pricing.
- currency.
- availability.
- lead time.
- samples.
- customization.
- shipping/trade terms.

Core rules:

- accepted commercial terms are immutable historical truth.
- an Order stores the accepted commercial snapshot.
- current Product or Offer changes must not rewrite historical Order terms.
- V1 uses one buyer Organization and one supplier Organization per Order.
- one supplier per Order in V1.
- Samples are first-class Orders.
- sample flows may bypass normal wholesale MOQ according to sample terms.
- material accepted-term changes require an explicit Order Change Request or equivalent controlled process.

## Finance Domain

Primary concepts include:

- Payment.
- Refund.
- Ledger Entry.
- Commission.
- Settlement.
- reconciliation state.
- financial adjustments.
- currency / FX records where applicable.

Core rules:

- `Order != Payment`.
- provider-controlled payment confirmation is authoritative from the provider.
- payment callbacks and commands must be idempotent.
- duplicate provider delivery must not create duplicate financial effects.
- refunds must not exceed the eligible amount.
- financial corrections must be represented through auditable adjustments rather than destructive rewriting of history.
- commission terms applicable to a transaction must be snapshotted where required.
- settlement eligibility depends on the applicable commercial and protection lifecycle rather than only Order status.
- financial history must remain auditable.

## Logistics Domain

Primary concepts include:

- Shipment.
- shipment legs/details where required.
- tracking.
- shipping documents.
- origin/destination.
- shipping responsibility.
- delivery / proof-of-delivery state.

Core rules:

- `Order != Shipment`.
- an Order may have multiple or partial Shipments.
- logistics has its own lifecycle and authoritative state.
- Order state must not be used as a replacement for Shipment state.

## Inspection Domain

Primary concepts include:

- Inspection Request.
- checklist / inspection requirements.
- inspection provider/partner.
- inspection outcome.
- evidence.
- reinspection where applicable.

Core rules:

- inspection state is independent from Order, Payment, and Shipment state.
- inspection may gate shipment when required by commercial terms.
- inspection results may affect dispute and finance workflows, but do not directly overwrite those domains.

## Disputes Domain

Primary concepts include:

- Dispute.
- evidence package.
- response/counterparty evidence.
- resolution decision.
- resolution outcome.

Core rules:

- dispute lifecycle is independently owned.
- a dispute resolution is not itself financial execution.
- approved financial effects must be explicitly propagated to Finance.
- evidence and resolution history must remain auditable.

## Trust Domain

Primary concepts include:

- Review.
- rating dimensions.
- supplier response.
- verified-transaction indicator.
- trust/reputation signals.

Core rules:

- reviews require appropriate transaction eligibility.
- sample reviews remain distinguishable from wholesale-transaction reviews.
- suppliers cannot silently remove unfavorable reviews.
- administrative moderation must be policy-based and auditable.
- verification, inspection, Trade Protection, reviews, and sponsored placement remain distinct trust signals.

## Growth Domain

Primary concepts include:

- Supplier Subscription.
- Professional Supplier Plan.
- entitlements.
- Promotion / Sponsored Placement.
- promotion metrics.

Core rules:

- `Subscription != Verification`.
- sponsored placement does not alter verification or reputation.
- subscription expiry must not delete supplier, catalog, or historical transaction data.
- paid benefits are entitlements, not ownership of core historical records.

## Platform Domain

Cross-cutting platform concepts include:

- Notifications.
- localization.
- files/documents.
- audit.
- configuration.
- feature controls.
- analytics event collection.
- operational support capabilities.

Core rules:

- documents require explicit public/private/sensitive classification.
- authorization applies to document access.
- analytics and intelligence outputs are derived data and do not become transactional truth.
- operational actions requiring audit must remain attributable and traceable.

## Sources of Truth

Each domain owns its authoritative business state.

Conceptually:

- Identity → users, organizations, memberships.
- Supplier → supplier participation and verification.
- Catalog → Product/catalog definition.
- Sourcing → RFQs, Quotes, QuoteVersions.
- Commerce → Offers, Orders, accepted commercial snapshots.
- Finance → Payments, Refunds, Ledger, Commission, Settlement.
- Logistics → Shipments and delivery lifecycle.
- Inspection → inspection workflow and evidence.
- Disputes → dispute workflow and decisions.
- Trust → reviews and reputation/trust records.
- Growth → subscriptions, entitlements, promotions.
- Platform → applicable platform-level configuration and operational records.

Derived systems such as Search, caches, analytics projections, and intelligence outputs do not own transactional truth.

## Shared PostgreSQL Rule

A shared PostgreSQL cluster is acceptable initially.

However:

- domain ownership remains explicit.
- direct cross-domain writes are not allowed merely because tables share a database cluster.
- one module/domain must own each authoritative data type.
- other domains interact through controlled application boundaries.
- schema co-location must not become accidental ownership coupling.

## Historical Integrity Rules

Historical commercial and financial truth must be preserved.

Examples:

- accepted QuoteVersion is immutable.
- Order commercial snapshot is immutable.
- current Product changes do not rewrite past Orders.
- current Offer changes do not rewrite past Orders.
- financial corrections use adjustments.
- subscription expiry does not delete supplier history.
- verification expiry does not delete transactional history.
- review moderation remains auditable.
- migration must not invent missing historical facts.

## Cross-Domain Integration Rules

Domains coordinate through explicit:

- commands/application services.
- versioned APIs.
- events.
- outbox-based publication where applicable.
- idempotent consumers/handlers where required.

Shared database infrastructure does not justify arbitrary SQL writes across domain ownership boundaries.

## Open / Unresolved

Phase 05 intentionally does not finalize:

- physical PostgreSQL schema layout.
- table names.
- exact aggregate persistence shape.
- internal/public ID convention.
- exact money representation.
- exact event envelope format.
- exact API resource representations.
- exact retention periods.
- exact FX implementation.

These remain open until the appropriate W00/contracts/domain implementation decisions.

## Related Documentation

- `../../domains/README.md`
- `../../architecture/data-architecture.md`
- `../../architecture/domain-boundaries.md`
- `../../architecture/event-architecture.md`
- `../../product/v1-scope.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
- `../../decisions/ADR-0001-product-offer-separation.md`
- `../../decisions/ADR-0002-user-organization-separation.md`
- `../../decisions/ADR-0007-postgresql-transactional-truth.md`
- `../../decisions/ADR-0008-transactional-outbox-day-one.md`
- `../../decisions/ADR-0009-idempotency-day-one.md`

## Execution Relationship

Implementation Work Units may refine physical models and contracts, but they must preserve these domain boundaries, invariants, and authoritative ownership rules unless superseded by a formal architectural decision.
