# Phase 12 — Production Launch & Operations

## Status

Planning complete and formally preserved in Git during W00-WU01.

This Phase defines the approved Production launch and operating model. It does not mean that Production has already been provisioned, launched, or declared operational.

## Purpose

Phase 12 defines how Atlazora progresses from validated launch readiness into controlled public operation and then stable ongoing operations.

The approved lifecycle is:

**Production Ready → Controlled Go-Live → Early-Life Support → Stable Operations**

Production launch is an operational transition with explicit gates, observability, recovery, security, and ownership.

It is not merely a deployment command.

The authoritative preserved planning source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## 1. Production Ready

Production Ready means the applicable technical, security, operational, data, provider, and business-readiness gates required for launch have been satisfied.

Readiness includes applicable evidence from:

- Engineering Foundation.
- capability Work Units.
- testing/security.
- Staging.
- Private Pilot.
- migration rehearsal.
- provider readiness.
- operational readiness.
- backup/restore verification.
- incident/runbook preparation.

Production Ready is a gate, not a statement that public traffic has already been enabled.

## 2. Controlled Go-Live

Public launch begins through controlled exposure rather than an unnecessary all-at-once release.

Applicable controls may include:

- progressive participant enablement.
- feature flags.
- provider enablement.
- payment enablement.
- traffic/exposure controls.
- operational approval gates.
- kill switches.
- circuit breakers where appropriate.

The goal is to increase exposure while preserving the ability to detect, contain, and recover from failure.

## 3. Early-Life Support

Immediately after go-live, Atlazora operates under heightened observation.

Early-Life Support emphasizes:

- transaction observation.
- provider behavior.
- payment/reconciliation monitoring.
- operational workload.
- error/failure analysis.
- performance.
- security signals.
- support issues.
- incident response.
- cost behavior.
- rapid but controlled fixes.

Early-Life Support ends based on evidence of stability rather than an arbitrary elapsed duration.

## 4. Stable Operations

Stable Operations is the normal ongoing Production operating state after launch behavior has demonstrated acceptable stability.

Stable does not mean static.

Operations continue to include:

- monitoring.
- incident management.
- security maintenance.
- provider management.
- backups/restores.
- cost review.
- capacity review.
- controlled releases.
- technical-debt management.
- measurement and learning.
- ongoing project governance.

Phase 13 provides the permanent Measure → Learn → Develop loop.

## Production Isolation

Production must remain intentionally separated from non-production environments.

Applicable separation includes:

- cloud project/environment.
- IAM.
- secrets.
- provider credentials.
- databases/data.
- storage.
- network boundaries.
- privileged access.
- deployment controls.

Production credentials must not be casually reused in Development or Staging.

## Production Data Services

Production durable data services use appropriate managed services according to the approved infrastructure architecture.

PostgreSQL remains transactional truth.

Applicable Production data capabilities include:

- high availability appropriate to risk.
- automated backup.
- point-in-time recovery where supported/required.
- tested restore.
- monitoring.
- controlled access.
- encryption.
- capacity visibility.

Redis remains ephemeral.

Search remains derived and rebuildable.

Object storage remains behind the approved S3-compatible abstraction and appropriate access classification.

## Production Secrets and Identity

Production runtime secrets use the approved managed-secret direction.

Google Cloud Secret Manager is the approved GCP direction.

Workloads should use Workload Identity/federated identity rather than routine long-lived static service-account JSON credentials.

CI/cloud authentication should use federation where supported.

Secret access must be least-privilege and environment-aware.

## Production Admin / Ops Security

Privileged Production operations require stronger controls than routine application usage.

Applicable controls include:

- explicit RBAC.
- stronger authentication/MFA requirements where appropriate.
- least privilege.
- auditable privileged actions.
- controlled access to sensitive data/files.
- separation of routine and exceptional access.
- traceable operational intervention.

Production database access is exceptional operational access, not the normal Admin/Ops workflow.

Admin/Ops functionality must use approved application/API boundaries rather than routine direct database modification.

## Production Change Rule

Production changes must be:

- traceable.
- reproducible.
- reviewed according to risk.
- delivered through approved deployment/configuration mechanisms.
- observable.
- recoverable.

Routine hot editing of Production application code, containers, or infrastructure is not an approved operating model.

Emergency intervention must be documented and reconciled back into source-controlled configuration where applicable.

## Immutable Artifact Rule

