# Atlazora --- Approved Planning Source

## Document Purpose

هذا الملف هو **preservation/export للتخطيط المعتمد سابقًا لمشروع
Atlazora** كما ورد واعتمد في المحادثة المصدر. ليس تخطيطًا جديدًا، ولا يعيد
تقييم القرارات، ولا يستبدل قرارًا قديمًا بخيار أحدث. الغرض منه أن يصبح
مصدرًا مرجعيًا يمكن إدخاله إلى مستودع `atlazora-project` أثناء W00-WU01
لإعادة بناء وثائق المشروع الرسمية دون الاعتماد على ذاكرة المحادثات.

حالات المعلومات المستخدمة: - **Approved / Confirmed** --- قرار أو نتيجة
أصبحت جزءًا واضحًا من الخطة المعتمدة. - **Deferred** --- مؤجل عمدًا مع
الحفاظ على الأساس أو المسار المستقبلي. - **Open / Unresolved** --- لم
يُحسم في التخطيط المصدر. - **Rejected** --- استُبعد صراحة أو لم يُعتمد بعد
مناقشته. - **Assumption** --- افتراض فقط إن كان المصدر قد عامله كذلك.

------------------------------------------------------------------------

# Phase 01 --- Product Vision & Business Model

## Approved Outcomes

**Approved / Confirmed**

Atlazora تتحول إلى **Alibaba.com-inspired B2B wholesale marketplace**
تركز على موردي MENA ومشترين داخل MENA وعالميًا، مع تكييف التدفقات والمنطق
للسوق المستهدف وعدم نسخ Alibaba حرفيًا.

الرؤية المعتمدة: منصة B2B إقليمية المنشأ وعالمية الوصول تربط
manufacturers, suppliers, wholesalers, distributors,
importers/exporters, trading companies مع business buyers، وتغطي
discovery, RFQ, negotiation, orders, payment, shipping, inspection,
trade protection.

النموذج الجغرافي المعتمد من ناحية الأساس: - MENA suppliers sell within
MENA. - MENA suppliers sell globally. - البنية تكون global-ready للبلدان
والعملات واللغات والضرائب والشحن والدفع والامتثال، بينما rollout التجاري
مرحلي.

القاعدة الحاكمة: \> أي capability/foundation مطلوبة فعلًا لكي تكون V1
صحيحة وآمنة وقابلة للتشغيل والتوسع أو لتجنب إعادة بناء مؤلمة يجب بناؤها
من البداية. يؤجل التعقيد المتقدم، لا الأساسات.

## Detailed Decisions

### Actors and organizations

1.  Buyer / Buyer Organization.
2.  Supplier / Supplier Organization.
3.  Service Provider للشحن/اللوجستيات/الفحص، ويمكن إدارة العلاقة مركزيًا
    في V1.
4.  Platform Admin / Operations.

`User ≠ Organization`. نفس المستخدم/المنظمة يمكن أن يشتري ويبيع؛ لا يوجد
hard buyer-vs-supplier account split.

Supplier types: - Manufacturer - Wholesaler - Distributor -
Importer/Exporter - Trading Company

Supplier onboarding: registration → company profile → verification data
→ review → Verified Supplier → full trading permissions. المورد pending
يستطيع تجهيز profile/products ضمن القيود.

Buyer يستطيع browse/search/contact/RFQ، وcompany profile يصبح مطلوبًا عند
المعاملات الرسمية. مفهوم Verified Business Buyer موجود بصورة
أخف/اختيارية.

### Transaction initiation

المسارات الثلاثة: 1. Direct Order 2. Negotiated Order / RFQ 3. Sample
Order

كلها تلتقي في Order / Payment / Protection / Fulfillment core واحد.

### Samples

Samples capability أساسية: available yes/no، free/paid، max qty،
shipping free/buyer/quoted، lead time، bypass MOQ، وربط sample history
بالـwholesale negotiation/order اللاحق.

### Product and Offer

قاعدة أساسية: \> **Product ≠ Offer**

Product = catalog item.

Offer = Supplier + Product + MOQ + Quantity Price Tiers + Currency +
Available Quantity + Lead Time + Shipping Terms + Payment Terms.

نفس Product يمكن أن يكون له Offers من موردين متعددين.

### Trade Protection / lifecycle

Agreement → Order → Payment → Supplier Fulfillment → Shipment → Buyer
Receipt → Settlement.

Conceptual statuses: Awaiting Payment → Paid/Protected → Processing →
Ready to Ship → Shipped → Delivered → Completed.

Dispute: Opened → Under Review → Resolved.

Evidence قد تشمل agreement/accepted quote، relevant messages، payment،
shipping docs/tracking/POD، inspection، dispute evidence.

Resolution: release، full refund، partial refund، partial settlement.

لا نفترض قانونيًا أن Atlazora تمسك escrow؛ يجب استخدام licensed
marketplace/payment provider وصياغة قانونية دقيقة إذا أُريد نموذج حماية
مشابه.

### Shipping

-   Supplier Arranged
-   Buyer Arranged / Freight Forwarder
-   Platform Assisted via partners

يدعم samples/parcels/cartons/pallets/air/sea/road من ناحية domain.

### Inspection

Pre-Shipment Inspection جزء من Trust & Trade Protection: Order → request
inspection → supplier prepares → inspector visits → report → buyer
reviews → approve/issue → shipping.

Partner Inspection Network في البداية.

Checks: existence, quantity, model, specs, packaging, visible condition,
photos/video, formal report.

Results: - Passed - Passed with Notes - Failed

يمكن أن يوجد gate: do not ship before passed.

### Verification / trust / reviews

Supplier trust states/concepts: - Registered - Business Verified -
optional On-site Verified / Verified Manufacturer via partner

Company verification قد تشمل legal name, registration/license,
country/address, authorized rep, settlement identity، optional
tax/export docs.

Business verification ≠ quality guarantee.

Certifications: - Supplier Uploaded - Platform/Third-party Verified

Reviews مرتبطة بمعاملة eligible completed، والعينات مميزة كـsample.
Dimensions: quality, communication, shipping/lead time, accuracy,
overall.

### Monetization

Hybrid: - Free Supplier - Paid Supplier Membership - Transaction
Commission - Promoted Listings & Ads - Inspection / Logistics / Trade
service fees or margins

اسم الخطة المدفوعة المعتمد: **Professional Supplier Plan**.

Subscription ≠ Verification. Featured/Sponsored ≠ Verified.

### Catalog / Search

Product fields/concepts: name, description, images/video, category,
specs, brand, SKU/model, origin, certifications, unit, variants.

Offer: MOQ, tier pricing, currency, unit, availability, lead time,
sample, customization, private label, shipping, payment.

Fixed price أو price-on-request/negotiable.

Availability: - In Stock - Made to Order - Available on Request

Customization: logo, packaging, specs, OEM, ODM, private label.

Search Products/Suppliers/Categories مع filters: supplier country,
ship-to, MOQ, price, verified, supplier type, sample, customization,
ready-to-ship.

Arabic + English بداية.

### RFQ / Quotes / Messaging

Open RFQ أو Direct RFQ.

Structured Quote: price, qty, currency, total, MOQ, specs, lead,
shipping, payment, sample, inspection, expiry.

Quotes versioned. Counter/revision ثم accept → Order.

Chat linked to Product/RFQ/Quote/Order/Sample/Dispute.

Chat communication؛ Quote/Order official commercial truth.

تشجيع on-platform protection بدون aggressive blocking لكل contact
exchange.

### International trade

تسجيل Incoterms مثل EXW/FOB/CIF/DDP. Commercial Invoice / Packing List /
basic trade documents. لا يوجد التزام بمحرك customs/tax عالمي كامل في
V1.

### Finance

فصل goods/shipping/inspection/services/platform/payment fees/supplier
settlement.

Offer/Payment/Settlement/Display currencies، وتسجيل FX rate/source/time
عند التحويل.

Full payment وsimplified deposit+balance. Full/partial refunds.
Configurable commission. Financial ledger/audit.

Order ≠ Payment. Order ≠ Shipment.

### Operations

Unified Operations Console لـusers/orgs, verification,
products/categories, RFQs/quotes, orders, payments, shipments,
inspections, disputes, refunds, settlements, commissions, subscriptions,
ads, reviews, reports, CMS/translations, fraud/risk, support.

