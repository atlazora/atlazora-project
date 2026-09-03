# W00-WU05 — Event & Outbox Foundation

- **Phase:** Phase 09 — Implementation Roadmap
- **Wave:** W00 — Engineering Foundation
- **Work Unit:** W00-WU05
- **Status:** COMPLETE
- **Primary Repository/Repositories:** `atlazora-core`, `atlazora-project`
- **Contract Dependency Repository:** `atlazora-contracts`
- **Owner:** Atlazora
- **Last Updated:** 2026-09-03

## Objective

Establish the foundational Transactional Outbox and idempotent asynchronous integration model for Atlazora so transactional changes that require reliable event publication can preserve PostgreSQL transactional truth while supporting duplicate-safe asynchronous processing.

The foundation must operate against the approved CloudEvents 1.0 event-contract boundary and UUIDv7 event-identifier convention without coupling business-event semantics to an unresolved event broker.

## Scope

### In Scope

- Implement the foundational Transactional Outbox runtime behavior in `atlazora-core`.
- Persist required outbox state in PostgreSQL as part of the authoritative transactional model.
- Establish atomic transactional-write and outbox-write behavior.
- Establish foundational publisher processing for pending outbox records.
- Establish retry-safe publication behavior at the runtime boundary that does not require selecting the final broker.
- Establish idempotent-consumption foundations for duplicate delivery.
- Preserve the same CloudEvent `source` and `id` when the same already-created event is retried or redelivered.
- Keep event identity separate from outbox-row identity, broker-message identity, request identity, correlation identity, and domain aggregate identity.
- Validate consumed event structure/schema before trusting payload content where applicable.
- Preserve producer/domain ownership and PostgreSQL transactional source-of-truth rules.
- Provide applicable tests for transactional consistency, duplicate delivery, idempotency, retry/failure behavior, and event contract handling.
- Provide foundational operational visibility for outbox backlog, lag, failures, retries, and duplicate/idempotency behavior where applicable.
- Update permanent Git project memory and produce the required W00-WU05 Handoff before completion.

### Out of Scope

- Selecting the final event broker/provider.
- Kafka adoption or any other broker-specific commitment.
- Broker-specific topics, queues, routing keys, partitioning, or topology.
- Broker-specific retry/backoff configuration.
- Broker-specific dead-letter implementation.
- Final retention or replay configuration.
- Infrastructure provisioning.
- Full CI/CD and software supply-chain foundation owned by W00-WU10.
- Full observability foundation owned by W00-WU11.
- Broader engineering security baseline owned by W00-WU12.
- Business-domain event catalogs or later business feature events.
- Microservice extraction or new service boundaries.
- Changing authoritative transactional ownership.
- Duplicating shared executable event schemas from `atlazora-contracts`.

## Dependencies

- W00-WU03 — Go Core Foundation: `COMPLETE`.
- W00-WU04 — Contracts Foundation: `COMPLETE`.
- `atlazora-core` is available and provides the approved Go transactional runtime and PostgreSQL connectivity foundation.
- `atlazora-contracts` is available and provides the approved executable CloudEvents-based event-contract foundation.
- PostgreSQL is the authoritative transactional datastore.
- The final event broker remains intentionally unresolved; W00-WU05 must remain transport-independent until formally resolved.
- The W00-WU04 Final Handoff has been completed and reviewed as the required predecessor Handoff.

## Relevant ADRs

- ADR-0003 — Go Transactional Core.
- ADR-0007 — PostgreSQL as Transactional Source of Truth.
- ADR-0008 — Transactional Outbox From Day One.
- ADR-0009 — Idempotency From Day One.
- ADR-0010 — REST and OpenAPI Versioned Contracts.
- ADR-0011 — Multi-Repository Strategy.
- ADR-0021 — Testing and Security Integrated Into Every Work Unit.
- ADR-0022 — Git as Permanent Project Memory.
- ADR-0026 — Contract Specifications and Validation Toolchain.
- ADR-0027 — CloudEvents Envelope and Event Identifier Convention.
- ADR-0028 — Shared API and Platform Contract Conventions.

