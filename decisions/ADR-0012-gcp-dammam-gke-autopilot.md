# ADR-0012 — GCP / Dammam / GKE Autopilot

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 07 — Infrastructure & DevOps Architecture
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Infrastructure and Deployment Work Units

## Context

Atlazora requires a managed cloud platform and Kubernetes operating model suitable for production deployment, regional placement, scaling, and operational consistency.

## Decision

Google Cloud Platform is the approved cloud provider baseline.

Dammam is the approved regional baseline.

GKE Autopilot is the approved Kubernetes execution model.

## Rationale

This establishes one target infrastructure platform and reduces unnecessary operational variance.

## Alternatives Considered

Other cloud and Kubernetes operating models were not selected in the approved infrastructure baseline.

## Consequences

### Positive

- Clear cloud and regional target.
- Managed Kubernetes operational model.
- Consistent infrastructure automation target.

### Negative / Trade-offs

- Creates intentional dependency on GCP capabilities and regional availability.

## Security Impact

IAM, workload identity, network boundaries, secret management, and least-privilege controls must be designed for GCP/GKE.

## Data / Migration Impact

Data residency and migration plans must align with the approved regional architecture.

## Operational Impact

Capacity, quotas, regional service availability, monitoring, backup, and disaster-recovery design must be validated before production.

## Supersession

None.
