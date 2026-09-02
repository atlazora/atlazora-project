# Phase 07 — Infrastructure & DevOps Architecture

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 07 defines the approved infrastructure and DevOps architecture for Atlazora.

The governing principle is:

**Build production-ready from the start, but do not pay production-size from the start.**

Foundational correctness, security, operability, reproducibility, and migration safety are established early.

Capacity and expensive operational complexity scale with demonstrated need.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Cloud Baseline

The approved primary cloud platform is Google Cloud Platform.

The approved regional baseline is:

**Dammam — `me-central2`**

The approved Kubernetes baseline is:

**Google Kubernetes Engine (GKE) Autopilot**

The initial architecture is single-cloud.

It must remain portable enough at application and contract boundaries to avoid unnecessary provider coupling, but V1 does not require a multi-cloud runtime.

## Infrastructure as Code

Terraform is the authoritative Infrastructure as Code mechanism.

Infrastructure affecting reproducibility, security, or production architecture must be represented in version-controlled infrastructure definitions.

Manual cloud-console changes must not become undocumented architectural truth.

## Environment Lifecycle

The approved engineering lifecycle is:

1. Local
2. CI
3. Development
4. Staging
5. Production

Later launch planning may refine Production into controlled/private and public rollout states without changing the underlying infrastructure principle.

## Local Environment

Local development should use reproducible containerized dependencies where practical.

The local environment should make it possible to develop and test core integrations without requiring every developer action to use production-scale cloud resources.

Local convenience must not create architectural behavior that cannot be reproduced in CI or cloud environments.

## Development Environment

Development provides a real shared integration environment for deployed application components and infrastructure behavior.

It is not a substitute for Staging or Production.

## Staging Environment

Staging must be production-like in architecture while remaining appropriately smaller and cheaper.

It is used for:

- integration verification.
- release-candidate validation.
- migration rehearsal.
- provider sandbox/integration validation.
- operational rehearsal.
- security verification.
- deployment and rollback validation.

## Production Environment

Production must use an operationally safe posture appropriate to real commercial transactions.

This includes, where applicable:

- managed durable data services.
- backups.
- restore capability.
- high availability.
- controlled access.
- observability.
- secure secret delivery.
- edge/security controls.
- deployment safety.
- rollback/recovery mechanisms.

V1 does not require active-active multi-region architecture.

## GKE Autopilot

Application workloads targeting Kubernetes use GKE Autopilot as the approved baseline.

Kubernetes is used for application/service workloads where appropriate.

Durable production databases are not deployed inside Kubernetes merely for infrastructure uniformity.

## PostgreSQL

PostgreSQL is the transactional source of truth.

Production PostgreSQL should use an appropriate managed GCP service.

Production database architecture must support operational capabilities such as:

- automated backups.
- point-in-time recovery where appropriate.
- monitoring.
- controlled maintenance.
- high availability appropriate to Production.
- tested restore procedures.

Exact product tier, sizing, RPO, and RTO remain open.

## Redis

Redis is ephemeral only.

Production Redis should use an appropriate managed service where required.

Redis must not hold irreplaceable transactional truth.

Loss of Redis must be recoverable without loss of authoritative commercial state.

## Search

Search is derived and rebuildable.

The architectural direction supports OpenSearch-compatible search capability.

Search infrastructure must not become the authoritative store for Product, Offer, Supplier, Order, or other transactional truth.

Exact managed/self-managed provider choice remains open.

## Object Storage

Application object storage uses an S3-compatible abstraction.

The storage architecture must support appropriate:

- public.
- private.
- sensitive.

classification.

Authorization, metadata, validation, security scanning, retention, and audit requirements are applied according to document sensitivity and later policy decisions.

## Managed Production Data Services

Production durable data services should use managed offerings where doing so improves:

- reliability.
- backups.
- availability.
- patching.
- monitoring.
- operational safety.

This includes the approved direction for transactional databases and other durable production data systems.

## Network and Edge

Infrastructure must support explicit network and security boundaries.

Production architecture should provide appropriate:

- ingress control.
- TLS.
- DNS.
- load balancing.
- WAF/edge protection where required.
- CDN capability where useful.
- private/service networking where applicable.
- restricted administrative access.

Exact products and policies are finalized in implementation Work Units.

## Identity and Cloud Access

Cloud access follows least privilege.

Workloads should use workload identity/federated identity mechanisms rather than long-lived static cloud credentials.

GCP Workload Identity is the approved direction for GKE workload access.

Static service-account JSON keys must not become the normal application credential mechanism.

## Secrets

Google Cloud Secret Manager is the approved direction for managed runtime secrets.

Secrets must not be committed to Git repositories or embedded in container images.

Secret access must be identity-controlled and environment-appropriate.

## Environment Separation

Cloud environments must have deliberate isolation.

Separate GCP projects are the approved direction for meaningful environment separation, especially Production.

Production credentials, secrets, data, and access must not be casually shared with non-production environments.

Exact project topology is finalized through Terraform implementation.

## Build Once, Promote

Atlazora follows:

**Build once, promote immutable artifacts.**

CI creates a versioned immutable artifact.

The same artifact is promoted between environments.

Environment-specific behavior is supplied through configuration/secrets rather than rebuilding source code differently for each environment.

## Artifact Registry

Container/application artifacts are stored in an appropriate controlled registry such as Google Artifact Registry.