Audit Log للأفعال الحساسة.

### Notifications / analytics / security

In-app/email/SMS؛ push foundation/later. Funnel:
Visitor→Signup→Search→View→Contact/RFQ→Quote→Order→Payment→Completed.

Security foundations: verification, MFA sensitive, roles/permissions,
secure sessions/tokens, encryption, rate limits, audit, file scanning,
backups, secrets, monitoring.

## Business / Product Rules

-   User ≠ Organization.
-   Product ≠ Offer.
-   Sample first-class.
-   Subscription ≠ verification.
-   Sponsored ≠ verified/reputation.
-   Chat ≠ commercial agreement.
-   Accepted terms must become historical immutable truth.
-   Multi-country/currency/language foundations Day One.
-   لا ادعاء escrow غير مدعوم قانونيًا/مزوديًا.

## Architecture / Technical Implications

Day-One foundations: Organizations & permissions; multi-currency;
Product≠Offer; RFQ/Quote versioning; Order snapshots; Payments separate
from Orders; financial ledger; idempotency; audit logging; events +
transactional outbox; search abstraction; object storage/private files;
notifications; admin permissions; observability; security;
feature/market configuration; Go/Python contract boundaries; API
contracts/versioning.

## Deferred Items

Advanced AI، عدد كبير من providers، deep carrier/inspection
integrations، advanced ads/procurement، global customs automation،
factory audits/labs/container loading، complex roles/SSO، ERP/EDI، trade
finance/BNPL/wallet/advanced FX.

## Rejected / Deferred Alternatives

Hard buyer/supplier split --- Rejected. Product=Offer --- Rejected. Paid
plan=verification --- Rejected. Sponsored=verified --- Rejected.
Unsupported escrow claim --- Rejected. Full global customs/tax engine in
V1 --- Deferred.

## Open / Unresolved Items

Exact providers، exact rollout markets، exact legal/compliance
implementation per market، exact policy numbers.

## Source Preservation Notes

الرؤية اعتمدت fast-to-market مع complete V1 foundations، وليس tiny MVP.

------------------------------------------------------------------------

# Phase 02 --- V1 Functional Scope

## Approved Outcomes

V1 **functionally complete**, وليست MVP ناقصة. يجب أن تثبت end-to-end:
buyer
RFQ/quote/order/payment/fulfillment/inspection/shipping/dispute/refund/settlement/review؛
sample→wholesale؛ supplier onboarding→verify→publish→sell→settle؛ وOps
بدون DB/dev intervention طبيعي.

## Detailed Decisions

### Accounts / Organizations

email/mobile + password، verification، profile، recovery/change، logout
devices/security، social later. Org: legal/trade name, country/address,
business type, registration, website, phone, desc, logo, markets. Org
buyer/supplier/both. V1 roles Owner/Admin/Member، email invite. Light
buyer onboarding. Supplier onboarding + verification docs + settlement
identity when needed + submit/review. Verification Center. Optional
Verified Business Buyer. Public supplier storefront. لا final
buyer/supplier choice.

### Catalog / Offers

Central hierarchy categories؛ Product≠Offer؛ multilingual ar/en؛ Offer
currency/MOQ/unit/tier/availability/lead/negotiable/sample/customization/shipping/trade؛
units؛ category attributes foundation؛ simplified variants؛ samples؛
OEM/ODM/private label؛ certification distinction؛ media/docs scanning؛
moderation lifecycle؛ filters/sort؛ favorites؛ simplified compare؛
version/snapshot terms.

### RFQ / Quotes / Messaging

Direct/open RFQ، structured fields، lifecycle/deadline، simple matching،
structured versioned Quote، counter/revision، acceptance snapshot→Order،
formal material changes، compare، contextual messaging، notifications،
spam/report/block، RFQ privacy/moderation، one RFQ can create multiple
separate supplier Orders، direct product negotiation.

### Orders / Samples

Direct / Accepted RFQ / Negotiated / Sample. Same commerce core.
Snapshot، lifecycle، milestones، Order Change Request، cancellation،
sample→wholesale، inspection states، multiple/partial shipments،
documents/timeline/internal notes، one supplier/order V1، reorder on
current terms، PO number.

### Payments / Protection

Breakdown، multi-currency، currency distinctions، multiple payments،
full/deposit+balance simplified، Trade Protection without unsupported
escrow claim، settlements، configurable commission، full/partial
refunds، disputes/evidence/resolution، inspection financial impact،
ledger، provider-authoritative payment status، secure settlement
account، Financial Admin.

### Shipping / Inspection

3 shipping models،
origin/destination/responsibility/method/dates/cost/incoterm، shipments،
manual tracking، docs، freight forwarder، assisted shipping
request/quote/accept/fee/partner، inspection
request/partner/checklist/custom
requirements/gate/reinspect/fee/POD/problems/sample.

### Reviews / Trust

Eligible completed wholesale reviews، sample reviews marked،
dimensions/comment/photos، verified transaction، supplier reply، admin
removal by policy/audit، reputation signals، distinction
verification/inspection/review/protection.

### Supplier Dashboard / Monetization

Needs-attention dashboard، product mgmt، RFQ Opportunity Center، Inbox +
simple lead states، fulfillment، finance، analytics. Free +
**Professional Supplier Plan**. Professional may offer higher
limits/storefront/analytics/RFQ
opportunities/support/team/promo/enhanced verification options، لكن
verification نفسها لا تباع. Commission may differ. Sponsored clearly
labeled. Simple campaigns. Storefront for all.

### Buyer Workspace

Saved products/suppliers، RFQs، quotes، compare، messages، samples،
orders، shipments، inspections، disputes، docs، buying dashboard،
simplified shortlists، purchase history/reorder، docs center، team
roles؛ complex approvals later.

### Admin / Operations

Needs-attention dashboard، users/orgs، verification، roles، orders،
RFQs، message metadata per policy، reviews، disputes، history/risk،
restrict/suspend/reactivate audit، verification queue، product
moderation/prohibited، taxonomy/attrs/units/certs، RFQ moderation،
unified order view، finance controls no direct status hacks،
dispute/inspection/logistics/settlement/commission/subscription/ads/reviews/CMS/localization/market
config/feature controls/support/audit.

### Notifications / Localization / Analytics

Arabic+English extensible؛ preferred language/country/timezone/currency
preference. In-app+email required، SMS important events by market، push
foundation later. Analytics: funnel, GMV, revenue, active users, RFQs,
quotes, conversions, AOV, sample conversion, revenue streams,
refund/dispute، segmentation.

## Business / Product Rules

Simplified ≠ missing foundation. One supplier per Order V1. One RFQ can
produce separate supplier Orders. Ops must not require normal DB hacks.

## Architecture / Technical Implications

All core domains and cross-cutting foundations must appear early enough
to support V1.

## Deferred Items

Advanced AI/search/negotiation/translation، auctions، complex SSO/roles،
ERP/EDI، CRM، customs automation، freight marketplace، warehouse،
factory audits/labs/IoT، LC/trade finance/BNPL/FX/wallet، advanced
procurement/ads/analytics.

## Rejected / Deferred Alternatives

Tiny MVP omitting foundations --- Rejected. Verification sold through
plan --- Rejected. DB status hacks as normal Ops --- Rejected.

## Open / Unresolved Items

Exact plan limits، providers، policy time windows، auto-completion
details، market capability matrix values.

## Source Preservation Notes

V1 completeness was explicitly tied to real commercial lifecycle and
operability.

------------------------------------------------------------------------

# Phase 03 --- End-to-End Business Flows

## Approved Outcomes

ثمانية flows معتمدة.

## Detailed Decisions

**A Supplier onboarding:** account → org → Sell on Atlazora → supplier
profile → Verification Center → submit → Ops review
(verified/changes/rejected) → while waiting prepare
storefront/products/offers → moderation → discoverable → first lead.
Expiry causes review/restriction, not history deletion.

**B Direct wholesale:** search → results → product → Buy Direct →
qty/tier → specs/variants → destination → shipping → incoterm → optional
inspection → breakdown → snapshot/order Awaiting Payment → payment →
provider confirmation → Paid/Protected → supplier. Revalidate
price/availability; retry failed payment; customization may redirect
RFQ.

