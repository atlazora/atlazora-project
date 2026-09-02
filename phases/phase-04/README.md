# Phase 04 — Atlazora Gap Analysis

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 04 records the approved gap analysis between the legacy Laravel implementation and the Atlazora V1 target.

The legacy application is neither discarded blindly nor preserved as the future business core.

Useful user experience, visual, localization, asset, and business-concept knowledge may be reused where appropriate.

Transactional architecture, domain ownership, security, finance, workflow, and platform foundations are rebuilt according to the approved target architecture.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Core Migration Principle

The approved approach is:

**Preserve useful knowledge and experience; progressively replace the legacy business architecture.**

Legacy behavior is evidence and migration input.

It is not automatically the target specification.

Each legacy capability must be deliberately classified as:

- KEEP / improve.
- REUSE concept or UX while rebuilding implementation.
- REPLACE / major refactor.
- NEW.
- DEFER / intentionally omit from V1.

## Legacy Audit Context

The preserved legacy context includes:

- Laravel 9.
- PHP 8.0.2+.
- Vue 3 customer-facing frontend.
- Blade-based Admin, Supplier, and Driver surfaces.
- Laravel Sanctum / Dingo API concepts.
- file-backed cache/session configuration.
- synchronous queue behavior.
- hardcoded Saudi VAT assumptions.
- no complete multi-currency foundation.
- Telr and SAR-oriented payment assumptions.
- minimal automated testing.
- incomplete review and return scaffolding.

These characteristics describe migration input, not approved target architecture.

## Capability Gap Analysis

### Identity, Users, Vendors, and Organizations

**Classification: REPLACE / major refactor**

Useful legacy User concepts may be retained where semantically valid.

The target introduces explicit:

- User.
- Organization.
- Organization Member / membership.

`User != Organization`.

Legacy vendor/account structures must not be preserved as the target organization model merely for migration convenience.

## Authentication

**Classification: REUSE concepts / REBUILD security flow**

Useful user-facing authentication concepts may inform migration and UX.

Authentication and security behavior must be rebuilt according to the target security model rather than copied mechanically from legacy Laravel behavior.

## KYB and Team Membership

**Classification: NEW**

The target requires explicit supplier/business verification and organization/team capabilities that do not exist sufficiently in the legacy model.

## Supplier Storefront

**Classification: REUSE UX/content ideas / REBUILD domain**

Useful storefront presentation, content organization, and visual concepts may be reused.

The target storefront must operate on the new Organization, Supplier, Product, Offer, verification, and monetization models.

## Catalog

**Classification: REPLACE / major refactor**

Legacy catalog concepts may be useful migration input, but the target model must enforce:

`Product != Offer`

Product describes the shared catalog concept.

Offer represents supplier-specific commercial terms.

## ProductSupplier

**Classification: REUSE business concept / REBUILD as Offer**

The legacy `ProductSupplier` concept demonstrates a supplier-to-product commercial relationship.

It must not simply be ported unchanged.

Its approved semantic replacement is the target **Offer** model.

## MOQ and Tier Pricing

**Classification: NEW**

The V1 commerce model requires explicit MOQ and unambiguous tier-pricing foundations.

## Money and Multi-Currency

**Classification: REPLACE**

Legacy SAR-oriented or implicit amount assumptions are insufficient.

The target requires explicit Money/Currency semantics and a true multi-currency foundation.

Exact physical money representation remains an implementation decision to be finalized in the appropriate W00/contracts work.

Floating-point representation for authoritative money is not acceptable.

## Tax

**Classification: REPLACE**

Hardcoded Saudi 15% VAT behavior must not become a universal target rule.

Tax behavior must become explicit and market-aware.

Exact market/legal tax rules remain subject to the applicable commercial and compliance decisions.

## Cart and Direct-Buy Experience

**Classification: REPLACE transactional truth / REUSE useful UX**

Useful direct-buy user experience may be retained.

The legacy cart must not remain the authoritative B2B commercial model.

Accepted commercial terms must ultimately become immutable Order/Agreement truth.

