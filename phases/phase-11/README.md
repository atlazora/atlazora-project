# Phase 11 — Staging & Pilot Launch

## Status

Planning complete and formally preserved in Git during W00-WU01.

This Phase defines the approved staging and private-pilot validation model. It does not mean that Staging or Production environments have already been provisioned or that the pilot has been executed.

## Purpose

The pilot is a real lifecycle validation stage, not a demo.

Its purpose is to prove that Atlazora can operate the intended V1 commercial lifecycle with controlled real-world exposure before broad public launch.

The authoritative preserved planning source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Environment Progression

The approved environment progression is:

**Local → Development → Staging → Production (Private Pilot) → Production (Public)**

These stages have different purposes.

### Local

Developer execution, rapid feedback, and isolated engineering work.

### Development

Shared integration environment for ongoing engineering validation.

### Staging

Production-like architecture at appropriately smaller scale and cost.

Staging is used for:

- deployed-system integration.
- release-candidate validation.
- provider sandbox testing.
- migration rehearsal.
- operational rehearsal.
- E2E verification.
- applicable performance/resilience/security validation.

Staging is not Production and must not casually share Production data, credentials, or privileged access.

### Production — Private Pilot

The private pilot uses controlled Production capability with deliberately restricted participation/exposure.

It validates real operational behavior before public availability.

### Production — Public

Public Production follows only after the applicable pilot exit criteria and launch-readiness gates have been satisfied.

## Pilot Principle

The pilot must exercise the actual commercial and operational lifecycle.

A successful landing page, catalog demo, or isolated happy-path transaction is not sufficient evidence.

The pilot exists to discover operational, product, provider, migration, support, security, reconciliation, and workflow failures under controlled real conditions.

## Pilot Scope

Commercial scope may be intentionally narrow during the private pilot.

The architecture must remain global-ready even when the first pilot uses a limited:

- market.
- cohort.
- supplier set.
- buyer set.
- provider configuration.
- transaction volume.
- category scope.

Narrow rollout is a risk-control mechanism, not permission to remove foundational multi-market/multi-currency/multi-language architecture.

## Pilot Participation Controls

Controlled rollout may use:

- invitation.
- allowlisting.
- feature flags.
- controlled supplier onboarding.
- controlled buyer access.
- provider-specific enablement.
- operational approval gates.

These mechanisms should permit progressive exposure without requiring a separate pilot codebase.

## Feature Flags

Feature flags may be used to control rollout and recovery where appropriate.

Flags must not become undocumented permanent business logic.

High-risk capabilities should have appropriate operational control or kill-switch behavior where justified.

Exact feature-flag implementation is resolved by the owning Work Unit.

## Provider Environment Progression

External integrations should progress through appropriate provider environments before live use.

Typical progression is:

**mock/local → sandbox/test → controlled live**

Provider-specific stages may differ.

No provider capability is considered Production-ready merely because a client library can make a successful request.

Applicable readiness includes:

- authentication/secrets.
- callback/webhook handling.
- retries.
- idempotency.
- failure behavior.
- reconciliation.
- observability.
- operational recovery.

## Payment Pilot Progression

Payment capability requires particularly controlled progression.

Before meaningful live use, sandbox/test verification should cover applicable scenarios including:

- successful payment.
- failed payment.
- cancelled/abandoned flow.
- delayed callback.
- duplicate callback.
- out-of-order callback.
- timeout.
- retry.
- browser return without authoritative confirmation.
- refund behavior.
- reconciliation mismatch.

Live payment enablement should begin gradually and remain observable and operationally controllable.

The payment provider remains authoritative for provider-side payment confirmation according to the approved payment boundary.

## Real Pilot Lifecycle

The private pilot should validate the applicable V1 lifecycle with real operational handling.

This includes, where applicable:

1. organization/account onboarding.
2. supplier onboarding.
3. supplier verification.
4. catalog and Offer publication.
5. buyer discovery.
6. RFQ and Quote.
7. Sample workflow.
8. commercial Order creation.
9. payment/protection flow.
10. fulfillment/shipping.
11. inspection.
12. dispute handling.
13. completion.
14. settlement/reconciliation.
15. review/trust behavior.
16. Admin/Ops intervention and support.

Not every pilot participant must execute every path, but the pilot program as a whole must provide evidence across the required lifecycle.

## Supplier Onboarding Validation

Pilot suppliers should validate that onboarding is operationally usable rather than merely technically possible.

