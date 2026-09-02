# ADR-0021 — Testing and Security Integrated Into Every Work Unit

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 10 — Testing & Security
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** All Work Units

## Context

Deferring testing and security until late in development creates expensive rework and allows architectural defects to become entrenched.

## Decision

Testing and security are mandatory integrated concerns of every applicable Work Unit.

They are evaluated through Definition of Ready, implementation, CI, security review, and Definition of Done.

## Rationale

Correctness and security are engineering foundations rather than post-development cleanup activities.

## Alternatives Considered

### Dedicated Final Testing/Security Phase Only

Rejected.

## Consequences

### Positive

- Earlier defect detection.
- Stronger regression safety.
- Security requirements influence architecture when needed.

### Negative / Trade-offs

- Each Work Unit carries explicit verification effort.

## Security Impact

Security considerations and blocking findings are completion criteria.

## Data / Migration Impact

Migration logic must receive appropriate tests and security review.

## Operational Impact

CI and repository-specific test/security tooling must be established as repositories become active.

## Supersession

None.
