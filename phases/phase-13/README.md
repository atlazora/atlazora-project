# Phase 13 — Measure → Learn → Develop

## Status

Planning complete and formally preserved in Git during W00-WU01.

This Phase defines Atlazora's permanent post-launch measurement, learning, prioritization, and development loop.

It does not mean that numeric targets, V1.1 scope, experiments, or future roadmap commitments have already been selected.

## Purpose

Production launch is not the end of product development.

After launch, Atlazora operates through the permanent loop:

**Measure → Learn → Decide → Develop → Release → Measure**

The purpose is to improve marketplace value using evidence rather than accumulating features randomly.

The authoritative preserved planning source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## 1. Measure

Atlazora must measure whether the marketplace is creating real commercial value.

Measurement should cover the marketplace lifecycle, not only traffic or vanity metrics.

Metrics should help identify:

- whether useful supply exists.
- whether buyers can discover relevant supply.
- whether buyers and suppliers engage.
- whether RFQs receive useful responses.
- whether Samples lead to commercial progression.
- whether Orders are successfully created and completed.
- whether money moves correctly.
- whether fulfillment succeeds.
- whether trust mechanisms work.
- whether disputes are controlled.
- whether participants return.
- whether monetization is healthy.
- whether operations are sustainable.
- whether the platform is technically healthy.

## 2. Learn

Metrics alone do not explain why outcomes occurred.

Learning combines quantitative and qualitative evidence including:

- analytics.
- funnel behavior.
- search behavior.
- RFQ behavior.
- transaction outcomes.
- support cases.
- operational observations.
- supplier feedback.
- buyer feedback.
- dispute evidence.
- provider behavior.
- technical incidents.
- cost behavior.
- experiments where appropriate.

Learning should identify causes, constraints, and opportunities rather than merely reporting numbers.

## 3. Decide

Development priorities must be chosen deliberately from evidence.

Decisions should consider:

- user/business value.
- marketplace liquidity.
- conversion impact.
- trust/safety.
- revenue.
- retention.
- operational burden.
- security.
- reliability.
- technical debt.
- cost.
- strategic fit.
- implementation effort and risk.

Not every requested feature becomes roadmap work.

## 4. Develop

Approved improvements return to the normal project execution system:

**Phase → Wave → Work Unit → Task**

Development continues to require:

- Definition of Ready.
- Definition of Done.
- architecture discipline.
- contracts.
- security.
- testing.
- observability.
- documentation.
- ADRs where architectural.
- Handoffs.
- Git as permanent project memory.

Post-launch urgency does not remove engineering governance.

## 5. Release

Changes are released through the approved controlled delivery model.

Applicable releases require:

- appropriate testing.
- security verification.
- compatibility checks.
- migration safety.
- observability.
- rollback/recovery consideration.
- controlled rollout where risk warrants it.

Feature flags may be used to separate deployment from exposure where appropriate.

## 6. Measure Again

After release, Atlazora measures whether the expected outcome actually occurred.

A change is not proven valuable merely because it shipped successfully.

The loop therefore returns to Measure.

## Marketplace Value / North-Star Direction

Atlazora should optimize for real successful B2B commercial activity rather than isolated vanity metrics.

The exact north-star metric is not finalized in Phase 13.

Potential value dimensions include:

- successful commercial transactions.
- qualified buyer demand.
- useful supplier response.
- repeat commercial activity.
- transaction completion.
- marketplace liquidity.
- trusted transaction outcomes.

The exact metric and numeric target require real operating evidence.

## Metric Is Not Target

A **Metric** defines what is measured.

A **Target** defines the desired value, threshold, or range for that metric.

Phase 13 approves metric categories and measurement direction.

It does not invent unsupported numeric targets.

Numeric targets must be based on:

- real baseline data.
- business strategy.
- operating economics.
- risk.
- capacity.
- market evidence.

## Marketplace Liquidity

Marketplace liquidity is a central learning area.

Atlazora should understand whether buyer demand can find suitable supply and progress toward transactions.

Useful liquidity evidence may include:

- relevant supply availability.
- search-to-engagement behavior.
- RFQ response.
- quote quality.
- response time.
- buyer-supplier matching.
- transaction progression.
- repeat participation.

Liquidity must not be reduced to a single unsupported number before evidence exists.