**C RFQ:** create → requirements → open → matching → supplier
quote/decline/questions → compare → Quote versions → optional sample →
final quote → accept → snapshot/order/payment. Multiple awards =
separate Orders.

**D Sample:** request → terms → shipping → sample order/payment if
needed → prepare/ship/deliver → sample-marked review → wholesale
quote/negotiation → wholesale order. Track conversion.

**E Fulfillment:** Order snapshot → deposit where applicable →
protected/production authorized → milestones → goods ready → inspection
→ balance where terms require → ready ship → shipping model →
shipments/partials → delivered/POD → accept or dispute → completion →
commission → settlement → review.

**F Dispute:** problem+evidence → attempt resolution → open dispute →
evidence package → response → Ops review → resolution → actual financial
execution → audit → close.

**G Assisted shipping:** request → cargo info → Ops → partner quote →
recorded Shipping Quote → accept → fee → pickup → shipment/docs →
transit → delivered/POD.

**H Subscription/promotion:** Free→Professional
subscription/payment/entitlements. Promotion
product→placement/duration/budget→payment→moderation→active→metrics.
Sponsored≠recommended≠verified.

## Business / Product Rules

Provider confirms payment; chat not official terms; inspection may gate
shipping; dispute decision must propagate to finance.

## Architecture / Technical Implications

Cross-domain orchestration with independent sources of truth.

## Deferred Items

Advanced automation in matching/logistics/inspection/promotion.

## Rejected / Deferred Alternatives

Browser return as payment authority --- Rejected. Chat as agreement ---
Rejected. Multi-supplier Order V1 --- Rejected.

## Open / Unresolved Items

Provider-specific and policy timing details.

## Source Preservation Notes

هذه flows أصبحت أساس E2E وV1 completeness.

------------------------------------------------------------------------

# Phase 04 --- Atlazora Gap Analysis

## Approved Outcomes

Legacy Laravel لا يُرمى بالكامل ولا يُحافظ على business core كما هو. نحافظ
على useful UI/UX/assets/localization/concepts ونستبدل business
architecture تدريجيًا.

## Detailed Decisions

-   Identity users/vendors/org: REPLACE/major refactor؛ User remains،
    Organization/Member new.
-   Auth: reuse concepts، rebuild security flow.
-   KYB/team: new.
-   Storefront: reuse UI/content ideas، rebuild domain.
-   Catalog: major refactor Product≠Offer.
-   ProductSupplier: reuse idea، rebuild as Offer.
-   MOQ/tier: new.
-   Multi-currency: replace؛ Money+Currency.
-   Hardcoded 15% tax: remove/replace.
-   Cart: replace as B2B truth؛ direct-buy UX may remain.
-   RFQ/Quote/Messaging: new.
-   Orders: reuse freeze/snapshot idea، rebuild.
-   Coupons: optional/deferred reuse.
-   Telr: replace with provider adapter; only re-add deliberately.
-   Ledger: new.
-   Vendor accounting: conceptual reuse → Ledger/Commission/Settlement.
-   Delivery: replace → Shipment/Logistics.
-   Driver concept may later be provider/ops detail.
-   Inspection: new.
-   Reviews: rebuild tied transaction.
-   Returns scaffolding: do not port; dispute/refund model.
-   Trade Protection: new.
-   Subscriptions/ads: new.
-   Notifications: reuse concepts where useful، new foundation.
-   Localization: KEEP/improve.
-   Files: rebuild public/private/sensitive security.
-   Admin/Supplier portals: reuse visuals، major functional/domain
    rebuild.
-   Vue: preserve visual system، refactor data/workflows.
-   Mobile: out current scope.
-   Testing foundation: new.
-   Queue/background: replace/expand.
-   Business events: new.

Legacy audit context preserved: Laravel 9/PHP 8.0.2+, Vue 3 customer
frontend، Blade Admin/Supplier/Driver، Sanctum/Dingo، file
cache/session، sync queue، hardcoded Saudi VAT، no multi-currency، Telr
SAR assumptions، minimal tests، incomplete review/return scaffolding.

## Business / Product Rules

Legacy = reference/evidence، not target truth.

## Architecture / Technical Implications

Progressive semantic migration required.

## Deferred Items

Mobile، coupons priority، legacy driver-specific model.

## Rejected / Deferred Alternatives

Throw away all useful UI/assets --- Rejected. Keep Laravel business
model --- Rejected. Port returns scaffolding --- Rejected. Keep Saudi
hardcoding --- Rejected.

## Open / Unresolved Items

Exact historical data and exact UI component reuse.

## Source Preservation Notes

Gap analysis explicitly says "not throw away, not preserve core
unchanged."

------------------------------------------------------------------------

# Phase 05 --- Domain & Data Model

## Approved Outcomes

Domains/entities: - Identity: User, Organization, OrganizationMember
(Owner/Admin/Member). - Supplier: SupplierProfile,
VerificationCase/Requirement/Document/Decision. - Catalog: Product,
Category, Translation, Media, AttributeValue, cert refs, Offer,
PriceTier, SampleTerms, CustomizationCapability, ShippingTerms,
variants, Money, FXConversion. - Sourcing: RFQ, Quote, immutable
QuoteVersion, Conversation, Message. - Commerce: Order, OrderItem,
commercial snapshot, OrderAgreement, OrderChangeRequest,
`Order.type=SAMPLE` + links. - Finance: Payment, LedgerEntry,
CommissionRule, Settlement, SettlementAccount, Refund. - Logistics:
Shipment, ShippingRequest, ShippingQuote. - Inspection:
InspectionRequest/Assignment/Report/checklist/evidence/result. -
Disputes: Dispute/Claim/Evidence/Response/Decision. - Trust: Review. -
Growth:
SubscriptionPlan/SupplierSubscription/PlanEntitlement/Campaign/PromotedPlacement/CampaignMetric. -
Platform: Notification, Document, AuditEvent, AnalyticsEvent.

## Detailed Decisions

Key invariants: - verification through requirements+Ops؛ expiry
restricts, no history deletion؛ paid≠verified. - Product publish≠buyable
Offer؛ price has currency؛ price-on-request no direct fixed purchase؛
MOQ positive؛ tiers nonambiguous. - QuoteVersion immutable؛ expired not
accepted؛ one accepted version per path. - accepted/direct snapshot
immutable from later Product/Offer. - one buyer org + one supplier org
per Order V1. - material changes through OrderChangeRequest/mutual
acceptance. - Payment independent lifecycle؛ provider authoritative؛
idempotent multiple attempts/events. - refund ≤ refundable confirmed
amount. - ledger traceable؛ corrections via adjustments. - commission
snapshotted. - settlement eligibility explicit. - multiple/partial
shipments. - inspection-before-ship gate. - dispute lifecycle
independent؛ financial resolution creates real movements. - sample can
bypass MOQ and is marked/linked. - review eligible transaction only؛
supplier cannot delete؛ admin removal audited. - chat not official
commercial truth. - document context/classification/access. - org must
retain owner؛ explicit membership/permissions؛ sensitive reauth/MFA. -
subscription expiry does not delete history/products. - ads do not
change verification/reputation. - no adding currencies without recorded
conversion. - normalized timestamps/timezone display. - idempotency
external financial events. - sensitive audit. - historical integrity via
snapshots/versions.

Sources of truth: Identity user/member؛ Verification verified state؛
Catalog current product/offer؛ Quote preaccept terms؛ OrderAgreement
postaccept truth؛ Finance financial truth؛ Logistics shipment؛
Inspection result؛ Dispute decision.

## Business / Product Rules

Order≠Payment؛ Order≠Shipment؛ Finance owns financial lifecycle even
when Order/Dispute influences eligibility.

## Architecture / Technical Implications

Strict domain ownership even inside shared initial PostgreSQL cluster.

## Deferred Items

Service extraction/enterprise complexity.

## Rejected / Deferred Alternatives

Current Product price as historical truth --- Rejected. Deleting
financial history --- Rejected. Cross-domain direct mutation ---
Rejected.

## Open / Unresolved Items

Physical schemas/indexes، exact IDs، exact money representation،
detailed event/API conventions.

## Source Preservation Notes

Invariants are foundational requirements.

------------------------------------------------------------------------

# Phase 06 --- Target Architecture

## Approved Outcomes

