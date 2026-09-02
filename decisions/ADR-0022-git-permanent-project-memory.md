# ADR-0022 — Git as Permanent Project Memory

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 09
- **Related Wave(s):** W00–W17
- **Related Work Unit(s):** All Work Units

## Context

Chat sessions are useful for collaborative execution but are not a sufficiently durable or structured source of project truth.

A future engineer or Work Unit must be able to resume from repository state without reconstructing decisions from conversation history.

## Decision

Git-tracked project documentation is Atlazora's permanent project memory.

Architecture, product baseline, ADRs, project state, Work Unit documentation, handoffs, and operational runbooks must be persisted in the appropriate repositories.

## Rationale

Git provides version history, reviewability, durability, traceability, and proximity to implementation.

## Alternatives Considered

### Chat History as Primary Project Memory

Rejected because it is session-oriented and difficult to govern as authoritative engineering state.

### Separate Jira/Notion as Required Source of Truth

Not required at the current project stage.

## Consequences

### Positive

- Work is independently resumable.
- Decisions remain versioned.
- Project state can be reviewed with implementation history.

### Negative / Trade-offs

- Documentation must be maintained as part of engineering work.

## Security Impact

Secrets and sensitive credentials must never be stored merely because Git is the project memory mechanism.

## Data / Migration Impact

None directly.

## Operational Impact

Every Work Unit must update project memory and produce a Handoff before completion.

## Supersession

None.