Production deploys known immutable artifacts created by the approved build pipeline.

The same approved artifact progresses through the promotion model.

Production must not silently rebuild source differently on a developer laptop.

Environment differences are supplied through approved configuration/secrets.

## Infrastructure as Code

Persistent Production infrastructure configuration belongs in Terraform or another formally approved IaC mechanism.

Manual cloud-console changes must not become undocumented permanent source of truth.

Emergency changes must be captured and reconciled afterward where applicable.

## Go-Live Sequence

The exact launch procedure is finalized from implemented capabilities, but the approved sequence includes applicable:

1. confirm release gates.
2. confirm Production infrastructure/data health.
3. confirm secrets/IAM/provider configuration.
4. confirm backups and recovery readiness.
5. confirm migration/cutover readiness.
6. deploy/promote approved Release Candidate.
7. execute required final data migration/cutover.
8. validate application and infrastructure health.
9. validate provider integrations.
10. enable live payment only after its explicit gate.
11. progressively enable Production exposure.
12. observe the first real commercial transactions closely.
13. verify financial/reconciliation state.
14. verify fulfillment/operational paths.
15. continue controlled expansion only while release health remains acceptable.

A launch checklist/runbook must contain the exact implemented procedure before execution.

## Final Migration / Cutover

Final cutover follows the Progressive Semantic Migration strategy.

Applicable requirements include:

- known source of truth before cutover.
- repeatable migration tooling.
- validated mappings.
- reconciliation.
- explicit cutover sequence.
- controlled write transition.
- failure/recovery procedure.
- post-cutover verification.
- legacy traceability.
- no random dual writes.

A cutover must not silently create two authoritative systems for the same data type.

## Live Payment Gate

Live payment is a distinct launch gate.

Before enabling meaningful live payment, applicable evidence must demonstrate:

- provider Production credentials/configuration are controlled.
- authoritative provider confirmation works.
- callbacks/webhooks are secured.
- idempotency works.
- retries/failures are handled.
- refund behavior is understood.
- reconciliation is operational.
- financial records/audit are correct.
- monitoring/support paths exist.
- disable/recovery mechanisms are understood.

A browser return is not authoritative payment confirmation.

## First Transaction Observation

The first real Production commercial transactions require deliberate observation.

Applicable verification includes:

- order state.
- payment confirmation.
- financial records.
- provider reconciliation.
- fulfillment/shipping progression.
- notifications.
- Admin/Ops visibility.
- audit trail.
- settlement eligibility.
- error/retry behavior.

The purpose is to validate the complete operating system, not merely HTTP success.

## Progressive Rollout

Production exposure should grow according to evidence.

Possible dimensions include:

- participant cohort.
- supplier cohort.
- buyer cohort.
- market.
- category.
- feature.
- provider.
- payment capability.
- transaction limits.
- traffic percentage.

Exact rollout mechanics are implementation decisions.

## Kill Switches

High-risk external or commercial capabilities should have appropriate mechanisms to stop or restrict behavior when operationally justified.

Examples may include:

- live payment disablement.
- provider disablement.
- new-order restriction.
- participant onboarding freeze.
- feature disablement.
- migration/cutover freeze.

Kill switches must be controlled, auditable where appropriate, and tested sufficiently to be trustworthy.

## Circuit Breakers and Dependency Protection

External dependency failures must not automatically cascade into uncontrolled platform failure.

Where appropriate, capabilities should use:

- timeouts.
- bounded retries.
- backoff.
- circuit breaking.
- queueing.
- controlled degradation.
- explicit failure states.

Exact implementation depends on the owning integration/capability.

## Graceful Degradation

Failure of a derived or non-authoritative subsystem should not corrupt authoritative business state.

Examples:

- Redis loss must not destroy transactional truth.
- Search loss should degrade discovery while authoritative PostgreSQL state remains valid.
- notification failure must not redefine commercial truth.
- intelligence unavailability must not directly corrupt Core decisions.
- provider outages should produce explicit controlled workflow states.

Graceful degradation does not mean silently pretending a critical capability succeeded.

## Rollback Principles

Rollback must distinguish different change types.

### Application Rollback

May restore a previous compatible immutable artifact where contracts/data permit.

### Configuration / Feature Rollback

May disable or revert controlled configuration/feature exposure.

### Infrastructure Rollback

Must account for persistent resource/state implications and IaC safety.

