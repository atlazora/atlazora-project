# ADR-0025 — Admin and Operations Use Approved Application Boundaries

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 10 / Phase 12
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** Admin, Operations, Security, Support, and Production Work Units

## Context

Atlazora requires Admin and Operations capabilities for verification, support, disputes, finance operations, moderation, configuration, migration, and Production operations.

If normal operational workflows depend on direct database modification, domain invariants, authorization, validation, audit, events, idempotency, and historical traceability can be bypassed.

## Decision

Normal Admin/Ops workflows must use approved application APIs, commands, or domain behaviors.

Routine direct database manipulation is not an approved Admin integration or business-operations mechanism.

Admin capabilities must respect the same authoritative domain ownership and invariants as other application interfaces.

Privileged and materially important operational actions require appropriate authorization, attribution, validation, and auditability.

Exceptional Production access may exist for controlled incident, recovery, or emergency procedures, but it must not become a substitute for missing product/operations capabilities.

Such exceptional access must follow the applicable security, access-control, audit, and runbook requirements.

## Rationale

Operational tooling is part of the product architecture.

Using controlled application boundaries prevents Admin/Ops workflows from silently bypassing business correctness and security controls.

## Alternatives Considered

### Direct Database Administration as Normal Operations Workflow

Rejected because it bypasses application invariants, authorization, validation, events, and audit behavior.

### Separate Uncontrolled Admin Logic

Rejected because Admin must not become an alternative source of business truth.

## Consequences

### Positive

- Domain invariants remain enforceable.
- Privileged actions are easier to authorize and audit.
- Operational workflows become repeatable and testable.
- Missing operational capabilities become visible engineering work instead of hidden database procedures.
- Production support is safer.

### Negative / Trade-offs

- Admin/Ops capabilities must be implemented explicitly.
- Emergency access requires controlled procedures and runbooks.
- Some operational workflows require additional API/command design.

## Security Impact

Admin/Ops access requires least privilege, strong authentication, authorization, attribution, and auditability appropriate to the action.

Production access is exceptional and must be controlled.

## Data / Migration Impact

Migration and remediation tooling must preserve domain/data ownership and must not establish uncontrolled dual-write or direct-edit practices.

## Operational Impact

Runbooks must distinguish normal application-mediated operations from exceptional Production access.

Repeated need for direct database intervention is evidence of missing operational capability or a system defect and should create tracked engineering work.

## Related Decisions

- ADR-0002 — User and Organization Are Separate Domain Concepts
- ADR-0007 — PostgreSQL as Transactional Source of Truth
- ADR-0009 — Idempotency From Day One
- ADR-0010 — REST and OpenAPI Versioned Contracts
- ADR-0021 — Testing and Security Integrated Into Every Work Unit
- ADR-0022 — Git as Permanent Project Memory
- ADR-0024 — Order, Payment, and Shipment Have Separate Domain Ownership

## Supersession

None.