## RFQ, Quotes, and Messaging

**Classification: NEW**

V1 requires first-class:

- RFQ.
- structured Quote.
- Quote versions.
- negotiation.
- commercial messaging context.

Chat is not the official commercial agreement.

## Orders

**Classification: REUSE snapshot concept / REBUILD**

Any useful legacy concept of freezing transaction details may be preserved.

The Order domain itself must be rebuilt around the approved V1 invariants, including immutable accepted commercial snapshots.

Current Product or Offer state must not rewrite historical Order truth.

## Coupons

**Classification: OPTIONAL / DEFERRED REUSE**

Legacy coupon capability may be reconsidered where commercially useful.

It is not a foundational V1 migration requirement.

## Telr Payment Integration

**Classification: REPLACE**

Telr-specific application coupling must not define the target Finance architecture.

Payment providers must integrate through provider-adapter boundaries.

A provider may be reintroduced only through a deliberate provider decision and compatible adapter implementation.

Provider-controlled payment state remains authoritative for payment confirmation.

## Financial Ledger

**Classification: NEW**

The target requires traceable financial ledger capability.

Financial corrections must preserve history through adjustments rather than destructive mutation.

## Vendor Accounting

**Classification: REUSE business concepts / REBUILD**

Useful legacy accounting concepts may inform migration.

The approved target model separates:

- Ledger.
- Commission.
- Settlement.
- Payment.
- Refund.
- Reconciliation.

## Delivery

**Classification: REPLACE**

Legacy delivery concepts are replaced by explicit Shipment / Logistics modeling.

`Order != Shipment`.

The logistics lifecycle must remain independently owned.

## Driver Concept

**Classification: DEFER / provider or operations detail**

The legacy driver model is not automatically a core target domain.

A driver concept may later exist as a logistics-provider or operational implementation detail if required.

## Inspection

**Classification: NEW**

Inspection is a first-class V1 domain/workflow, including evidence and applicable shipment/finance/dispute interactions.

## Reviews

**Classification: REBUILD**

Reviews must be linked to eligible transactions.

Supplier self-removal of reviews is not permitted.

Administrative removal must follow policy and remain auditable.

## Returns Scaffolding

**Classification: DO NOT PORT AS TARGET MODEL**

Incomplete legacy returns scaffolding must not be mechanically migrated.

The target uses explicit dispute, refund, evidence, and financial-resolution workflows.

## Trade Protection

**Classification: NEW**

Trade Protection is a new explicit commercial workflow.

It must not be described as escrow unless the real legal/provider arrangement supports that claim.

## Supplier Subscriptions and Advertising

**Classification: NEW**

The target introduces explicit supplier plan and promotion models.

Subscription does not equal verification.

Sponsored placement does not equal verification or reputation.

## Notifications

**Classification: REUSE useful concepts / NEW foundation**

Useful notification concepts may be retained.

The target requires a reliable cross-domain notification foundation rather than ad-hoc legacy coupling.

## Localization

**Classification: KEEP / IMPROVE**

Localization is a useful legacy asset and should be preserved where appropriate.

The target begins with Arabic and English and remains extensible.

RTL/LTR behavior and localization quality must be improved where required.

## Files and Documents

**Classification: REBUILD**

The target requires explicit:

- public.
- private.
- sensitive.

document classifications and controlled access.

File handling must include appropriate validation, security scanning, classification, storage, and authorization behavior.

## Admin and Supplier Portals

**Classification: REUSE useful visual/workflow knowledge / MAJOR REBUILD**

Useful visual patterns and operator experience may inform the new applications.

The functional and domain implementation must be rebuilt against the target APIs and domain rules.

Admin must not bypass domain behavior through direct database manipulation.

## Vue Frontend

**Classification: PRESERVE useful visual system / REFACTOR workflows and data model**

Vue 3 remains part of the target frontend technology direction.

Legacy components and visual patterns may be reusable where appropriate.

Legacy data assumptions and workflows must be refactored to use the new domain model and versioned APIs.