## Supplier Funnel

Supplier measurement may include:

- signup.
- organization creation.
- onboarding progression.
- verification progression.
- catalog creation.
- Offer publication.
- first inquiry/RFQ.
- first Quote.
- first Sample.
- first Order.
- first completed transaction.
- repeat activity.
- subscription/monetization progression.

Measurement should identify where useful suppliers fail to reach commercial value.

## Buyer Funnel

Buyer measurement may include:

- signup.
- organization creation.
- search/discovery.
- Product/Offer view.
- supplier contact.
- RFQ creation.
- Quote evaluation.
- Sample Order.
- wholesale Order.
- Payment.
- fulfillment.
- completion.
- review.
- repeat purchase/sourcing.

The purpose is to identify friction between demand and successful commercial outcomes.

## Search and Discovery Metrics

Measurement may include:

- searches.
- result relevance.
- zero-result searches.
- result engagement.
- Product/Offer views.
- filter usage.
- supplier discovery.
- downstream RFQ/contact/Order progression.

Search is a derived capability, so learning can improve indexing/ranking without redefining transactional truth.

## RFQ and Quote Metrics

Useful evidence may include:

- RFQs created.
- qualified supplier reach.
- response rate.
- time to first response.
- number of useful Quotes.
- Quote revisions.
- accepted Quotes.
- RFQ-to-Order conversion.
- supplier-specific Order creation after multiple awards.

Chat volume alone is not a measure of accepted commercial truth.

## Sample Metrics

Because Samples are first-class, Atlazora should measure:

- Sample demand.
- supplier acceptance.
- payment/completion.
- delivery.
- inspection/issues where applicable.
- buyer follow-up.
- Sample-to-RFQ progression.
- Sample-to-wholesale-Order progression.

This helps determine whether Samples are reducing trust and sourcing friction.

## Order / Transaction Metrics

Useful transaction evidence may include:

- Orders created.
- payment progression.
- payment failures.
- completion rate.
- cancellation.
- fulfillment delay.
- inspection outcome.
- dispute occurrence.
- refund behavior.
- settlement progression.
- repeat ordering.

Order, Payment, Shipment, and Settlement remain distinct lifecycle concepts in analytics as they are in the domain model.

## Trust and Dispute Metrics

Trust measurement may include:

- verification progression.
- inspection usage/outcomes.
- dispute rate.
- dispute reason.
- resolution time.
- refund outcome.
- transaction-linked review behavior.
- repeat behavior after successful or disputed transactions.

Verification, subscription, and sponsored placement remain distinct concepts.

## Revenue and Monetization Metrics

Measurement may include:

- transaction commission.
- Professional Supplier Plan.
- promoted listing/advertising revenue.
- service fees/margins.
- payment-related economics where applicable.
- logistics/inspection service economics where applicable.

Revenue should be interpreted together with transaction quality, retention, support cost, and unit economics.

## Unit Economics

Atlazora should understand the economic cost and value of operating marketplace activity.

Potential dimensions include:

- revenue per transaction/customer/supplier.
- payment/provider costs.
- infrastructure costs.
- support/operations costs.
- acquisition costs when available.
- service-provider costs.
- dispute/refund costs.
- monetization contribution.

Exact formulas and targets require real data and approved business definitions.

## Retention

Retention should be measured according to meaningful marketplace behavior.

Potential evidence includes:

- returning buyers.
- returning suppliers.
- repeat searches/sourcing.
- repeat RFQs.
- repeat Orders.
- repeat supplier activity.
- catalog/Offer maintenance.
- renewal/subscription behavior.

Simple login recurrence alone is not sufficient evidence of marketplace value.

## Operations Metrics

Operational measurement may include:

- verification workload.
- support workload.
- dispute workload.
- reconciliation exceptions.
- manual interventions.
- provider incidents.
- operational turnaround time.
- Admin/Ops bottlenecks.
- failure recovery effort.

The objective is to reduce unnecessary manual burden without removing necessary human control.

## Technical Metrics

Technical measurement may include:

- availability.
- latency.
- error rates.
- database health.
- worker/event health.
- queue/backlog.
- provider failure.
- search health.
- cache health.
- deployment health.
- security findings/signals.
- backup/restore evidence.
- capacity.
- cost.

