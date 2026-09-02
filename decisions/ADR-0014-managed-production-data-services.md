# ADR-0014 — Managed Production Data Services

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 07
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Production Infrastructure and Data Work Units

## Context

Production databases and durable data systems require backups, patching, high availability, recovery, monitoring, and operational expertise.

## Decision

Atlazora will prefer managed production data services where they satisfy architecture, security, reliability, and regional requirements.

## Rationale

Managed services reduce avoidable operational burden and improve reliability for foundational data infrastructure.

## Alternatives Considered

### Self-Managed Production Data Systems by Default

Rejected because it adds significant operational complexity without current justification.

## Consequences

### Positive

- Managed backups and maintenance capabilities.
- Reduced operational burden.
- Better standard availability and monitoring integration.

### Negative / Trade-offs

- Provider-specific service constraints and cost considerations.

## Security Impact

Managed service IAM, encryption, network access, audit logging, and credential handling must be configured explicitly.

## Data / Migration Impact

Migration procedures must account for managed-service import/export and compatibility constraints.

## Operational Impact

Service limits, backup verification, restore testing, failover behavior, and maintenance policies must be documented.

## Supersession

None.