### Database / Data Recovery

Must not assume schema/data changes can be blindly reversed.

For breaking transitions, use the approved:

**expand → migrate → contract**

pattern where applicable.

Forward fixes or explicit recovery procedures may be safer than destructive reversal.

### Migration / Cutover Recovery

Must preserve source-of-truth clarity and data integrity.

Rollback strategy must be defined before high-risk irreversible transitions.

## Backup and Restore Operations

Production durable data requires automated backup appropriate to risk and tested restore capability.

Operations must know:

- what is backed up.
- where it is stored.
- retention once approved.
- restore procedure.
- validation procedure.
- ownership/escalation path.

A backup without demonstrated restore capability is not sufficient operational protection.

## Disaster Recovery

Disaster-recovery planning and testing are foundational.

Applicable procedures must account for:

- database/data recovery.
- infrastructure recreation.
- secrets/configuration recovery.
- object storage/data considerations.
- application redeployment.
- provider dependencies.
- operational communications.

Exact numeric RPO/RTO/failover targets remain open until formally approved.

Active-active multi-region is not required for V1.

## Production Observability

Production requires sufficient visibility to detect and diagnose failure.

Applicable signals include:

- API/application health.
- latency/error rates.
- PostgreSQL health.
- worker/event backlog and failures.
- provider health.
- payment/reconciliation failures.
- order/fulfillment failures.
- search health.
- Redis/cache health.
- infrastructure health.
- security signals.
- deployment state.
- cost/capacity.
- audit/operational events where appropriate.

Exact observability stack and numeric SLOs remain open.

## Launch Dashboard

Controlled Go-Live and Early-Life Support require a focused operational view of launch health.

The launch dashboard should aggregate the signals needed to answer:

- Is the platform healthy?
- Are users completing core flows?
- Are payments reconciling?
- Are Orders progressing?
- Are providers failing?
- Are queues/backlogs growing?
- Are security signals abnormal?
- Are support/operational failures increasing?
- Is infrastructure capacity/cost behaving unexpectedly?

Exact dashboard implementation is selected later.

## Alerts

Alerts should identify actionable conditions rather than merely generate noise.

Alerting should cover high-impact technical and business-operational failure where appropriate.

Exact thresholds remain open until evidence and SLOs support them.

## On-Call / Ownership

Operational ownership must be explicit even with a small or solo engineering team.

The operating model must identify:

- who receives critical alerts.
- who owns investigation.
- who can execute recovery.
- who handles provider escalation.
- who handles security incidents.
- who handles financial/reconciliation investigation.

The exact staffing/on-call rotation evolves with team size.

Lack of a large team does not eliminate operational ownership.

## Incident Severity and Response

Production incidents require explicit severity classification and response.

Severity should reflect actual:

- customer impact.
- commercial impact.
- financial impact.
- security/privacy impact.
- data-integrity risk.
- operational scope.

Critical incidents require immediate containment/recovery attention.

Incident records should preserve important timeline, decisions, actions, and follow-up work.

## Runbooks

Production operations require runbooks for high-risk/repeated procedures.

Applicable runbooks include:

- deployment.
- rollback.
- database restore.
- migration/cutover.
- payment/provider outage.
- reconciliation failure.
- worker/event backlog.
- search rebuild.
- credential/secret response.
- security incident.
- infrastructure recovery.

Runbooks evolve as implementation becomes concrete.

## Security Incident Path

Production requires a defined security incident path.

Applicable actions may include:

- containment.
- credential/secret rotation.
- access revocation.
- evidence/log preservation.
- impact assessment.
- recovery.
- provider/cloud escalation.
- required communication according to applicable policy/legal obligations.
- post-incident corrective work.

Exact legal notification requirements must not be invented and are handled according to applicable law/policy.

## Fraud / Abuse Operational Path

Suspicious commercial or account activity requires an operational review path.

Applicable capabilities may include:

- flagging.
- restricted action.
- transaction review.
- evidence preservation.
- Admin/Ops investigation.
- payment/provider coordination.
- escalation.

Automated scoring may assist but must not silently become authoritative for sensitive decisions without approved controls.

Exact fraud rules evolve with evidence.

## Production Support

Support must be able to investigate normal supported workflows through appropriate Admin/Ops and observability capabilities.

Routine support must not require unsafe direct database edits.

Support actions affecting material business state should be controlled and auditable.

## Patching and Maintenance