## Contracts

- Shared executable event schemas remain owned by `atlazora-contracts`.
- Foundational business-event envelopes use CloudEvents 1.0 semantics.
- Event identifiers use the approved UUIDv7 convention defined by ADR-0027.
- A retry or redelivery of the same already-created event preserves the same event `id`.
- Duplicate-delivery identity follows the approved CloudEvents `source` + `id` boundary.
- Event schemas remain versioned and compatibility-aware.
- Runtime implementation must not redefine shared event-contract semantics.
- The final broker/provider and broker-native metadata remain outside the contract identity and are unresolved.

## Security Considerations

- Outbox data may contain sensitive business metadata and requires appropriate access control.
- PostgreSQL access must follow least privilege and approved secret-management practices.
- Event envelopes and payloads must not expose secrets, authentication tokens, infrastructure credentials, or unnecessary sensitive information.
- Consumers must validate event structure/schema before trusting payload content where applicable.
- Idempotency identifiers must not create information leaks or cross-tenant collisions.
- Duplicate/replay processing must preserve authentication, authorization, privacy, tenant/domain isolation, and source-of-truth rules.
- Logs and operational diagnostics must not leak inappropriate sensitive data.
- Security testing/review is part of this Work Unit's completion criteria.

## Acceptance Criteria

- [x] Transactional changes requiring reliable publication can write their required outbox record atomically with the authoritative PostgreSQL transaction.
- [x] A committed transaction does not depend on a synchronous external event broker write for correctness.
- [x] Pending outbox records have a defined runtime processing path.
- [x] Publisher processing can recover safely from temporary publication/dependency failure.
- [x] Retry/redelivery of the same already-created event preserves its approved CloudEvent identity.
- [x] Duplicate delivery can be detected using the approved event identity boundary.
- [x] Foundational consumer processing is idempotent where duplicate effects are possible.
- [x] Consumer processing validates applicable event structure/schema before trusting payload content.
- [x] Duplicate or replay processing does not create conflicting ownership of producer-owned transactional truth.
- [x] Outbox lag/backlog, failures, retries, and important duplicate/idempotency behavior are observable at the foundation level where applicable.
- [x] Applicable tests cover transactional write/outbox consistency, publisher retry, duplicate event delivery, consumer idempotency, event schema/version validation, temporary dependency failure, and failed/retried processing visibility.
- [x] Reordering and poison/failing-message behavior are tested where the implemented transport-independent runtime boundary makes them applicable.
- [x] No broker/provider, broker topology, DLQ implementation, routing/partition strategy, retention period, or replay configuration is selected without an approved decision.
- [x] Shared executable event contracts remain owned by `atlazora-contracts` and are not duplicated in `atlazora-core`.
- [x] Security review identifies no unresolved blocking finding.
- [x] Required documentation, project-memory updates, verification evidence, and Final Handoff are completed before `COMPLETE`.

## Definition of Ready

Before changing status to `READY`, verify:

- [x] Objective is clear.
- [x] Scope is clear.
- [x] Dependencies are complete or explicitly resolved.
- [x] Relevant ADRs are available.
- [x] Acceptance criteria are clear and testable.
- [x] Repositories to be changed are known.
- [x] Security considerations are known.
- [x] Contracts are known enough to begin safely.
- [x] Previous required Handoff is complete.

**Definition of Ready Result:** `PASS`.

The unresolved final event broker does not block readiness because the approved architecture explicitly requires the event contract and foundational runtime model to remain transport-independent until that decision is formally resolved. Broker-specific implementation and tests remain excluded.

## Tasks