-   Vue 3 + TypeScript all web surfaces.
-   Go primary transactional/business Core.
-   Python V1 Intelligence/Data.
-   Laravel/PHP legacy/transitional only.
-   Rule: transactional truth→Go؛ UI→TS/Vue؛ AI/Data→Python.
-   Modular Architecture → service-ready boundaries → progressive
    microservices.
-   Go Modular Monolith Core first.
-   Python gives scores/analysis؛ Go decides؛ Python no direct Core DB
    mutation.
-   Web and Admin separate deployables.
-   Admin uses APIs، no DB shortcuts.
-   REST + OpenAPI V1؛ strict
    contracts/errors/correlation/timeouts/retry/idempotency.
-   PostgreSQL transactional truth.
-   Initial shared cluster allowed with domain ownership؛ no
    cross-domain direct writes.
-   No distributed DB transaction as normal design.
-   Transactional Outbox Day One.
-   Idempotency Day One.
-   Structured versioned events.
-   Lightweight reliable broker before Kafka؛ Kafka only with real need.
-   OpenSearch long-term direction، derived/rebuildable.
-   Redis ephemeral.
-   S3-compatible storage؛ public/private/sensitive؛ validation→malware
    scan→classification→storage→authorized access.
-   Notifications via events/policy.
-   RBAC/MFA/rate
    limits/secrets/encryption/audit/scanning/backups/logs/metrics/traces/correlation/feature-market
    config/least privilege/graceful degradation.
-   Arabic+English، RTL/LTR، country capability matrix، explicit
    currencies/FX.

Official repos: `Atlazora-original-laravel` `atlazora-project`
`atlazora-web` `atlazora-admin` `atlazora-core` `atlazora-intelligence`
`atlazora-contracts` `atlazora-infra`

New repo مثل `atlazora-payments` فقط عند real extraction.

Deployment: Core API + Core Worker same codebase separately scalable؛
Intelligence API/worker as needed؛ Web/Admin separate.

## Detailed Decisions

Microservice extraction only for
scaling/security/runtime/team/reliability reasons. True service needs
responsibility/contracts/data/deploy reason.

## Business / Product Rules

Architecture preserves approved domain invariants.

## Architecture / Technical Implications

هذا هو target architecture الرسمي.

## Deferred Items

Kafka، gRPC، service mesh، extra backend languages، broad extraction،
advanced realtime until justified.

## Rejected / Deferred Alternatives

Big-bang microservices --- Rejected. Permanent Laravel target core ---
Rejected. Python transactional writer --- Rejected. Frontend/Admin DB
access --- Rejected. Redis/Search truth --- Rejected. GraphQL "for
fashion" --- Rejected. Kafka without need --- Rejected.

## Open / Unresolved Items

Exact broker، event version details، public IDs، money representation،
exact managed search/provider choices.

## Source Preservation Notes

Architecture balances future service extraction with solo-operator
simplicity.

------------------------------------------------------------------------

# Phase 07 --- Infrastructure & DevOps Architecture

## Approved Outcomes

Rule: \> **Build Production-ready from the start, but do not pay
Production-size from the start.**

Approved: - GCP - Dammam `me-central2` - GKE Autopilot - Terraform -
managed production data - Cloud IAM / Secret Manager - single cloud
initially, portable enough

Environment: Local → CI → Dev → Staging → Production.

Local runs almost everything via Docker/containers. Small real GCP
Staging before launch. Production activates
HA/PITR/WAF/CDN/monitoring/managed services/autoscaling as needed.

## Detailed Decisions

Containers: multi-stage/minimal/non-root/pinned/scanned/immutable؛
Artifact Registry.

PostgreSQL managed Production، not primary DB in K8s؛
backup/PITR/HA/private/encryption/monitoring.

Managed Redis/Search preferred in Production؛ object storage managed؛
CDN.

Network: Internet→Edge/CDN/WAF→LB→GKE ingress/gateway→services؛ internal
services private.

Secret Manager؛ Workload Identity؛ no static SA JSON keys؛ separate
cloud projects dev/staging/prod؛ least privilege.

Conceptual domains: atlazora.com, api., admin., maybe assets.; internal
services no public subdomain.

CI/CD: Git→checks→build→security→artifact→deploy. No Prod from laptop.
main + short branches. Merge→Dev; promote same artifact Staging/Prod.
Build once/promote. Production controlled/manual initially. Immutable
digest, no `latest`.

DB: expand→migrate→contract؛ no destructive incompatible same release؛
app rollback distinct from DB.

Contracts: backward compatible add→migrate consumers→remove later؛
breaking event semantics versioned.

Security/supply chain: dependency/container/secret/static/IaC scanning،
SBOM useful، federated CI credentials، trace
commit→build→digest→deployment، non-root، K8s RBAC/network policies.

Observability: structured logs, OpenTelemetry, metrics/traces,
correlation, latency/error/volume/queue/DB/payment
webhook/settlement/search lag، business monitoring، synthetic checks،
dashboards Platform
Health/Commerce-Payments/Infrastructure/Security-Abuse.

DR: backups+PITR، restore tests، define RPO/RTO، finance/orders
stronger، Search rebuildable، Redis not truth، no active-active V1،
runbooks.

Scaling/cost: API horizontal، workers backlog، Python workload، DB
controlled، connection pools، retry/DLQ، budgets/alerts/cost labels.

Production readiness: backups/restore/alerts/health/WAF/secrets/private
DB/rollback/payment E2E/audit/logging/tracing/runbooks.

## Business / Product Rules

Cost and solo-operator simplicity are first-class with
security/performance/scalability.

## Architecture / Technical Implications

GCP/GKE/Terraform are confirmed target infrastructure choices.

## Deferred Items

Active-active، service mesh، SOC-scale complexity، advanced
canary/blue-green، production-sized cloud during early dev.

## Rejected / Deferred Alternatives

Prod DB in K8s --- Rejected. Prod deploy from laptop --- Rejected.
Static SA JSON keys --- Rejected. Public DB/Redis default --- Rejected.
Rebuild per environment --- Rejected. Active-active V1 --- Rejected.

## Open / Unresolved Items

Exact managed Redis/Search SKUs، WAF/CDN config، numeric SLO/RPO/RTO،
capacity، broker.

## Source Preservation Notes

Cost rule is explicit and foundational.

------------------------------------------------------------------------

# Phase 08 --- Migration Strategy

## Approved Outcomes

> **Progressive Semantic Migration**

Not line-by-line rewrite، not blind Big Bang، not permanent hybrid.

Legacy remains reference/read during development؛ new system in new
repos.

## Detailed Decisions

Understand old behavior→map new domain→clean implementation→test
relevant equivalence.

Identity User/Vendor→User/Org/Member/SupplierProfile. Passwords never
plaintext؛ legacy-hash verify/rehash only if real data justifies.
Catalog Product/Vendor/price→Product+Offer؛ missing B2B fields require
supplier completion. Media validate→object storage→Media/checksum.
Taxonomy reviewed/mapped، not blind. ProductSupplier→Offer. Historical
Orders may carry `source=legacy`؛ do not fabricate missing
payment/shipping. Financial history no guessing؛ opening/legacy entries
only if justified. Telr not ported directly؛ provider adapter. Remove
hardcoded 15% tax. All new money has currency؛ known legacy SAR mapping
documented where valid. Old cart not core migration.
Delivery→Shipment/Logistics. Vendor accounting
intent→Ledger/Commission/Settlement. Reviews only trusted data؛
returns→dispute/refund where meaningful. Admin/supplier UI preserve
design useful، rebuild workflow/domain. Temporary adapters controlled.
**One Source of Truth per data type at any moment.** No random dual
writes؛ controlled sync/events only if needed؛ prefer domain cutover.
`legacy_source`/`legacy_id`. Repeatable idempotent ETL:
Extract→Transform→Validate→Load→Verify + reports. Validation beyond row
counts. Retire Laravel only after verified cutover؛ archive repo/final
MySQL backup/retention.

## Business / Product Rules

Never invent missing historical facts.

## Architecture / Technical Implications

Migration repeatable/idempotent/reconcilable.

## Deferred Items

Exact data scope/retention/transforms after profiling.

## Rejected / Deferred Alternatives