Production dependencies, base images, infrastructure, and services require ongoing maintenance.

Updates should be:

- risk assessed.
- tested.
- traceable.
- deployed through the normal controlled process where practical.
- monitored after deployment.

Security fixes may require expedited handling without abandoning traceability.

## Cost Operations

Production cost must be observable.

Cost review should consider:

- infrastructure.
- managed data services.
- search.
- object storage.
- network/egress.
- external providers.
- observability.
- build/artifact systems.

Optimization must not silently remove correctness/security/operability foundations.

## Scaling

Scaling is evidence-driven.

Initial architecture should scale horizontally where appropriate without prematurely introducing expensive distributed complexity.

Operational evidence should drive:

- replica counts.
- resource sizing.
- database scaling.
- search capacity.
- worker capacity.
- queue/broker capacity.
- caching.
- provider limits.

Exact thresholds remain open.

## No Sharding Day One

Database sharding is not required for V1 Day One.

Sharding should be introduced only when demonstrated scale and access patterns justify its complexity.

The architecture must avoid decisions that make future scaling unnecessarily painful, but speculative sharding is not a launch requirement.

## Microservice Extraction

The Go transactional Core begins modular-first.

A module should be extracted into an independent service only when evidence justifies the operational and architectural cost.

Possible evidence includes:

- independent scaling need.
- distinct reliability boundary.
- security/isolation requirement.
- independent deployment pressure.
- team ownership.
- technology/runtime need.
- measurable operational bottleneck.

Extraction must preserve clear data ownership and contracts.

Do not create a new service repository merely to imitate a microservice architecture.

## Production Access

Privileged Production access is exceptional and controlled.

Applicable requirements include:

- least privilege.
- strong authentication.
- explicit authorization.
- traceability/audit.
- limited duration/scope where practical.
- no casual credential sharing.
- documented emergency intervention.

Exact privileged-access workflow remains open until implemented.

## Project Governance Continues

Production launch does not end Git-based project governance.

Work continues through:

**Phase → Wave → Work Unit → Task**

with:

- Definition of Ready.
- Definition of Done.
- ADRs.
- Project State.
- Handoffs.
- CI/review.
- security/testing integration.

Production incidents, operational findings, and measured learning become tracked project work rather than undocumented chat memory.

## New Market Gate

Expansion to a new market requires review of applicable:

- language/localization.
- currency.
- payment/provider support.
- shipping/logistics.
- tax.
- compliance/legal obligations.
- verification/KYB.
- operational support.

Global-ready foundations do not imply every market is commercially enabled automatically.

## New Provider Gate

Adding a provider requires verification of:

- contract/API boundary.
- authentication/secrets.
- failure behavior.
- retries/idempotency.
- callbacks/webhooks where applicable.
- observability.
- reconciliation where financial.
- security/privacy.
- operational escalation.

Provider-specific logic should remain behind appropriate adapters/boundaries.

## Service Extraction Gate

Before creating a new service/repository, document why extraction is justified and how:

- ownership.
- contracts.
- data authority.
- deployment.
- observability.
- security.
- failure behavior.

will operate.

Architecturally significant extraction requires ADR treatment.

## Explicitly Open Decisions

Phase 12 intentionally leaves unsupported precision unresolved.

Open items include:

- exact Production capacity.
- exact autoscaling thresholds.
- exact SLOs.
- exact RPO/RTO values.
- exact backup retention.
- exact observability stack.
- exact alert thresholds.
- exact WAF/edge product.
- exact SIEM/security monitoring stack.
- exact privileged-access workflow.
- exact on-call rotation/staffing.
- exact public launch date.
- exact rollout cohort/traffic limits.
- exact provider choices.
- exact market expansion order.
- exact sharding trigger.
- exact microservice extraction thresholds.

These decisions are resolved from implementation and operating evidence.

## Foundation Rule

Production operations must be correct, secure, operable, observable, and recoverable from the beginning.

This does not require Production-size capacity or maximum distributed complexity on Day One.

Defer advanced complexity, not foundations.

## Related Documentation

- `../../architecture/infrastructure.md`
- `../../architecture/security-architecture.md`
- `../../architecture/data-architecture.md`
- `../../architecture/event-architecture.md`
- `../../product/business-flows.md`
- `../../templates/DEFINITION_OF_DONE.md`
- `../../runbooks/README.md`
- `../../ROADMAP.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