Artifacts must be traceable to source revision and CI execution.

Production deployment must use known immutable artifacts rather than ad-hoc local builds.

## CI/CD

CI/CD must automate applicable:

- build.
- test.
- contract validation.
- security checks.
- artifact creation.
- artifact scanning.
- infrastructure validation.
- deployment/promotion controls.

Production deployment must not depend on an undocumented manual build from a developer laptop.

## Supply-Chain Security

The delivery pipeline must progressively establish appropriate controls including:

- dependency scanning.
- secret scanning.
- static/security analysis.
- container scanning.
- infrastructure scanning.
- software bill of materials where applicable.
- artifact traceability.

Federated CI/cloud authentication is preferred over long-lived static cloud credentials.

Exact overlapping tools remain implementation decisions.

## Database Change Safety

Database changes must be compatible with controlled deployment and rollback strategy.

The approved direction is:

**expand → migrate → contract**

where a breaking schema transition requires staged compatibility.

Migrations must be:

- version controlled.
- repeatable.
- observable.
- reviewed.
- compatible with deployment sequencing.

Destructive changes must not silently invalidate running application versions.

## Contract Compatibility

API and event contract changes must consider compatibility during deployment.

A deployment must not assume all producers and consumers change atomically.

Compatibility requirements are owned jointly by application and contract implementation practices.

## Observability

Infrastructure must support appropriate:

- structured logging.
- metrics.
- traces/correlation where applicable.
- deployment visibility.
- infrastructure health.
- application health.
- queue/event health.
- database health.
- alerting.

Exact observability products and numeric SLOs remain open.

## Backup and Restore

Backups are not sufficient unless restoration can be performed.

Production data services must have documented and tested restore procedures appropriate to business risk.

Backup/restore planning must cover authoritative data and required durable artifacts.

## Disaster Recovery

Disaster-recovery planning is required from the infrastructure foundation.

Exact numeric:

- RPO.
- RTO.
- failover targets.

remain open until explicitly approved.

V1 does not require active-active architecture.

## Scaling

The architecture should scale horizontally where appropriate.

Scaling decisions must be evidence-driven.

The platform must not introduce expensive distributed architecture merely to anticipate hypothetical scale.

Exact capacity assumptions and autoscaling limits remain open.

## Cost Discipline

Infrastructure design must provide cost visibility.

Non-production environments should be appropriately smaller and cheaper while preserving architectural validity.

Production readiness does not mean paying for unnecessary production-scale capacity before demand exists.

## Progressive Semantic Migration

Infrastructure must support Progressive Semantic Migration from the legacy Laravel system.

It must support:

- coexistence during controlled migration.
- repeatable migration execution.
- validation.
- rollback/recovery.
- staging rehearsal.
- production cutover.
- eventual legacy retirement.

Infrastructure must not force a destructive all-at-once migration.

## Production Deployment Rule

Production deployment must be:

- traceable.
- reproducible.
- based on immutable artifacts.
- controlled through approved CI/CD and infrastructure mechanisms.

Ad-hoc production deployment from a developer laptop is not an approved operating model.

## Portability

The initial runtime is GCP-first and single-cloud.

Portability is preserved where economically sensible through:

- standard application protocols.
- versioned contracts.
- PostgreSQL.
- containerized workloads.
- Terraform.
- S3-compatible storage abstraction.
- limited provider-specific coupling at application boundaries.

This does not require lowest-common-denominator infrastructure or active multi-cloud deployment.

## Open / Unresolved

Phase 07 intentionally does not finalize:

- exact GCP SKUs/tier sizes.
- exact database sizing.
- exact Redis sizing.
- exact Search provider/deployment.
- exact event broker.
- exact WAF/edge product/configuration.
- exact observability tool stack.
- exact CI security tool combination.
- exact capacity limits.
- exact autoscaling thresholds.
- exact backup retention.
- exact RPO/RTO.
- exact numeric SLOs.
- exact Production project topology details.

These remain explicit implementation decisions.

## Rejected Directions

The approved infrastructure architecture rejects:

- production-size cost from Day One without need.
- unmanaged production databases merely to save initial effort.
- production databases inside Kubernetes merely for uniformity.
- long-lived static service-account JSON credentials as the normal workload identity mechanism.
- secrets in Git or container images.
- rebuilding application artifacts separately per environment.
- undocumented manual production builds/deployments from a laptop.
- uncontrolled manual infrastructure as the source of truth.
- active-active multi-region architecture as a V1 requirement.
- destructive big-bang migration.

## Related Documentation

- `../../architecture/infrastructure.md`
- `../../architecture/security-architecture.md`
- `../../architecture/system-overview.md`
- `../../architecture/data-architecture.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
- `../../decisions/ADR-0012-gcp-dammam-gke-autopilot.md`
- `../../decisions/ADR-0013-terraform-infrastructure-as-code.md`
- `../../decisions/ADR-0014-managed-production-data-services.md`
- `../../decisions/ADR-0015-s3-compatible-object-storage-abstraction.md`
- `../../decisions/ADR-0018-build-once-promote-immutable-artifacts.md`

## Execution Relationship

W00 Engineering Foundation establishes the actual infrastructure, CI/CD, observability, and security foundations.

Phase 07 preserves the approved target and constraints; it does not claim those environments are already provisioned.