- [x] Inspect the current `atlazora-core` persistence/runtime structure before implementation.
- [x] Define the minimal transport-independent outbox persistence/runtime design consistent with accepted ADRs.
- [x] Implement the PostgreSQL outbox persistence foundation.
- [x] Implement atomic transactional-write/outbox-write support.
- [x] Implement foundational outbox publisher processing without selecting a final broker.
- [x] Implement retry/failure-safe publisher behavior at the approved transport-independent boundary.
- [x] Implement foundational idempotent-consumption persistence/processing.
- [x] Integrate the approved CloudEvents event identity and contract boundary.
- [x] Implement applicable security controls and input/schema validation.
- [x] Implement applicable event/outbox/idempotency/failure tests.
- [x] Add foundation-level operational diagnostics required by this Work Unit.
- [x] Run verification and security review.
- [x] Update governance/project memory.
- [x] Produce W00-WU05 Final Handoff.

## Verification Plan

Verification must include, where applicable:

- Go formatting and static analysis.
- Go unit/integration tests.
- PostgreSQL-backed verification of transactional write/outbox consistency.
- Failure-path verification demonstrating that authoritative transaction correctness does not depend on a synchronous broker write.
- Publisher retry/recovery verification.
- Duplicate event-delivery verification.
- Consumer idempotency verification.
- Event schema/version validation against the approved `atlazora-contracts` boundary.
- Temporary dependency failure and recovery verification.
- Reordering verification where consumers may observe it.
- Poison/failing-message verification where applicable to the implemented transport-independent boundary.
- Verification that retries/redeliveries preserve CloudEvent identity.
- Verification that outbox identity and event identity remain distinct.
- Verification that shared executable event contracts are not duplicated into `atlazora-core`.
- Security review covering sensitive outbox/event data, secrets, tenant/domain isolation, validation, and telemetry leakage.
- Operational evidence for applicable backlog/lag/failure/retry/idempotency diagnostics.
- Broker-specific tests are explicitly deferred until a broker is formally selected.

## Definition of Done

Evaluate this Work Unit against `templates/DEFINITION_OF_DONE.md`.

Any N/A item must include a reason.

W00-WU05 must not be changed to `COMPLETE` until its implementation, verification evidence, security review, governance updates, and formal Handoff satisfy the applicable Definition of Done.

## Handoff

A formal Handoff is required before changing status to `COMPLETE`.
### W00-WU05 Final Definition of Done Audit

#### Product / Domain

- Required domain behavior: N/A — W00-WU05 establishes infrastructure/runtime integration foundations and does not introduce business-domain workflows.
- Acceptance criteria: PASS for the closure candidate.

#### Data

- PostgreSQL persistence foundation: PASS.
- Transactional authoritative-write plus outbox-write behavior: PASS.
- Migration is version-controlled and PostgreSQL-backed verification passed.
- Data ownership/source-of-truth: PASS — PostgreSQL remains authoritative and producer/domain ownership remains unchanged.
- Migration execution framework/startup automation: N/A — no framework/tool selection is required by W00-WU05 and none was introduced.

#### Contracts

- CloudEvents 1.0 foundational contract boundary: PASS.
- UUIDv7 event identity preservation: PASS.
- Duplicate identity boundary using `source` + `id`: PASS.
- Executable event-schema ownership: PASS — remains in `atlazora-contracts`.
- Executable schema duplication into `atlazora-core`: NONE.
- Concrete Go JSON Schema engine selection: N/A — W00-WU05 requires the mandatory validation-before-handler boundary; executable schema validation remains authoritative in `atlazora-contracts`.

#### Security

- Committed secret review: PASS; no actual committed secret detected.
- Validation-before-handler security boundary: PASS.
- SQL-injection surface review: PASS; no dynamic SQL construction detected in the reviewed WU05 runtime.
- Outbox concurrency/lease ownership review: PASS.
- Idempotency security boundary: PASS.
- Sensitive telemetry leakage review: PASS.
- New dependency security impact: NONE — WU05 introduced no dependency changes.
- Blocking Critical/High security findings: none identified.

#### Reliability / Distributed Behavior

- Transactional Outbox foundation: PASS.
- Transport-independent publisher processing: PASS.
- Temporary publication failure/recovery behavior: PASS.
- Expired processing lease recovery: PASS.
- Idempotent-consumption foundation: PASS.
- Duplicate-delivery suppression: PASS.
- CloudEvent identity preservation across retry/redelivery: PASS.
- Broker-specific retry/backoff, DLQ, routing, partitioning, retention, and replay behavior: N/A — final broker remains unresolved and these decisions are explicitly outside W00-WU05.
- Reordering/poison-message behavior beyond the implemented transport-independent failure/lease boundary: N/A — broker-specific semantics are intentionally deferred.