Exact numeric SLOs remain separate explicit decisions.

## Analytics Events vs Domain Events

Analytics events and domain events serve different purposes.

### Domain Events

Domain events represent meaningful business/system facts used for reliable platform behavior and integration.

They require the approved reliability, versioning, ownership, outbox, and idempotency principles where applicable.

### Analytics Events

Analytics events support measurement and learning.

They may describe user/product behavior that does not belong to transactional domain truth.

Analytics instrumentation must not become an unofficial substitute for authoritative domain state.

## Analytics Event Taxonomy

Analytics event naming should be structured and governed.

Potential categories include:

- acquisition.
- identity/onboarding.
- supplier activation.
- catalog/Offer activity.
- discovery/search.
- RFQ/Quote.
- Sample.
- Order.
- Payment.
- fulfillment/logistics.
- inspection.
- dispute.
- review/trust.
- monetization.
- support/operations.

Exact event names/schema are finalized when instrumentation is implemented.

## Analytics Privacy

Analytics should collect only data justified by measurement needs and applicable policy.

Principles include:

- data minimization.
- purpose awareness.
- controlled access.
- appropriate retention.
- avoiding unnecessary sensitive data.
- respecting applicable privacy/legal requirements.

Exact legal/privacy implementation must not be invented in planning documentation.

## Dashboards

Dashboards should answer specific business or operational questions.

Potential dashboard areas include:

- marketplace overview.
- supplier funnel.
- buyer funnel.
- search/discovery.
- RFQ/Quote.
- Samples.
- transactions.
- trust/disputes.
- revenue.
- retention.
- operations.
- technical health.
- cost.

Dashboards are decision tools, not goals themselves.

## Structured Feedback

Qualitative feedback should be captured in a form that can be classified and acted upon.

Sources may include:

- buyer interviews.
- supplier interviews.
- support interactions.
- Ops observations.
- dispute cases.
- provider feedback.
- pilot/launch observations.
- lost transaction analysis.

Feedback should distinguish isolated requests from recurring or strategically important problems.

## Prioritization

Post-launch prioritization should combine evidence rather than rely on the loudest request.

Factors may include:

- frequency.
- severity.
- commercial value.
- strategic fit.
- trust/safety.
- revenue.
- retention.
- operational cost.
- technical risk.
- implementation effort.
- reversibility.
- confidence in evidence.

The exact prioritization framework may evolve.

## Experiments

Experiments may be used where they can answer meaningful questions safely.

An experiment should define:

- hypothesis.
- expected outcome.
- metric.
- guardrails.
- participant/exposure scope.
- duration or stopping rule when applicable.
- analysis method.
- rollback/disable path.

Experiments must not bypass security, legal, financial, or trust requirements.

## Feature Flags

Feature flags may support:

- controlled rollout.
- experiments.
- cohort exposure.
- market-specific enablement.
- provider enablement.
- operational kill switches.

Flags require ownership and lifecycle management.

Temporary flags should not accumulate indefinitely as undocumented permanent architecture.

## V1.1 Is Evidence-Driven

Phase 13 does not pre-commit a fixed V1.1 feature list before real marketplace evidence exists.

V1.1 priorities should be selected from:

- production evidence.
- participant feedback.
- commercial outcomes.
- operational evidence.
- security/reliability findings.
- technical debt.
- strategic priorities.

Foundational defects or risks take precedence when required for correctness/security/operability.

## Future V2 Candidates Are Not Commitments

Future possibilities may include capabilities such as:

- advanced procurement.
- deeper enterprise workflows.
- ERP/EDI.
- trade finance.
- BNPL/wallet capabilities.
- advanced logistics.
- broader automation.
- advanced intelligence/AI.
- additional markets/providers.

These are candidates, not approved delivery commitments merely because they appear in planning.

## AI / Intelligence Rule

AI and intelligence capabilities should be introduced when they provide measurable value.

An AI capability should have appropriate:

- problem definition.
- measurable benefit.
- fallback behavior.
- quality evaluation.
- explainability appropriate to risk.
- security/privacy review.
- abuse/risk analysis.
- monitoring.
- human review where sensitive decisions require it.

AI is not added merely for novelty.

## Intelligence Authority Boundary

Python intelligence may score, rank, classify, recommend, or analyze according to approved boundaries.