Line-by-line --- Rejected. Blind Big Bang --- Rejected. Permanent hybrid
--- Rejected. Random dual writes --- Rejected. Blind taxonomy copy ---
Rejected. Fabricated history --- Rejected.

## Open / Unresolved Items

Exact legacy scope/password migration/cutover duration/retention.

## Source Preservation Notes

Semantic preservation, not structural copying.

------------------------------------------------------------------------

# Phase 09 --- Implementation Roadmap

## Approved Outcomes

Hierarchy: \> **Phase → Wave → Work Unit → Task**

Principles: vertical slices؛ one primary WU at a time؛
tests/security/observability/docs part of capability؛ no backend-all
then frontend-all.

Priority: P0 correctness/security/data P1 blocking dependency P2 V1
business capability P3 UX/ops P4 future

Build order: W00 Engineering Foundation W01 Identity & Organizations W02
Supplier & Verification W03 Catalog W04 Offers W05 Search & Discovery
W06 RFQ / Quotes / Messaging W07 Orders & Samples W08 Payments / Finance
/ Protection W09 Logistics W10 Inspection W11 Disputes / Completion W12
Reviews / Reputation W13 Monetization W14 Platform Completion W15 Legacy
Final Migration W16 Cutover Readiness W17 Legacy Retirement

Waves ≠ planning Phases.

## Detailed Decisions

### W00 Work Units

1.  W00-WU01 Project Governance & Repositories
2.  W00-WU02 Local Development Platform
3.  W00-WU03 Go Core Foundation
4.  W00-WU04 Contracts Foundation
5.  W00-WU05 Event & Outbox Foundation
6.  W00-WU06 Python Intelligence Foundation
7.  W00-WU07 Web Foundation
8.  W00-WU08 Admin Foundation
9.  W00-WU09 Infrastructure Foundation
10. W00-WU10 CI/CD & Supply Chain
11. W00-WU11 Observability Foundation
12. W00-WU12 Security Baseline
13. W00-WU13 Foundation Integration Test

WU01 includes official repos, `atlazora-project`, planning→docs,
PROJECT_STATE, ADRs, roadmap/templates, GitHub
labels/milestones/project.

WU02 reproducible local platform with
PG/Redis/Search/S3-like/Go/Python/Web/Admin via Docker/Compose.

WU03 Go
bootstrap/config/HTTP/middleware/errors/validation/PG/migrations/transactions/logging/health/readiness/correlation/testing/module
conventions.

WU04 OpenAPI/versioning/errors/pagination/money/IDs/timestamps/event
envelope/schema/breaking checks.

WU05 events/outbox/publisher/retry/idempotency.

WU06 Python
API/worker/config/logging/tracing/health/contracts/tests/container.

WU07 Vue3/TS/routing/API/errors/i18n
RTL/LTR/design/auth-ready/tests/legacy visuals.

WU08 Vue3/TS admin/layout/permission nav/API/i18n/audit-friendly/tests.

WU09 Terraform GCP env/network/GKE/DB/storage/IAM/Secret
Manager/registry/DNS/edge.

WU10 CI/CD scans/artifacts/contracts/Terraform/federated auth.

WU11 structured logs/OpenTelemetry/metrics/tracing/health/error.

WU12
secrets/containers/network/deps/headers/CORS/rate-limit/files/IAM/audit.

WU13 Web→Core→PG→Outbox→Worker/Event→Intelligence integration +
containers/health/contracts/CI/observability/reproducibility.

### W01

User Domain; Authentication; Account Verification & Recovery;
Organizations; Membership & Invitations; RBAC & Authorization;
Security/MFA/Sessions; Web UX; Admin Identity Ops; Integration & E2E.

### W02--W17

W02 Supplier/Verification. W03 Catalog. W04
Offers/Money/MOQ/tiers/samples/customization/shipping. W05
Search/indexing/ar-en/ranking/Python signals/recovery. W06
RFQ/Quotes/Messaging. W07 Orders/Samples. W08
Payments/Finance/Protection with higher rigor. W09 Logistics. W10
Inspection. W11 Disputes/Protection Completion. W12 Reviews/Reputation.
W13 Monetization. W14 Platform Completion. W15 final migration dry runs.
W16 cutover readiness. W17 legacy retirement.

Milestones: M0 Engineering Platform Ready M1 Supplier Can Join Atlazora
M2 Supplier Can Publish Wholesale Inventory M3 Buyer Can Discover &
Source M4 Buyer Can Create Commercial Transaction M5 Money Can Move
Safely M6 Order Can Be Fulfilled M7 Trade Lifecycle Complete M8 Business
Model Operational M9 V1 Feature Complete

Other rules: - Local→CI→Dev→Staging→Production. - backward-compatible
contracts. - no floating point money؛ exact representation W00. -
timestamps normalized. - public-safe ID convention W00. - domain owns
data. - Python never `UPDATE orders`. - Search derived. - Redis
ephemeral. - provider adapters. - failure-first: duplicate request,
timeout, duplicate callback, worker death, DB commit/event split,
double-click.

## Business / Product Rules

Roadmap follows dependencies/correctness.

## Architecture / Technical Implications

WU may touch contracts/core/web/admin/infra as vertical slice.

## Deferred Items

No arbitrary deadline؛ estimate after W00/W01 velocity.

## Rejected / Deferred Alternatives

Backend-all then frontend-all --- Rejected. Many simultaneous primary
WUs --- Rejected. Arbitrary deadline now --- Rejected.

## Open / Unresolved Items

Detailed later-Wave WUs، exact money/ID/event conventions.

## Source Preservation Notes

Phase 09 closed before implementation.

------------------------------------------------------------------------

# Phase 10 --- Testing & Security

## Approved Outcomes

Testing/security integrated from W00 and every WU.

Portfolio: Unit → Integration → Contract → E2E → Performance/Resilience.

## Detailed Decisions

Go: native tests، strong domain tests، real PostgreSQL integration، not
SQLite substitute.

Python: pytest، Ruff، type checker final choice mypy/Pyright،
ranking/document/matching/contracts/workers.

Vue/TS: ESLint، typecheck، unit/component، auth-aware UI/forms/errors،
Playwright critical E2E.

Candidate/baseline tools---not all immutable choices: - Go: gofmt, go
vet, staticcheck/golangci-lint - Python: pytest, Ruff, mypy/Pyright -
TS: ESLint, TypeScript, Playwright - Secrets: Gitleaks - SAST: Semgrep -
Containers: Trivy - IaC: Checkov or Trivy IaC - DAST: OWASP ZAP possible

Required categories: dependency scan، secret scan، SAST، container scan،
IaC scan، OpenAPI/breaking checks، SBOM/immutable/provenance
foundations.

Authorization matrix and organization-isolation tests required؛ admin is
not `if admin allow everything`. Ops role concepts include Verification
Reviewer, Catalog Moderator, Dispute Operator, Finance Operator,
Platform Administrator.

Auth tests: brute force, reset, verification, session expiry/revocation,
logout devices, MFA bypass, enumeration, rate limits.

Files: fake extension/MIME/oversize/malware safe test/unauthorized
download/expired signed URL/cross-org/misclassification.

Payments: duplicate/out-of-order webhook، tampered amount، wrong
currency، replay، timeout، success after disconnect، partial/double
refund، deposit+balance، failed settlement، reconciliation mismatch.

Financial invariants: ledger correctness، refund limit، settlement
limit، immutable commission snapshot، no silent currency mixing،
rounding، concurrency/idempotency. Property-based testing where
valuable.

Concurrency: accept twice، pay twice، duplicate idempotency key، two
workers same outbox، concurrent refund/settlement.

Contract/event compatibility required.

Selective visual regression، accessibility، Arabic RTL/English LTR، long
translations، currency/date/timezone، mixed text.

Search curated ar/en query set + regression.

Performance: load/stress/soak، p95/p99، errors/resources؛ budgets from
baselines, not arbitrary.

Resilience: Redis/Search/Python/email/payment/worker/DB connection
failure؛ controlled failure drills.

Backup/DR actual restore/PITR/recovery-time validation.

Threat modeling for sensitive domains؛ abuse cases RFQ spam/fake
suppliers/mass messaging/review abuse/promotion manipulation/file
abuse/account farming/credential stuffing/scraping.

