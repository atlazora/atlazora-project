# ADR-0003 — Go Transactional Core

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 — Target Architecture
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Transactional Core Work Units

## Context

Atlazora requires a reliable transactional backend capable of enforcing marketplace invariants, handling concurrency, integrating with PostgreSQL, and supporting long-term modular growth.

## Decision

The primary transactional application core will be implemented in Go in the `atlazora-core` repository.

## Rationale

Go provides a strong fit for explicit backend services, concurrency, operational simplicity, predictable deployment, and modular service evolution.

## Alternatives Considered

### Continue Laravel as Target Core

Rejected as the target architecture. Laravel remains a legacy/reference and migration source.

### Python Transactional Core

Rejected because Python is reserved for the intelligence/data boundary.

## Consequences

### Positive

- Clear transactional ownership.
- Strong deployment and runtime characteristics.
- Compatible with future modular service extraction.

### Negative / Trade-offs

- Business logic must be semantically migrated from the legacy implementation.

## Security Impact

Security-sensitive transactional controls must be implemented in the Go core and not delegated to client applications.

## Data / Migration Impact

Transactional state will progressively migrate to the Go/PostgreSQL target.

## Operational Impact

Go build, test, security scanning, observability, deployment, and runtime standards must be established.

## Supersession

None.