It must not silently become the authoritative transactional decision-maker or directly mutate Core-owned transactional state.

Sensitive decisions require the appropriate domain/human authority.

## Technical Debt Loop

Technical debt must be measured and prioritized rather than ignored or used as a label for arbitrary rewrites.

Signals may include:

- recurring incidents.
- delivery friction.
- defect concentration.
- slow tests/builds.
- operational toil.
- security exposure.
- performance bottlenecks.
- high change failure.
- difficult ownership boundaries.
- excessive cost.

Technical debt work competes for priority using real risk/value evidence.

## Service Extraction Triggers

Microservice extraction is evidence-driven.

Possible triggers include:

- independent scaling need.
- distinct reliability requirements.
- security/isolation boundaries.
- independent deployment pressure.
- team ownership.
- runtime/technology need.
- measurable bottlenecks.

Extraction is not performed merely to increase service count.

Architecturally significant extraction requires ADR treatment.

## Cost Learning Loop

Cost is an engineering and business signal.

Atlazora should measure:

- cloud cost.
- managed data-service cost.
- search cost.
- object-storage/egress cost.
- observability cost.
- provider/service cost.
- cost per useful commercial activity where definitions permit.

Optimization must preserve correctness, security, reliability, and operability.

## Security Learning Loop

Production security evidence must feed back into development.

Sources include:

- vulnerabilities.
- incidents.
- abuse.
- authorization failures.
- secret/configuration issues.
- dependency/supply-chain findings.
- provider/security changes.
- penetration/security assessments where performed.

Security learning becomes tracked remediation or improvement work.

## Support Learning Loop

Support is a product-learning source.

Repeated support cases may identify:

- unclear UX.
- missing Admin/Ops capability.
- workflow friction.
- policy ambiguity.
- integration failure.
- reliability problems.
- training/documentation gaps.

The objective is not simply to close tickets, but to remove recurring causes where justified.

## Search Learning Loop

Search improvement should use evidence such as:

- zero-result searches.
- abandoned searches.
- result engagement.
- RFQ/contact progression.
- successful Orders.
- language behavior.
- taxonomy gaps.

Search ranking remains derived and rebuildable.

## Demand / Supply Map

Atlazora should develop evidence about:

- what buyers seek.
- what suppliers can provide.
- where demand has insufficient supply.
- where supply has insufficient demand.
- market/category gaps.
- geographic/currency/language patterns.

This can guide supplier acquisition, category development, and market expansion.

## Governance Continues Permanently

Measure → Learn → Develop does not replace the project governance system.

New work still requires the appropriate:

- Wave.
- Work Unit.
- Task.
- ADR where architectural.
- Definition of Ready.
- Definition of Done.
- testing/security.
- documentation.
- Handoff.

Git remains permanent project memory.

## Evidence Over Random Feature Accumulation

Atlazora must not evolve through unstructured feature accumulation.

A proposed change should have an identifiable reason such as:

- measured user/business value.
- correctness.
- security.
- reliability.
- compliance.
- operational efficiency.
- cost.
- strategic need.
- validated learning.

## Explicitly Open Decisions

Phase 13 intentionally does not invent:

- exact north-star metric.
- numeric business targets.
- numeric funnel targets.
- retention targets.
- revenue targets.
- unit-economic targets.
- experiment thresholds.
- exact prioritization formula.
- analytics vendor/stack.
- exact analytics event schemas.
- exact dashboard tooling.
- exact AI models/providers.
- exact AI quality thresholds.
- fixed V1.1 feature list.
- fixed V2 roadmap.
- exact microservice extraction thresholds.
- exact cost targets.
- exact future market sequence.

These require real operating evidence and formal decisions.

## Foundation Rule

Measurement, observability, analytics boundaries, security, and governance foundations must exist early enough to support trustworthy learning.

Advanced analytics, AI, experimentation, or optimization complexity may be deferred.

Defer advanced complexity, not foundations.

## Related Documentation

- `../../product/vision.md`
- `../../ROADMAP.md`
- `../../PROJECT_STATE.md`
- `../../architecture/system-overview.md`
- `../../architecture/data-architecture.md`
- `../../architecture/security-architecture.md`
- `../../templates/DEFINITION_OF_DONE.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