Applicable evidence includes:

- organization setup.
- supplier profile.
- verification/KYB workflow.
- required document handling.
- Admin/Ops review.
- rejection/correction/retry behavior.
- catalog/Offer readiness.

## Seed Catalog

The pilot requires enough realistic catalog/Offer data to validate discovery and sourcing behavior.

Seed data should be controlled and representative.

Fake data must not accidentally become authoritative Production commercial data.

## RFQ Validation

Pilot RFQ validation should exercise:

- buyer request creation.
- supplier participation.
- structured Quote behavior.
- Quote versioning where applicable.
- messaging support.
- acceptance.
- conversion to separate supplier Orders when multiple suppliers are awarded.

Chat remains supporting communication rather than the authoritative commercial agreement.

## Sample Validation

Sample ordering is a first-class pilot path.

The pilot should verify the transition from sample interest/order into broader wholesale purchasing where applicable.

Sample behavior must preserve the approved rule that samples may bypass normal wholesale MOQ requirements according to product policy.

## Shipping / Fulfillment Validation

The pilot should verify applicable fulfillment and shipping paths, including operational intervention.

Where assisted shipping is enabled, the pilot should validate the provider/operations boundary rather than assuming shipping succeeds automatically.

Applicable evidence includes:

- shipment creation.
- status progression.
- tracking/operational visibility.
- partial/failure cases where supported.
- provider failure/retry.
- delivery evidence.

## Inspection Validation

Where inspection applies, the pilot should verify:

- inspection request.
- scheduling/coordination.
- result capture.
- document/evidence handling.
- pass/fail behavior.
- downstream workflow gating.

Inspection may gate later shipping/commercial progression according to the approved business flow.

## Trade Protection / Dispute Validation

The pilot should exercise the approved protection/dispute lifecycle where applicable.

This includes:

- dispute opening.
- evidence.
- Admin/Ops handling.
- decision.
- resulting order state.
- resulting financial/refund/settlement effect.
- auditability.

A dispute decision must propagate correctly to the financial state rather than remaining an isolated UI status.

Atlazora must not claim unsupported escrow behavior.

## Settlement and Reconciliation

A transaction is not operationally proven merely because the buyer was charged.

Pilot validation must include applicable:

- provider reconciliation.
- internal financial records.
- refund/adjustment behavior.
- commission handling.
- settlement eligibility.
- supplier settlement.
- mismatch handling.
- operational investigation path.

Financial corrections must preserve audit/history.

## Migration Rehearsal

Before relevant Production cutover, migration must be rehearsed.

Migration rehearsal should verify:

- repeatability.
- idempotency.
- mapping.
- validation.
- reconciliation.
- failure recovery.
- runtime/operational expectations.
- source-of-truth transition.
- legacy identifier traceability where applicable.

Rehearsal must not silently redefine missing historical facts.

The Progressive Semantic Migration strategy remains authoritative.

## Release Candidate Rule

A Release Candidate must be built once through the approved pipeline and promoted as an immutable artifact.

The pilot must not depend on rebuilding different binaries/images manually for Production.

Any configuration/environment differences must be controlled through the approved deployment/configuration model.

## Pilot Observability

The pilot requires operational visibility sufficient to understand whether the system is working.

Applicable dashboards/monitoring should cover:

- application health.
- API health.
- database health.
- worker/event health.
- provider integrations.
- payment failures.
- reconciliation issues.
- order/fulfillment failures.
- inspection/dispute operations.
- error rates.
- latency where relevant.
- security signals.
- infrastructure health/cost.
- support/operational workload.

Exact dashboard products and numeric targets remain open until formally selected.

## Feedback Collection

Pilot feedback must be structured enough to support decisions.

Useful categories include:

- product usability.
- missing workflow.
- business-policy confusion.
- supplier onboarding friction.
- buyer sourcing friction.
- operational burden.
- provider/integration failure.
- performance.
- reliability.
- security/privacy concern.
- localization.
- documentation/support.

Feedback does not automatically become roadmap scope.

It is evidence for prioritization.

## Pilot Issue Severity

Pilot findings use the approved operational severity model:

### P0 — Critical

A release/pilot-stopping issue requiring immediate attention.

Examples may include catastrophic integrity/security/financial or fundamental lifecycle failure according to actual impact.

### P1 — High

A severe issue materially blocking or endangering important pilot operation and requiring urgent resolution.

### P2 — Normal