#### User Experience

- Web UI: N/A — outside W00-WU05.
- Admin UI: N/A — outside W00-WU05.
- End-user workflow behavior: N/A — no user-facing feature is introduced.

#### Tests

- Go unit/regression tests: PASS.
- PostgreSQL-backed integration verification: PASS.
- Atomic transaction/outbox consistency: PASS.
- Publisher success/failure/retry lifecycle: PASS.
- Duplicate event delivery/idempotency: PASS.
- Rollback behavior: PASS.
- Event validation-before-handler behavior: PASS.
- Authoritative contract validation in `atlazora-contracts`: PASS.
- Operational visibility regression: PASS.

#### Operations

- Ready backlog visibility: PASS.
- Processing-count visibility: PASS.
- Failed-pending visibility: PASS.
- Retried-event visibility: PASS.
- Consumption-marker visibility: PASS.
- Oldest-ready lag visibility: PASS.
- Full metrics/alerts/dashboard/SLO framework: N/A — owned by W00-WU11.
- Broker operational procedures: N/A — broker/provider remains unresolved.

#### Engineering Quality

- Documentation/comments for foundational runtime boundaries: PASS.
- Core regression tests: PASS.
- No WU05 dependency changes: PASS.
- No executable broker coupling: PASS.
- No shared executable event-schema duplication: PASS.
- Relevant implementation/security review: PASS.
- Blocking P0/P1 bugs: none identified.

#### Project Memory

- `PROJECT_STATE.md`: updated in closure candidate.
- `ROADMAP.md`: reviewed/updated for closure-candidate consistency.
- Wave/Work Unit documentation: updated in closure candidate.
- Formal Handoff: produced in closure candidate.
- Relevant ADRs remain Accepted; no new material broker/provider decision was made.

#### Performance / Resilience

- Concurrent outbox claim safety using PostgreSQL row locking: PASS.
- Lease recovery/failure path: PASS.
- Duplicate/retry resilience: PASS.
- Numeric performance/capacity targets: N/A — no approved numeric target exists for W00-WU05.
- Backup/restore/disaster-recovery policy change: N/A — W00-WU05 does not change the approved recovery architecture.

**Final Definition of Done Audit Result:** PASS for closure candidate.

### Implementation and Closure Evidence

- Core repository: `atlazora-core`.
- Core implementation commit: `2c9c12f72b720b763bc0ca9e3c75c5bd3006fa39`.
- Core branch: `main`.
- Core local/remote synchronization: PASS.
- Core worktree after implementation/security verification: clean.
- Transactional Outbox foundation: PASS.
- PostgreSQL persistence: PASS.
- Atomic authoritative-write plus outbox-write behavior: PASS.
- Pending outbox processing path: PASS.
- Transport-independent publisher: PASS.
- Retry/failure safety: PASS.
- Idempotent-consumption foundation: PASS.
- CloudEvents identity preservation: PASS.
- Validation-before-handler boundary: PASS.
- Authoritative executable contract validation in `atlazora-contracts`: PASS.
- Operational visibility foundation: PASS.
- Real PostgreSQL regression: PASS.
- Core normal regression: PASS.
- Final security review: PASS.
- Blocking Critical/High security findings: none identified.
- Executable broker coupling: NONE.
- Dependency changes: NONE.
- Full observability framework: NOT INTRODUCED.
- Event broker/provider selection: NONE.
- Broker topology/partitioning/DLQ/backoff/retention/replay decisions: NONE.

### Closure Candidate

Implementation, PostgreSQL-backed verification, contract-boundary verification, reliability/failure verification, security review, documentation, project-memory preparation, and Formal Handoff requirements pass.

W00-WU05 is formally `COMPLETE`. The governance closure candidate was committed, pushed, and Governance Validation succeeded before this final status transition.
