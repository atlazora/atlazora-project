# ADR-0002 — User and Organization Are Separate Domain Concepts

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 05 — Domain & Data Model
- **Related Wave(s):** W01
- **Related Work Unit(s):** Identity & Organization Work Units

## Context

Users are human identities while organizations represent business entities and commercial ownership. Treating them as the same object creates authorization, ownership, and lifecycle problems.

## Decision

Atlazora will model User and Organization as separate domain concepts.

Users may have relationships to Organizations through explicit membership, ownership, roles, or other approved association models.

## Rationale

This supports organization-level business ownership while preserving individual identity and accountability.

## Alternatives Considered

### User-as-Organization

Rejected because it prevents correct representation of multi-user organizations and organization-scoped authorization.

## Consequences

### Positive

- Clear organizational ownership.
- Supports multiple users per organization.
- Supports explicit organization membership and permissions.
- Enables stronger audit and authorization boundaries.

### Negative / Trade-offs

- Identity and authorization models become more explicit and therefore more structured.

## Security Impact

Authentication alone does not imply authority over an Organization. Organization membership and role/permission checks are required.

## Data / Migration Impact

Legacy identity/business records may require separation during semantic migration.

## Operational Impact

Administrative workflows must expose organization and user relationships explicitly.

## Related Decisions

None currently.

## Supersession

None.