## Mobile

**Classification: OUT OF CURRENT V1 SCOPE**

A dedicated mobile application is not part of the current V1 baseline.

The platform foundations should not unnecessarily prevent future mobile clients.

## Automated Testing

**Classification: NEW FOUNDATION**

The legacy testing baseline is insufficient.

Testing is integrated into every applicable Work Unit and includes the appropriate unit, integration, contract, E2E, security, and operational validation.

## Queues and Background Processing

**Classification: REPLACE / EXPAND**

Legacy synchronous/background behavior is insufficient for the target platform.

Reliable asynchronous processing must support explicit retry, idempotency, failure handling, and observability where required.

## Business Events

**Classification: NEW**

The target introduces structured, versioned business events.

Transactional Outbox is foundational for reliable event publication from transactional state changes.

## What Is Intentionally Preserved

The migration may preserve or reuse, where useful and semantically correct:

- UI/UX patterns.
- visual design knowledge.
- frontend assets.
- localization content.
- catalog/business terminology.
- storefront presentation ideas.
- transaction snapshot concepts.
- notification concepts.
- selected operational knowledge.
- historical data that can be mapped truthfully.

Reuse must not preserve invalid architectural coupling.

## What Must Not Be Preserved Blindly

The following legacy characteristics are not target requirements merely because they exist today:

- vendor/account model as permanent Organization architecture.
- ProductSupplier as target Offer implementation.
- hardcoded single-market tax assumptions.
- SAR-only money assumptions.
- Telr-specific Finance coupling.
- cart as authoritative B2B agreement.
- delivery as Order state.
- incomplete returns scaffolding.
- direct DB operational fixes.
- synchronous processing as sufficient queue architecture.
- Laravel/PHP as permanent transactional core.

## Migration Rule

Migration follows **Progressive Semantic Migration**.

Legacy concepts are mapped to approved target semantics rather than copied table-for-table or class-for-class.

For each migrated data type, one system must be the authoritative source of truth at any given migration stage.

Uncontrolled dual writes are not allowed.

## Architecture Implications

The gap analysis reinforces the approved target direction:

- Go transactional Core.
- Vue 3 + TypeScript Web/Admin.
- Python Intelligence/Data boundary.
- PostgreSQL transactional truth.
- explicit domain ownership.
- versioned REST/OpenAPI contracts.
- Transactional Outbox.
- idempotency.
- provider adapters.
- derived/rebuildable search.
- Redis ephemeral only.
- secure object-storage abstraction.
- Progressive Semantic Migration.

## Deferred

The following are not required merely because legacy concepts exist or could be built:

- dedicated mobile application.
- unnecessary reuse of coupons.
- permanent driver domain.
- broad legacy implementation reuse where target semantics differ.

## Rejected Alternatives

- Full legacy rewrite by line-for-line translation.
- Treating legacy Laravel behavior as the automatic target specification.
- Preserving the current business core unchanged.
- Blind big-bang migration.
- ProductSupplier copied unchanged as Offer.
- hardcoded Saudi VAT as global tax architecture.
- Telr-specific coupling as target Finance architecture.
- incomplete return scaffolding as target dispute/refund design.

## Open / Unresolved

Phase 04 does not resolve implementation details that belong to later architecture or execution work, including:

- exact physical database schemas.
- exact migration scripts and field mappings.
- exact payment providers.
- exact money representation.
- exact tax/compliance rules by market.
- detailed infrastructure choices beyond already approved architecture.

These remain explicit open decisions rather than assumptions.

## Related Documentation

- `../../architecture/system-overview.md`
- `../../product/vision.md`
- `../../product/v1-scope.md`
- `../../product/business-flows.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
- `../../decisions/ADR-0019-progressive-semantic-migration.md`
- `../../decisions/ADR-0020-one-source-of-truth-during-migration.md`

## Execution Relationship

This gap analysis governs later migration and implementation Work Units.

When implementation encounters a legacy capability, the team must map it against the approved target semantics rather than assuming that legacy structure should survive.
