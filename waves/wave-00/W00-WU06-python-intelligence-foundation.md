# W00-WU06 — Python Intelligence Foundation

- **Phase:** Phase 09 — Implementation Roadmap
- **Wave:** W00 — Engineering Foundation
- **Work Unit:** W00-WU06
- **Status:** READY
- **Primary Repository/Repositories:** `atlazora-intelligence`, `atlazora-project`
- **Contract Dependency Repository:** `atlazora-contracts`
- **Transactional System Dependency:** `atlazora-core`
- **Owner:** Atlazora
- **Last Updated:** 2026-09-03

## Objective

Establish the Python intelligence foundation for Atlazora in `atlazora-intelligence` so data-oriented, analytical, ranking, enrichment, processing, and future ML workloads can evolve behind an explicit boundary that preserves the Go/PostgreSQL transactional system as the authoritative transactional source of truth.

The foundation must establish a safe repository and runtime baseline for intelligence workloads without prematurely implementing business intelligence features, selecting unresolved infrastructure, or allowing derived intelligence outputs to silently become authoritative transactional state.

## Scope

### In Scope

- Establish the `atlazora-intelligence` repository baseline for approved Python intelligence and data workloads.
- Establish a maintainable Python project/package structure appropriate to the intelligence boundary.
- Establish the foundational Python runtime/environment conventions required to develop, test, and execute the repository safely.
- Establish dependency-management conventions appropriate to the repository without expanding into the broader CI/CD and software supply-chain Work Unit.
- Establish configuration and secret-handling conventions appropriate to the intelligence foundation.
- Establish foundational application/process entry points where required for verification of the Python intelligence runtime boundary.
- Establish structured logging and foundational error-handling conventions appropriate to this Work Unit.
- Establish baseline tests and local verification for the Python intelligence foundation.
- Establish the boundary by which intelligence workloads may analyze, derive, enrich, rank, or process data without owning authoritative transactional truth.
- Preserve a clear distinction between derived intelligence outputs and authoritative transactional data.
- Establish contract-oriented integration boundaries with transactional and event systems without duplicating shared executable contracts owned by `atlazora-contracts`.
- Apply least-data and least-permission principles to intelligence workloads.
- Record intentionally unresolved implementation choices without silently converting them into architectural decisions.
- Perform security review appropriate to this Work Unit.
- Record implementation and verification evidence in permanent Git project memory and produce the required Final Handoff before completion.

### Out of Scope

- Implementing business-domain intelligence, recommendation, ranking, search-ranking, fraud, scoring, analytics, or ML features.
- Training or deploying production ML models.
- Selecting or implementing a production ML platform, feature store, model registry, vector database, notebook platform, or orchestration platform unless separately approved.
- Making Python or `atlazora-intelligence` the authoritative transactional system.
- Direct ownership or silent modification of transactional truth owned by the Go/PostgreSQL Core.
- Replacing PostgreSQL as the authoritative transactional datastore.
- Duplicating executable shared contracts owned by `atlazora-contracts`.
- Changing domain ownership or introducing new service/domain boundaries.
- Selecting the final event broker/provider or broker-specific topology.
- Full CI/CD and software supply-chain foundation owned by W00-WU10.
- Full observability foundation owned by W00-WU11.
- Broader engineering security baseline owned by W00-WU12.
- Infrastructure provisioning.
- Web or Admin implementation.
- Migration of Laravel business behavior.
- Premature implementation of later feature Work Units.

## Dependencies

- W00-WU01 — Project Governance & Repositories: `COMPLETE`.
- W00-WU02 — Local Development Platform: `COMPLETE`.
- W00-WU03 — Go Core Foundation: `COMPLETE`.
- W00-WU04 — Contracts Foundation: `COMPLETE`.
- W00-WU05 — Event & Outbox Foundation: `COMPLETE`.
- W00-WU05 Final Handoff is complete and is the required predecessor Handoff.
- `atlazora-intelligence` is the approved repository for Python intelligence workloads.
- `atlazora-core` remains the approved Go transactional Core.
- `atlazora-contracts` remains the owner of shared executable platform/API/event contracts.
- PostgreSQL remains the authoritative transactional datastore.
- Intelligence outputs must remain distinguishable from authoritative transactional data.
- Intelligence workloads must receive only the data and permissions required for their approved purpose.
- Exact later infrastructure, ML-platform, orchestration, observability, and overlapping security-tool choices remain unresolved unless already formally approved.

## Relevant ADRs

- ADR-0003 — Go Transactional Core.
- ADR-0004 — Python Intelligence Boundary.
- ADR-0007 — PostgreSQL as Transactional Source of Truth.
- ADR-0008 — Transactional Outbox From Day One.
- ADR-0009 — Idempotency From Day One.
- ADR-0010 — REST/OpenAPI Versioned Contracts.
- ADR-0011 — Multi-Repository Strategy.
- ADR-0021 — Testing & Security in Every Work Unit.
- ADR-0022 — Git as Permanent Project Memory.
- ADR-0027 — CloudEvents Envelope and Event Identifier Convention.

## Contracts

