# Atlazora Infrastructure Architecture

## Cloud Target

The approved cloud target is Google Cloud Platform.

The approved regional baseline is Dammam.

The approved Kubernetes target is GKE Autopilot.

## Infrastructure as Code

Terraform is the authoritative mechanism for managed infrastructure configuration.

Manual cloud changes that affect reproducibility or production architecture must not become the undocumented source of truth.

## Production Data Services

Production data services should use managed offerings where appropriate for reliability, backup, high availability, patching, and operational safety.

## Deployment Artifacts

Atlazora follows:

**Build once, promote immutable artifacts.**

An artifact promoted between environments should be the same immutable build, with environment-specific behavior supplied through configuration rather than rebuilding application code.

## Environments

The intended lifecycle includes:

- Local
- Dev
- Staging
- Production

Environment provisioning and promotion must become automated and reproducible.

## Storage

Application object storage must use an S3-compatible abstraction.

## Redis

Redis is an ephemeral infrastructure dependency only and must not hold irreplaceable transactional truth.

## Search

Search infrastructure stores derived, rebuildable indexes.

## Operability

Infrastructure design must provide appropriate:

- observability
- backup and restore
- disaster recovery considerations
- access control
- network/security boundaries
- deployment safety
- rollback/recovery mechanisms
- cost visibility

## Migration / Cutover

Infrastructure must support Progressive Semantic Migration, staging/pilot operation, production cutover, and eventual legacy retirement without requiring a destructive all-at-once migration.