A meaningful defect or limitation that should be addressed but does not by itself require immediate pilot shutdown.

### P3 — Low

A lower-impact issue, polish item, or limited workaround-compatible defect.

Severity must be based on actual impact rather than desired schedule.

This pilot severity model is an operational application of the broader roadmap priority model and does not replace security finding severity.

## Security During Pilot

Private Pilot is Production exposure.

It therefore requires Production-grade treatment for applicable:

- secrets.
- access control.
- organization isolation.
- payment/financial boundaries.
- sensitive files.
- audit.
- provider credentials.
- infrastructure changes.
- backups.
- incident handling.

“Private” does not mean security controls may be bypassed.

## Incident Readiness

The pilot requires a practical incident/support path.

Applicable readiness includes:

- issue intake.
- severity classification.
- owner/response path.
- logs/diagnostics.
- rollback or feature-disable path.
- provider escalation information where applicable.
- financial investigation/reconciliation path.
- security incident handling.
- documented recovery procedures for critical components.

Exact staffing/on-call structure reflects actual team size.

## Support Readiness

Pilot participants must have a defined support path.

Operational teams must be able to investigate supported workflows without routine direct database modification.

Missing Admin/Ops capability that forces unsafe database intervention is a pilot-readiness defect.

## Cost Validation

Pilot operation should expose enough cost information to detect obvious architectural or provider-cost problems before public scaling.

Exact unit-economic and infrastructure targets remain open until real data exists.

## Rollback and Recovery

Each relevant release must have an understood recovery strategy.

Recovery may include:

- application rollback.
- feature disablement.
- provider disablement.
- traffic/exposure reduction.
- forward fix.
- migration recovery procedure.

Database rollback must not be treated as automatically equivalent to application rollback.

Destructive data rollback requires explicit safety analysis.

## Freeze Rule

If pilot evidence shows unacceptable risk, rollout may be frozen.

A freeze may apply to:

- new participants.
- specific features.
- live payment.
- provider integration.
- migration/cutover.
- public launch.

Schedule pressure is not sufficient reason to bypass a justified freeze.

## Pilot Exit Criteria

The private pilot may progress toward public Production only when applicable evidence demonstrates:

- required V1 lifecycle works end to end.
- critical supplier onboarding/verification works.
- buyer sourcing/RFQ/Sample paths work.
- Orders can be created and operated correctly.
- payment/protection behavior is controlled and reconcilable.
- fulfillment/shipping behavior is operational.
- inspection/dispute paths are operable where required.
- settlement/reconciliation is understood and controlled.
- Admin/Ops can support the lifecycle.
- migration rehearsal/cutover readiness is acceptable where applicable.
- required security gates pass.
- required reliability/resilience evidence exists.
- backup/restore readiness is acceptable.
- observability/support/incident paths are ready.
- no unresolved release-blocking issue remains.
- rollback/recovery paths are understood.

Exit requires evidence, not merely elapsed pilot time.

## Rollback / Public-Launch Decision

The result of the pilot is not automatically “launch.”

Possible outcomes include:

- proceed toward public launch.
- continue restricted pilot.
- reduce exposure.
- fix and repeat validation.
- roll back a capability.
- delay a migration/cutover.
- freeze launch because release gates are not satisfied.

## Explicitly Open Decisions

Phase 11 intentionally leaves the following unresolved until supported by implementation/business evidence:

- exact first pilot market.
- exact pilot cohort size.
- exact supplier/buyer counts.
- exact category scope.
- exact transaction-volume targets.
- exact provider choices.
- exact live-payment limits.
- exact pilot duration.
- exact numeric success targets.
- exact performance thresholds.
- exact SLO/RPO/RTO targets.
- exact alert thresholds.
- exact support response-time targets.
- exact infrastructure sizing.
- exact public-launch date.

These must not be invented merely to make the plan look more precise.

## Foundation Rule

Pilot scope may be narrow.

Foundations required for V1 correctness, security, operability, scalability, and avoidance of painful rebuilds are not deferred merely because the initial cohort is small.

Defer advanced complexity, not foundations.

## Related Documentation

- `../../architecture/infrastructure.md`
- `../../architecture/security-architecture.md`
- `../../architecture/data-architecture.md`
- `../../architecture/event-architecture.md`
- `../../product/business-flows.md`
- `../../product/v1-scope.md`
- `../../templates/DEFINITION_OF_DONE.md`
- `../../ROADMAP.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
