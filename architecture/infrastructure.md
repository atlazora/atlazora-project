# Atlazora Infrastructure Architecture

## Governing Principle

**Build production-ready from the start, but do not pay production-size from the start.**

Correctness, security, operability, reproducibility, and migration safety are foundations.

Capacity and infrastructure cost scale with demonstrated need.

## Cloud Target

The approved primary cloud target is Google Cloud Platform.

The approved regional baseline is Dammam:

`me-central2`

The approved Kubernetes target is GKE Autopilot.

The initial runtime is single-cloud.

V1 does not require active-active multi-region or active multi-cloud architecture.

## Infrastructure as Code

Terraform is the authoritative mechanism for managed infrastructure configuration.

Manual cloud changes that affect reproducibility, security, or production architecture must not become undocumented source of truth.

## Environment Lifecycle

The approved engineering lifecycle is:

- Local.
- CI.
- Development.
- Staging.
- Production.

Staging should be production-like in architecture while remaining appropriately smaller and cheaper.

Environment provisioning and promotion must become automated and reproducible.

## Environment Isolation

Meaningful environments require deliberate isolation.

Separate GCP projects are the approved direction, especially for Production separation.

Production credentials, secrets, access, and data must not be casually shared with non-production environments.

Exact project topology remains an implementation decision.

## Compute

Application workloads targeting Kubernetes use GKE Autopilot as the baseline.

Core API and worker processes may scale independently where appropriate.

Durable production databases must not be placed in Kubernetes merely to make infrastructure uniform.

## Production Data Services

Production durable data services should use managed offerings where appropriate for:

- reliability.
- backup.
- high availability.
- patching.
- monitoring.
- operational safety.

PostgreSQL remains transactional truth and should use an appropriate managed production service.

Exact GCP products, tiers, and sizing remain open unless already covered by an Accepted ADR.

## PostgreSQL Operations

Production PostgreSQL must support appropriate:

- automated backups.
- point-in-time recovery where applicable.
- monitoring.
- controlled maintenance.
- high availability.
- restore procedures.

Exact RPO/RTO and retention values remain open.

## Storage

Application object storage uses an S3-compatible abstraction.

Document storage must support appropriate public/private/sensitive classification.

Authorization and security controls apply according to classification.

## Redis

Redis is an ephemeral infrastructure dependency only.

It must not hold irreplaceable transactional truth.

Loss of Redis must not imply loss of authoritative commercial state.

## Search

Search infrastructure stores derived, rebuildable indexes.

The architectural direction supports OpenSearch-compatible search.

Exact provider/deployment remains open.

Loss of Search must not imply loss of authoritative marketplace data.

## Cloud Identity

Cloud access follows least privilege.

GKE workloads should use Workload Identity rather than long-lived static cloud credentials.

Static service-account JSON keys are not the approved normal application credential mechanism.

## Secrets

Google Cloud Secret Manager is the approved direction for managed runtime secrets.

Secrets must not be:

- committed to Git.
- embedded in container images.
- casually copied between environments.

Access must be identity-controlled and auditable where applicable.

## Network and Edge

Infrastructure must support appropriate:

- network boundaries.
- ingress controls.
- TLS.
- DNS.
- load balancing.
- WAF/edge protection where required.
- CDN capability where useful.
- private/service connectivity where applicable.
- restricted administrative access.

Exact products/configuration remain implementation decisions.

## Deployment Artifacts

Atlazora follows:

**Build once, promote immutable artifacts.**

The same immutable build is promoted between environments.

Environment-specific behavior is supplied through configuration and secrets rather than rebuilding source differently for each environment.

## Artifact Registry

Built artifacts should be stored in an appropriate controlled registry such as Google Artifact Registry.

Artifacts must be traceable to their source revision and build pipeline.

Production must use known immutable artifacts rather than ad-hoc local builds.

## CI/CD

CI/CD must progressively automate applicable:

- builds.
- tests.
- contract checks.
- security checks.
- artifact creation.
- artifact scanning.
- infrastructure validation.
- deployment/promotion.

Production deployment must not depend on an undocumented developer-laptop build.

## Supply Chain

The engineering pipeline must establish appropriate supply-chain controls including, where applicable:

- dependency scanning.
- secret scanning.
- static/security analysis.
- container scanning.
- infrastructure scanning.
- SBOM generation.
- artifact traceability.

Federated CI/cloud authentication is preferred over long-lived static credentials.

Exact tool selection remains an implementation decision.

## Database Deployment Safety

Database changes must support controlled application deployment.

For breaking transitions, the approved direction is:

**expand → migrate → contract**

Migrations must be:

- version controlled.
- repeatable.
- observable.
- reviewed.
- compatible with deployment sequencing.

Destructive changes must not assume all running application versions change atomically.

## Contract Deployment Safety

API and event contracts must be compatibility-aware during rollout.

Deployment architecture must not assume all producers and consumers update simultaneously.

## Observability

Infrastructure must support appropriate:

- structured logs.
- metrics.
- traces/correlation where applicable.
- application health.
- infrastructure health.
- deployment visibility.
- database health.
- asynchronous/event health.
- alerting.

Exact tooling and numeric SLOs remain open.

## Backup and Restore

Production durable data requires backups and tested restore capability.

A backup that cannot be restored is not sufficient operational protection.

Restore procedures must be documented and tested according to business risk.

## Disaster Recovery

Disaster-recovery planning is foundational.

Exact numeric:

- RPO.
- RTO.
- failover targets.

remain open.

Active-active multi-region is not required for V1.

## Scaling

Application workloads should scale horizontally where appropriate.

Scaling must be evidence-driven.

The architecture must avoid premature expensive distributed complexity.

Exact capacity and autoscaling thresholds remain open.

## Cost Visibility

Infrastructure must provide cost visibility.

Non-production environments should use appropriately smaller resources while preserving architectural validity.

Production-ready foundations do not require production-size spending before demand exists.

## Operability

Infrastructure design must provide appropriate:

- observability.
- backup and restore.
- disaster recovery considerations.
- access control.
- network/security boundaries.
- deployment safety.
- rollback/recovery mechanisms.
- cost visibility.

## Migration / Cutover

Infrastructure must support Progressive Semantic Migration, staging/pilot operation, production cutover, and eventual legacy retirement without requiring a destructive all-at-once migration.

Migration infrastructure must support repeatability, validation, and recovery.

## Production Deployment Rule

Production deployments must be:

- traceable.
- reproducible.
- based on immutable artifacts.
- controlled through approved CI/CD and infrastructure mechanisms.

Ad-hoc production deployment from a developer laptop is not an approved operating model.

## Portability

Atlazora is GCP-first and initially single-cloud.

Reasonable portability is preserved through:

- standard protocols.
- containers.
- PostgreSQL.
- versioned contracts.
- Terraform.
- S3-compatible object storage abstraction.

Portability does not require active multi-cloud operation.

## Explicitly Open

The infrastructure architecture does not yet finalize:

- exact GCP SKUs.
- exact capacity.
- exact autoscaling thresholds.
- exact Search provider/deployment.
- exact event broker.
- exact WAF/edge product.
- exact observability stack.
- exact overlapping security tools.
- exact backup retention.
- exact RPO/RTO.
- exact numeric SLOs.
- exact project topology details.

These remain explicit later decisions.

## Phase 11 Staging and Private Pilot Model

The approved environment progression is:

**Local → Development → Staging → Production (Private Pilot) → Production (Public)**

Staging remains Production-like but appropriately smaller and is used for deployed-system validation, provider sandbox integration, migration rehearsal, E2E/security/performance/resilience verification, and operational rehearsal.

Production (Private Pilot) is controlled Production exposure rather than a demonstration environment.

Pilot exposure may be restricted through invitations, allowlists, feature flags, provider enablement, and operational gates while preserving the same Production architecture and deployable artifacts intended for broader rollout.

External-provider integrations should progress through appropriate local/mock, sandbox/test, and controlled-live stages.

Release Candidates must follow the build-once/promote-immutable-artifact rule.

Before public launch, applicable migration/cutover procedures must be rehearsed for repeatability, validation, reconciliation, recovery, and source-of-truth transition.

Pilot operation requires sufficient observability, support/incident readiness, backup/restore readiness, rollback/recovery mechanisms, security controls, and cost visibility.

Public launch is an evidence-based release decision rather than an automatic consequence of elapsed pilot time.

Exact pilot market, cohort, duration, providers, numeric success targets, capacity, SLO/RPO/RTO values, and public-launch date remain open until formally approved.

## Phase 12 Production Launch and Operations Model

The approved Production operating progression is:

**Production Ready → Controlled Go-Live → Early-Life Support → Stable Operations**

Production launch is a controlled operational transition rather than a single deployment action.

Applicable launch foundations include:

- isolated Production identities, secrets, data, and privileged access.
- immutable artifacts promoted through the approved pipeline.
- Terraform/IaC as persistent infrastructure source of truth.
- final Progressive Semantic Migration/cutover controls.
- explicit live-payment gate.
- progressive rollout.
- first-transaction observation.
- kill switches and dependency-protection mechanisms where appropriate.
- graceful degradation without corruption of authoritative state.
- explicit application/configuration/infrastructure/data/cutover recovery distinctions.
- tested backup/restore and disaster-recovery procedures.
- launch and ongoing observability.
- incident/runbook readiness.
- evidence-driven scaling and cost visibility.

Routine Production hot editing from developer machines is not an approved operating model.

Database sharding is not a V1 Day-One requirement.

Service extraction from the modular Go Core occurs only when evidence justifies the added operational boundary and must preserve explicit contracts and data ownership.

Exact Production capacity, autoscaling thresholds, SLO/RPO/RTO values, backup retention, observability tooling, alert thresholds, public-launch date, and extraction thresholds remain open until supported by implementation/operating evidence.
