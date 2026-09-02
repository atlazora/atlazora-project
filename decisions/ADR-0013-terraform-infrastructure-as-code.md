# ADR-0013 — Terraform / Infrastructure as Code

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 07
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Infrastructure Work Units

## Context

Manual infrastructure configuration creates drift, weak reproducibility, and poor auditability.

## Decision

Terraform is the authoritative Infrastructure as Code mechanism for Atlazora managed infrastructure.

Infrastructure changes must be represented in `atlazora-infra` where applicable.

## Rationale

Terraform provides reviewable, repeatable, version-controlled infrastructure configuration.

## Alternatives Considered

### Manual Cloud Configuration as Primary Method

Rejected because it creates undocumented drift.

## Consequences

### Positive

- Reproducible infrastructure.
- Reviewable changes.
- Better environment consistency.
- Easier recovery and audit.

### Negative / Trade-offs

- Terraform state and provider versioning require disciplined management.

## Security Impact

Terraform state may contain sensitive metadata and must be protected appropriately.

## Data / Migration Impact

None directly, but infrastructure migration must be represented declaratively where practical.

## Operational Impact

Plan/apply workflows, state storage, locking, CI validation, and access controls must be established.

## Supersession

None.