- Shared executable API and event contracts remain owned by `atlazora-contracts`.
- Intelligence integration must use explicit approved contracts rather than hidden coupling to transactional internals.
- Intelligence workloads must not infer ownership of transactional truth merely because they consume transactional or event data.
- Derived outputs must remain identifiable as derived/non-authoritative unless a later approved contract explicitly establishes a controlled transactional interaction.
- Event consumption, where introduced within this Work Unit, must preserve approved event identity, schema/version validation, and idempotency expectations.
- No new business-domain event catalog is introduced by this foundation Work Unit.

## Security Considerations

- Apply least privilege to data, credentials, services, and runtime permissions.
- Do not commit secrets or production credentials.
- Do not expose sensitive transactional data to intelligence workloads unless required by approved scope.
- Validate external or contract-bound inputs before trusting them.
- Preserve separation between authoritative transactional data and derived intelligence outputs.
- Automated intelligence must not silently become authoritative for sensitive decisions.
- Security-sensitive changes that introduce a new trust boundary require explicit review and, where architectural, an ADR.
- Dependency and secret review are required as part of Work Unit verification.
- No unresolved blocking Critical or High security issue may remain at completion.

## Acceptance Criteria

- [ ] `atlazora-intelligence` has an established Python repository baseline consistent with the approved intelligence boundary.
- [ ] The repository has a clear Python project/package structure suitable for intelligence and data workloads.
- [ ] The foundational Python environment and dependency-management workflow is documented and reproducible.
- [ ] The foundational project can be installed or otherwise prepared according to its documented local workflow.
- [ ] Foundational Python code passes the repository's approved formatting/static-quality verification.
- [ ] Foundational automated tests pass.
- [ ] The foundational runtime or executable verification path, where applicable, runs successfully.
- [ ] Configuration and secret-handling behavior is documented and verified at foundation level.
- [ ] Structured logging and foundational error-handling conventions are established where applicable.
- [ ] The implementation does not make Python or `atlazora-intelligence` authoritative for transactional truth.
- [ ] Derived intelligence outputs remain explicitly distinguishable from authoritative transactional data.
- [ ] Integration boundaries with Core/contracts/events are explicit enough to prevent hidden ownership or schema coupling.
- [ ] Shared executable contracts are not duplicated from `atlazora-contracts`.
- [ ] Intelligence workloads follow least-data and least-permission principles appropriate to the implemented foundation.
- [ ] No business intelligence, recommendation, ranking, scoring, fraud, analytics, or ML feature is prematurely implemented.
- [ ] No unresolved infrastructure, ML-platform, orchestration, broker, or overlapping security-tool choice is silently treated as approved.
- [ ] Applicable security review passes.
- [ ] Repository documentation provides the commands needed to set up, verify, test, and run the foundation.
- [ ] Permanent Git project memory is updated with implementation and verification evidence.
- [ ] A formal W00-WU06 Final Handoff is produced before completion.

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
- [x] `atlazora-intelligence` repository availability and current baseline are verified.
- [x] Required local Python toolchain/runtime availability is verified without changing implementation state.
- [x] Intentionally unresolved decisions are confirmed not to block the foundation scope.

**Definition of Ready Result:** `PASS`.

## Tasks

- [ ] Inspect the current `atlazora-intelligence` repository before implementation.
- [ ] Verify the approved local Python runtime/toolchain baseline.
- [ ] Define the minimal Python repository/project structure consistent with ADR-0004.
- [ ] Establish the foundational Python environment and dependency-management workflow.
- [ ] Establish configuration and secret-handling conventions.
- [ ] Establish foundational process/runtime entry points where applicable.
- [ ] Establish structured logging and foundational error handling where applicable.
- [ ] Establish explicit Core/contracts/event integration boundaries required by the foundation.
- [ ] Implement baseline tests and quality verification.
- [ ] Add repository-local developer setup/test/run documentation.
- [ ] Perform applicable dependency, secret, security, and boundary review.
- [ ] Verify no transactional ownership or later feature scope has leaked into the foundation.
- [ ] Update permanent project memory.
- [ ] Audit Definition of Done.
- [ ] Produce W00-WU06 Final Handoff.

## Verification Plan

Verification must include, where applicable:

- Python environment/toolchain verification.
- Dependency/environment reproducibility verification.
- Formatting/static-quality verification using the repository's approved tooling.
- Python automated tests.
- Foundational runtime/executable verification where applicable.
- Configuration failure-path verification.
- Secret/configuration review.
- Dependency review.
- Security review.
- Verification that Python does not own authoritative transactional truth.
- Verification that derived intelligence outputs remain distinguishable from authoritative transactional data.
- Contract-boundary verification against `atlazora-contracts` where applicable.
- Event schema/version/idempotency verification where event consumption is introduced.
- Git diff/status verification.
- Repository synchronization verification before final completion.

Exact overlapping quality/security tools remain implementation decisions unless formally approved elsewhere; required verification coverage must still be preserved.

## Definition of Done

Evaluate this Work Unit against `templates/DEFINITION_OF_DONE.md`.

Any N/A item must include an explicit reason.

W00-WU06 must not be changed to `COMPLETE` until all applicable implementation, acceptance criteria, verification, security review, documentation, project-memory, and Handoff requirements pass.

## Handoff

A formal Handoff is required before changing status to `COMPLETE`.