CI tiers: PR: format/lint/type/unit/secret/selected SAST/contracts.
Main: integration/dependency/container/broader SAST. Staging:
E2E/DAST/provider sandbox/migration/selected load. RC: critical
E2E/financial/authz/security/performance/resilience/backup
evidence/release review.

Findings: False Positive / Accepted Risk / Fix Required / Deferred with
justification. Critical exploitable blocks Production.

Release gate: no unresolved critical، no blocking P0/P1، authz passes،
finance passes، critical E2E، restore، scans، infra security،
logging/audit، secret rotation، runbooks.

Go/No-Go recorded.

## Business / Product Rules

Scanner ≠ business authorization test. Security continuous after launch.

## Architecture / Technical Implications

Tooling starts W00 and deepens by domain.

## Deferred Items

Mutation testing optional؛ SonarCloud/Snyk-like tools evaluated later؛
exact tool versions/final overlaps implementation-time.

## Rejected / Deferred Alternatives

100% coverage vanity target --- Rejected. E2E-only --- Rejected.
Duplicate scanners without value --- Rejected. Security only at end ---
Rejected. Uncontrolled DAST Prod --- Rejected. Ignoring flaky tests ---
Rejected.

## Open / Unresolved Items

Final overlapping tools، coverage thresholds، performance budgets،
browser matrix، RPO/RTO، pentest provider.

## Source Preservation Notes

Phase 10 planning complete؛ implementation remains W00+WUs.

------------------------------------------------------------------------

# Phase 11 --- Staging & Pilot Launch

## Approved Outcomes

Pilot is not demo؛ validates real
Buyer→Supplier→Product/Offer→RFQ/Quote/Order→Payment→Fulfillment→Shipping/Inspection→Completion/Settlement
under controlled scope.

Environment model refined to: Local → Development → Staging → Production
(Private Pilot) → Production (Public).

Staging: same architecture, smaller capacity.

## Detailed Decisions

Production-like Staging: GCP/GKE Autopilot/managed
PG/Redis/Search/Object Storage/Secret Manager/Artifact
Registry/Terraform/edge/observability.

No manual remembered Staging.

Production exists before public launch and is exercised by Private
Pilot.

Provider env: Local Mock/Fake Dev Sandbox Staging Sandbox/Test Prod Live

Payment sandbox covers
success/fail/cancel/timeout/duplicate/delayed/wrong amount/wrong
currency/refund/partial/deposit-balance/reconciliation.

Live payments gradual with limits and close monitoring.

Pilot scope intentionally narrow؛ architecture remains global-ready.

Pilot suppliers selected and varied؛ real onboarding, no DB shortcut.
Pilot buyers cover search, low MOQ, customization, sample, RFQ, compare,
direct order, international where feasible. Do not over-script
usability.

Seed useful real catalog. Quality gate:
title/category/images/description/MOQ/terms/currency/lead/origin/supplier
info.

Verification metrics and real Ops review. RFQ metrics:
completion/matches/response/time first quote/quote
count/negotiation/acceptance/conversion. Sample flow and conversion.
Shipping models tested within scope؛ assisted may be manual
operationally. Inspection real workflow where enabled. Trade Protection
language accurate. Controlled dispute drill. Settlement end-to-end +
reconciliation. Conservative real-money limits.

Pilot access: invite/approved/flag/market/allowlist.

RC examples `v1.0.0-rc.1`, `.2`. Build once/promote same artifact.

Migration rehearsal repeatable with timing/reconciliation reports.

Pilot dashboard: System Health, Payment Health, Orders Today, Failed
Payments, Stuck Orders, Queue Lag, Search Health, Supplier Onboarding,
RFQs/Quotes, Open Disputes, Pending Settlements, Critical Alerts.

Feedback classifications: Bug/UX/Missing V1/Operational/Feature
request/Education. Do not build every request.

Severity: P0 money/security/data corruption/system unavailable P1
critical business flow P2 important with workaround P3 cosmetic/minor

Incident flow and postmortem. Support paths across all major domains.
Normal Ops no SQL.

Security monitoring and cost monitoring. Progressive exposure approved;
exact cohort numbers illustrative only.

Pilot exit: stable critical E2E، no P0، critical P1 addressed،
finance/reconciliation/settlement proven،
onboarding/sourcing/shipping/inspection/dispute/support/restore/monitoring/security/migration
proven.

Rollback preserves transactions. Controlled freeze before public launch.

## Business / Product Rules

Pilot validates actual marketplace and Ops.

## Architecture / Technical Implications

Private Pilot on real Production architecture where practical.

## Deferred Items

Exact market، cohort sizes، targets، live limits.

## Rejected / Deferred Alternatives

Pilot as demo --- Rejected. Everything enabled at once --- Rejected. DB
onboarding shortcuts --- Rejected. Rebuild artifacts between envs ---
Rejected. Last-minute nonessential scope --- Rejected.

## Open / Unresolved Items

Exact first market/users/numeric gates/baselines.

## Source Preservation Notes

Planning complete، execution not yet performed.

------------------------------------------------------------------------

# Phase 12 --- Production Launch & Operations

## Approved Outcomes

Production Ready → Controlled Go-Live → Early-Life Support → Stable
Operations.

## Detailed Decisions

Topology: Users→DNS→CDN/WAF→LB/Gateway→GKE workloads→managed
PG/Redis/Search/Object Storage.

Separate Prod project/IAM/secrets/data.

Domains conceptually atlazora.com/api/admin. CDN public/static only؛ WAF
defense-in-depth؛ HTTPS/TLS.

Managed PG with HA/backups/PITR/private/encryption/monitoring؛
connection pool discipline. Managed Redis؛ Search rebuildable؛ storage
public/private/sensitive.

Secret Manager/workload identity/least privilege. Admin stronger
MFA/RBAC/session/audit/sensitive-action verification.

Go-live: Freeze→Backup verify→Migration ready→Deploy→Safe
migrations→Health→Observability→Provider live config→Controlled
traffic→Smoke→Financial smoke→Expand.

Final cutover stops legacy writes/read-only/maintenance as needed→delta
migration→reconcile→traffic switch→verify.

Payment live gate:
credentials/webhook/signature/amount/currency/refund/reconciliation/alerts.
First live transaction closely observed across
Order/Payment/Ledger/Commission/Shipment
eligibility/Outbox/Notifications/Audit/provider.

Progressive rollout. Kill switches for new
payments/settlements/onboarding/market/inspection provider. Financial
circuit breakers.

Launch dashboard:
availability/errors/p95-p99/DB/queues/Search/payments/webhooks/orders/failed
payments/settlements/security.

Solo on-call: immediate only for Prod down/financial
correctness/critical security/data-loss؛ other levels
business-hours/informational.

SLOs after Pilot baseline؛ no fake 99.999. SEV-1
security/financial/data-loss/system-wide؛ SEV-2 major؛ SEV-3 localized
workaround؛ SEV-4 minor.

Runbooks DB/payment/webhook/Redis/Search/bad
deploy/secret/storage/queue/migration/security.

No hot edit Prod containers. App rollback ≠ DB rollback. Payment outage
never marks paid؛ Search/Python/Notification degradation safe؛ queues
monitored, not blindly deleted.

Backups/PITR/object protection/Git-Terraform history؛ periodic actual
restore. RPO/RTO by criticality؛ no active-active V1.

Patch base images/Go/Python/npm/Terraform/GKE/DB. Immutable images.
DB/Search/queue maintenance metrics.

Observability cost controlled. Cost governance across
compute/DB/Redis/Search/storage/egress/logs/security/providers؛ relate
to business outcomes later.

Scaling: API horizontal، workers backlog، Python workload، DB carefully.
Optimize schema/index/query/pooling/partitioning/capacity/read replicas
before sharding. Sharding not Day One.

Microservice extraction after real evidence. Small releases after
stability؛ change risk Low/Medium/High with stronger gates for
auth/payments/finance/migrations/permissions/infra.

Sensitive Ops audited؛ financial corrections adjustments. Support
escalation and incident communication. Security incident response with
containment/evidence/rotation/scope/recovery/investigation/required
notification/remediation. Fraud/abuse monitoring، no opaque high-impact
autobans without Ops path.

