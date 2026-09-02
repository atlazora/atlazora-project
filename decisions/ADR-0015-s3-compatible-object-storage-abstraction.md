# ADR-0015 — S3-Compatible Object Storage Abstraction

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 07
- **Related Wave(s):** Cross-cutting
- **Related Work Unit(s):** File and Object Storage Work Units

## Context

Atlazora requires durable object storage for files and media while avoiding unnecessary application coupling to a provider-specific storage API.

## Decision

Application-facing object storage will use an S3-compatible abstraction.

## Rationale

This provides a stable application boundary and improves portability of storage behavior.

## Alternatives Considered

### Direct Provider-Specific Storage API Throughout Application Code

Rejected because it spreads infrastructure coupling through business/application layers.

## Consequences

### Positive

- Cleaner storage abstraction.
- Easier testing and local compatibility.
- Reduced provider-specific application coupling.

### Negative / Trade-offs

- Only the portable subset of required behavior should be assumed unless explicitly extended.

## Security Impact

Bucket/object permissions, signed access, encryption, retention, and sensitive-file handling must be explicitly designed.

## Data / Migration Impact

Object identifiers and metadata should remain portable enough to support migration.

## Operational Impact

Lifecycle policies, backups where required, monitoring, and access auditing must be defined.

## Supersession

None.