`atlazora-project` continues
architecture/deploy/runbooks/ownership/secrets/restore/incidents/releases/market/providers.
Prod access exceptional؛ normal changes Git/CI/CD؛ break-glass later if
needed. No casual Prod data copy to Dev.

New market gate covers
payments/currency/verification/shipping/inspection/restrictions/policies/support/localization/tax/legal/monitoring.
Provider change uses adapter→sandbox→contracts→failure
tests→staging→controlled rollout→monitor→rollback. Service extraction
requires ADR/ownership/contracts/data/observability/deploy/cutover and
closes old DB paths.

Weekly health initially، monthly ops، quarterly architecture as useful.

## Business / Product Rules

Launch success = real transactions + secure/operable system، not merely
servers online.

## Architecture / Technical Implications

Operations/recovery are architecture.

## Deferred Items

Exact SLO/RPO/RTO، active-active، advanced access mechanisms.

## Rejected / Deferred Alternatives

Hot edit Prod --- Rejected. Routine DB business ops --- Rejected. Blind
DB rollback --- Rejected. Fake financial truth during provider outage
--- Rejected. Premature sharding/microservices --- Rejected.

## Open / Unresolved Items

Numeric SLO/RPO/RTO، capacity، launch markets، on-call tooling،
retention values.

## Source Preservation Notes

Planning complete، not proof of launch.

------------------------------------------------------------------------

# Phase 13 --- Measure → Learn → Develop

## Approved Outcomes

Permanent loop: Measure → Learn/Understand → Decide/Prioritize → Develop
→ Release/Validate → Measure.

No random feature accumulation after V1.

## Detailed Decisions

North-star/value metrics: Qualified Buyer-Supplier Connections،
RFQ→Quote، Quote→Order، Paid/Completed Orders، Repeat Buyers، Active
Selling Suppliers، GMV. No single metric alone.

Liquidity: RFQ with ≥1/relevant multiple quotes، median time first
quote، supplier response، Search→contact/RFQ.

Supplier funnel:
Signup→Org→Verification→Product→Offer→Visibility→Inquiry/RFQ→Quote→Order→Settlement→Repeat.
Buyer funnel:
Signup→Search→View→RFQ/Contact→Quote→Order→Payment→Completion→Repeat.

Search: zero results، reformulation، CTR، engagement، Search→RFQ/Order،
curated ar/en regression.

RFQ quality/matching/response/rewrite؛ Quote
revisions/counters/time/expiry/acceptance.

Samples: request/completion/delivery/satisfaction→wholesale conversion.

Orders:
creation/payment/AOV/fulfillment/on-time/partial/completion/cancel/repeat.
Trust: verification turnaround، inspection، disputes/refunds،
response/on-time/reviews؛ no single automatic trust metric.

Disputes categorized and used as learning. Revenue streams separated:
commission، Professional subscription، promotions، inspection/service،
logistics/service. Unit economics: revenue per supplier/buyer/order،
margin، infra/provider/support/acquisition cost.

Retention/cohorts by month/country/category/supplier
type/source/verification/plan. Market/category segmentation. Ops metrics
verification/moderation/dispute/refund/settlement/support/shipping/inspection.
Technical health
availability/latency/errors/deploy/rollback/MTTR/security/DB/queue/search/cost.

Analytics event taxonomy examples: `supplier.verification.submitted`
`product.published` `offer.published` `search.performed` `rfq.created`
`quote.submitted` `quote.accepted` `order.created` `payment.succeeded`
`shipment.created` `order.completed` `review.submitted`

Analytics events versioned؛ domain events distinct؛ privacy/minimal
data؛ analytics not DB copy.

Dashboards: Executive/Marketplace، Supplier Funnel، Buyer Funnel،
RFQ&Quote، Orders&Finance، Trust&Disputes، Operations، Technical Health.

Feedback sources and structured record. Problem-first rule; do not
blindly implement requested solution.

Prioritization: business impact، user impact، strategic alignment،
evidence/confidence، effort، risk، dependency. Default post-V1 priority:
P0 Security/Financial/Data → Reliability → Liquidity → Conversion →
Retention → Revenue efficiency → Enhancements.

Experiments only when useful; hypothesis/segment/primary
metric/guardrails/duration/decision. Outcomes
Ship/Iterate/Reject/Inconclusive.

Feature flags for controlled rollout/markets/beta/experiments/emergency؛
clean old flags. Lifecycle: Idea→Problem
Evidence→Prioritized→Designed→Built→Limited
Rollout→Measured→Expand/Iterate/Remove.

V1.1 not fixed before evidence. Potential future V2 candidates are **not
commitments**: advanced procurement، ERP، CRM، sophisticated matching،
AI translation/sourcing/document intelligence، trade finance/BNPL،
advanced logistics، factory audits، advanced ads.

AI only with data/measurable benefit/fallback/explainability/risk/human
review. Python can score/reason/evidence؛ sensitive decisions may remain
human/domain controlled.

Technical debt balanced by risk. Extraction triggers: scaling، release
coupling، security isolation، availability، data ownership، team
ownership، runtime specialization.

Capacity/cost measured before optimization.
Security/support/dispute/search learning loops. Demand-supply map:
Category × Country × Buyer Demand × Supplier Supply × Conversion.

Governance continues: PROJECT_STATE, Work Units, Issues, PRs, Handoffs,
ADRs. Metric ≠ Target؛ no unsupported targets before baseline.
Founder/operator daily dashboard، weekly decisions، monthly growth،
quarterly reviews.

## Business / Product Rules

Vanity metrics alone do not define success. Success is repeatable
buyer-supplier trade and healthy marketplace liquidity.

## Architecture / Technical Implications

Analytics/privacy/feature flags/observability/governance continue after
V1.

## Deferred Items

Exact targets، experiment platform، V1.1/V2 list، AI models، service
extractions.

## Rejected / Deferred Alternatives

Random feature building --- Rejected. Vanity metrics as success ---
Rejected. Fixed V2 before evidence --- Rejected. AI everywhere ---
Rejected. Microservices for prestige --- Rejected. Never removing
low-value features --- Rejected.

## Open / Unresolved Items

Post-launch targets/roadmap depend on real data.

## Source Preservation Notes

Phase 13 is ongoing operating loop.

------------------------------------------------------------------------

# Cross-Phase Approved Decisions

-   Atlazora = MENA-origin globally accessible B2B wholesale
    marketplace.
-   Alibaba.com is reference, adapted not copied.
-   Complete V1 foundations, not tiny MVP.
-   User ≠ Organization؛ organization buyer/supplier/both.
-   Product ≠ Offer.
-   Samples, RFQ, versioned Quotes first-class.
-   Accepted terms → immutable OrderAgreement/snapshot.
-   One supplier per Order V1؛ RFQ may create separate supplier Orders.
-   Chat ≠ commercial truth.
-   Subscription ≠ Verification.
-   Sponsored/Featured ≠ Verified.
-   Verification ≠ quality guarantee.
-   Trade Protection wording must match real legal/provider structure.
-   Multi-country/multi-currency/multi-language foundation Day One؛
    Arabic+English initial.
-   Order ≠ Payment؛ Order ≠ Shipment.
-   Provider authoritative for payment.
-   Ledger/adjustments/reconciliation/idempotency required.
-   Vue3+TS Web/Admin؛ Go Core؛ Python Intelligence؛ Laravel
    legacy/transitional.
-   Modular first → progressive microservices.
-   PostgreSQL truth؛ Redis ephemeral؛ Search derived.
-   Python no Core DB writes؛ Admin no DB shortcuts.
-   REST/OpenAPI؛ Transactional Outbox؛ structured/versioned events؛
    idempotency.
-   S3-compatible storage + public/private/sensitive classification.
-   Provider adapters.
-   GCP `me-central2` + GKE Autopilot + Terraform.
-   Managed production data services؛ Secret Manager؛ Workload Identity.
-   Build once/promote immutable artifact؛ no Prod from laptop.
-   Staging production-like smaller؛ Private Pilot on real Production
    architecture where practical.
-   No active-active V1.
-   Backups must be restored/tested.
-   Testing/security integrated into every WU.
-   Progressive Semantic Migration.
-   One Source of Truth per data type during migration.
-   Git = permanent project memory.
-   `atlazora-project` = governance/memory, no app code.
-   Phase→Wave→WU→Task.
-   One primary WU IN_PROGRESS.
-   DoD + Handoff + PROJECT_STATE before next WU.
-   Major WU normally gets new chat؛ Part 2 only with Interim Handoff if
    long.
-   GitHub + Markdown + Project Board + ChatGPT؛ no Jira/Notion source
    of truth now.

------------------------------------------------------------------------

# Approved Architecture Decision Inventory

  -----------------------------------------------------------------------
  Decision                            Status
  ----------------------------------- -----------------------------------
  User ≠ Organization                 Approved / Confirmed

  Organization can buy/sell/both      Approved / Confirmed

  Product ≠ Offer                     Approved / Confirmed

  Immutable QuoteVersion              Approved / Confirmed

  Immutable accepted                  Approved / Confirmed
  OrderAgreement/snapshot

  Order ≠ Payment                     Approved / Confirmed

  Order ≠ Shipment                    Approved / Confirmed

  Go transactional Core               Approved / Confirmed

  Python Intelligence boundary; no    Approved / Confirmed
  transactional DB mutation

  Vue 3 + TypeScript Web/Admin        Approved / Confirmed

  Laravel/PHP legacy/transitional     Approved / Confirmed

  Modular architecture first,         Approved / Confirmed
  progressive microservices

  PostgreSQL transactional truth      Approved / Confirmed

  Redis ephemeral only                Approved / Confirmed

  Search derived/rebuildable          Approved / Confirmed

  OpenSearch long-term direction      Approved / Confirmed

  REST + OpenAPI V1                   Approved / Confirmed

  Transactional Outbox Day One        Approved / Confirmed

  Idempotency Day One                 Approved / Confirmed

  Structured/versioned events         Approved / Confirmed

  S3-compatible storage abstraction   Approved / Confirmed

  Public/private/sensitive documents  Approved / Confirmed

  Provider adapters                   Approved / Confirmed

  Multi-repo strategy                 Approved / Confirmed

  GCP                                 Approved / Confirmed

  Dammam `me-central2`                Approved / Confirmed

  GKE Autopilot                       Approved / Confirmed

  Terraform/IaC                       Approved / Confirmed

  Managed Production PostgreSQL, not  Approved / Confirmed
  primary DB in K8s

  Secret Manager + Workload Identity  Approved / Confirmed

  Build once/promote immutable        Approved / Confirmed
  artifact

  Progressive Semantic Migration      Approved / Confirmed

  One source of truth per data type   Approved / Confirmed
  during migration

  Testing/security in every WU        Approved / Confirmed

  Git as permanent project memory     Approved / Confirmed

  Admin uses APIs/domain rules, not   Approved / Confirmed
  DB shortcuts

  Financial corrections via           Approved / Confirmed
  adjustments

  Subscription ≠ Verification         Approved / Confirmed

  Sponsored ≠ Verification/Reputation Approved / Confirmed

  No unsupported escrow claim         Approved / Confirmed

  Arabic + English initial,           Approved / Confirmed
  extensible

  No active-active V1                 Approved / Confirmed

  Kafka only if justified             Deferred

  gRPC only if justified              Deferred

  Service mesh only if justified      Deferred

  New service repo only on real       Approved / Confirmed
  extraction
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# Deferred / Open Decision Inventory

## Deferred

Social login؛ complex roles/SSO؛ ERP/EDI؛ advanced procurement/CRM؛
auctions؛ advanced AI/search/negotiation/translation؛ AI sourcing
assistant؛ advanced document intelligence؛ freight marketplace؛
warehousing؛ factory audits/labs/IoT؛ customs automation؛ LC/trade
finance/BNPL/wallet/advanced FX؛ advanced ads/analytics؛ deep
carrier/inspection integrations؛ broad push rollout؛ Kafka/gRPC/service
mesh until justified؛ active-active؛ sharding؛ broad microservice
extraction؛ mutation testing؛ optional commercial security platforms؛
fixed V1.1/V2 list.

## Open / Unresolved

Exact payment/shipping/inspection/FX/email/SMS providers؛ legal
marketplace-protection structure؛ first Pilot/public markets؛ rollout
order؛ market tax/legal/compliance rules؛ payment/currency capability
matrix؛ event broker؛ event version details؛ public ID format؛ exact
money representation؛ managed Search/Redis SKUs؛ WAF/CDN config؛
SLO/RPO/RTO؛ capacity؛ Pilot cohorts/limits؛ plan entitlements؛ policy
timing windows/auto-completion؛ browser matrix؛ coverage thresholds؛
performance budgets؛ pentest process؛ legacy data
scope/retention/password migration/cutover duration؛ post-launch KPI
targets؛ future service extractions.

------------------------------------------------------------------------

# Source Gaps / Preservation Risks

1.  المحادثة المتاحة تحتوي مادة تخطيطية معتمدة واسعة، لكن بعض Phases
    01--09 محفوظة في سياق تلخيصي شامل وليس كل الرسائل الاستكشافية
    الأصلية verbatim.
2.  لم تُعتمد أرقام ADR؛ يجب أن يرقمها W00-WU01 بدون تغيير القرارات.
3.  لا يوجد physical DB schema نهائي؛ entities/boundaries/invariants فقط
    Approved.
4.  exact money representation غير محسوم؛ فقط منع floating point واعتماد
    الحسم في W00/contracts.
5.  public ID convention غير محسوم؛ W00.
6.  event broker غير محسوم؛ lightweight reliable managed broker قبل
    Kafka هو الاتجاه.
7.  providers غير محسومين.
8.  first Pilot market غير محسوم.
9.  لا توجد أرقام نهائية لـSLO/RPO/RTO/performance/business targets.
10. أسماء أدوات Phase 10 مثل
    Gitleaks/Semgrep/Trivy/Checkov/mypy/Pyright/ZAP هي
    candidates/baseline حيث لم يُثبت اختيار وحيد نهائي؛ categories نفسها
    Approved.
11. Phase 11 environment model تم **refine** من تسلسل فيه Pilot مستقل
    إلى Private Pilot على Production architecture قبل Public؛ هذا ليس
    تناقضًا يجب "إصلاحه" بل refinement محفوظ.
12. أرقام cohort التجريبية لم تكن commitments.
13. Mobile خارج current scope؛ مستقبلها غير مخطط هنا.
14. لا deadline تعسفي معتمد؛ التقدير بعد W00/W01 velocity.
15. legal/compliance details لا تُخمن؛ تُحسم حسب market/provider الحقيقي.
16. Phases 11--13 مكتملة تخطيطيًا فقط؛ لا تعني أن Pilot/Production نُفذا.

------------------------------------------------------------------------

# Preservation Verification

-   [x] Phases 01--13 جميعها موجودة.
-   [x]
    Product/business/V1/flows/actors/orgs/suppliers/buyers/catalog/offers/search/RFQ/quotes/messaging/orders/samples/payments/finance/protection/logistics/inspection/disputes/reviews/monetization/admin/domains/data/architecture/APIs/events/security/testing/infra/migration/legacy/roadmap/staging/pilot/production/operations/observability/learning
    loop محفوظة حيث كانت موجودة.
-   [x] Approved مفصول عن Deferred/Open/Rejected.
-   [x] لم يتم ترقية provider غير محسوم إلى Approved.
-   [x] أدوات Phase 10 المرشحة لم تُحوّل إلى اختيارات immutable.
-   [x] لا deadline مختلق.
-   [x] لا SLO/RPO/RTO/targets مختلقة.
-   [x] لا physical schema/ID format/money representation/event broker
    مختلق.
-   [x] Deferred capabilities بقيت Deferred.
-   [x] Legacy محفوظ كreference/migration source وليس target
    architecture.
-   [x] W00--W17 وM0--M9 محفوظة بالأسماء والترتيب المعتمد.
-   [x] الفرق بين 13 Planning Phases وImplementation Waves محفوظ.
-   [x] Refinement الخاص بـPrivate Pilot مسجل.
-   [x] Source gaps مسجلة بدل التخمين.
-   [x] هذا الملف Preservation/Export وليس إعادة تخطيط.

**Preservation result: PASS** استنادًا إلى المادة المعتمدة المتاحة في
المحادثة. أي عنصر ضمن Source Gaps / Open Decisions يبقى غير محسوم حتى
يظهر مصدر معتمد أو ADR/قرار جديد رسمي.
