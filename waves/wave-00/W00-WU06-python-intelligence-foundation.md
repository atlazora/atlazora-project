# W00-WU06 — Python Intelligence Foundation

- **Phase:** Phase 09 — Implementation Roadmap
- **Wave:** W00 — Engineering Foundation
- **Work Unit:** W00-WU06
- **Status:** COMPLETE
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

- [x] `atlazora-intelligence` has an established Python repository baseline consistent with the approved intelligence boundary.
- [x] The repository has a clear Python project/package structure suitable for intelligence and data workloads.
- [x] The foundational Python environment and dependency-management workflow is documented and reproducible.
- [x] The foundational project can be installed or otherwise prepared according to its documented local workflow.
- [x] Foundational Python code passes the repository's approved formatting/static-quality verification.
- [x] Foundational automated tests pass.
- [x] The foundational runtime or executable verification path, where applicable, runs successfully.
- [x] Configuration and secret-handling behavior is documented and verified at foundation level.
- [x] Structured logging and foundational error-handling conventions are established where applicable.
- [x] The implementation does not make Python or `atlazora-intelligence` authoritative for transactional truth.
- [x] Derived intelligence outputs remain explicitly distinguishable from authoritative transactional data.
- [x] Integration boundaries with Core/contracts/events are explicit enough to prevent hidden ownership or schema coupling.
- [x] Shared executable contracts are not duplicated from `atlazora-contracts`.
- [x] Intelligence workloads follow least-data and least-permission principles appropriate to the implemented foundation.
- [x] No business intelligence, recommendation, ranking, scoring, fraud, analytics, or ML feature is prematurely implemented.
- [x] No unresolved infrastructure, ML-platform, orchestration, broker, or overlapping security-tool choice is silently treated as approved.
- [x] Applicable security review passes.
- [x] Repository documentation provides the commands needed to set up, verify, test, and run the foundation.
- [x] Permanent Git project memory is updated with implementation and verification evidence.
- [x] A formal W00-WU06 Final Handoff is produced before completion.

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

- [x] Inspect the current `atlazora-intelligence` repository before implementation.
- [x] Verify the approved local Python runtime/toolchain baseline.
- [x] Define the minimal Python repository/project structure consistent with ADR-0004.
- [x] Establish the foundational Python environment and dependency-management workflow.
- [x] Establish configuration and secret-handling conventions.
- [x] Establish foundational process/runtime entry points where applicable.
- [x] Establish structured logging and foundational error handling where applicable.
- [x] Establish explicit Core/contracts/event integration boundaries required by the foundation.
- [x] Implement baseline tests and quality verification.
- [x] Add repository-local developer setup/test/run documentation.
- [x] Perform applicable dependency, secret, security, and boundary review.
- [x] Verify no transactional ownership or later feature scope has leaked into the foundation.
- [x] Update permanent project memory.
- [x] Audit Definition of Done.
- [x] Produce W00-WU06 Final Handoff.

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

## Minimum Python Foundation Decisions

The following implementation decisions are selected for the W00-WU06 foundation baseline only. They do not expand the approved Work Unit scope or pre-select later infrastructure, orchestration, ML-platform, or CI/CD decisions.

- **Python runtime baseline:** Python 3.14.
  - The foundation targets the Python 3.14 release series.
  - The local verified implementation runtime is Python 3.14.4.
  - Patch-level runtime upgrades within the Python 3.14 series remain maintenance changes unless compatibility evidence requires otherwise.
- **Local environment convention:** standard-library `venv`.
- **Baseline package installation/dependency mechanism:** `pip` inside the repository-local virtual environment.
  - No third-party dependency manager such as `uv`, Poetry, or Pipenv is selected by W00-WU06.
  - This does not prevent a later governed Work Unit from introducing a different approved dependency-management or supply-chain workflow.
- **Project metadata/configuration:** `pyproject.toml` is the repository-level configuration and Python project metadata surface for the foundation.
- **Project/package layout:** `src` layout with the Python package isolated under `src/`.
- **Testing:** `pytest`, consistent with the approved Phase 10 Python testing direction.
- **Formatting and linting:** Ruff, selected from the approved Phase 10 candidate/baseline tooling.
- **Python type analysis:** required by the approved testing/security direction.
- **Python type checker:** mypy selected for W00-WU06.
  - Selection rationale: mypy fits the already approved Python 3.14 + repository-local `venv` + `pip` + `pyproject.toml` foundation without introducing an additional Node/npm toolchain.
  - Pyright remains an approved candidate in the broader testing/security direction but is not selected for W00-WU06.
  - Dependency declaration: use unpinned `mypy` in the existing development dependency group, consistent with the current unpinned `pytest` and `ruff` convention.
  - Version policy: no exact mypy version pin is selected for this foundation; mypy 2.3.1 is the current verified package-index reference and is not a project pin.
  - Minimum configuration: use `[tool.mypy]` with `python_version = "3.14"`.
  - Type-analysis invocation scope: `src` and `tests`; no strict mode, plugins, or additional mypy strictness options are selected for this foundation.
  - W00-WU06 must not silently treat either candidate as selected until the implementation reaches the type-analysis step and the choice is explicitly recorded.
- **Transactional boundary:** Python remains non-authoritative for Core-owned transactional truth.
- **Contract boundary:** shared executable contracts remain owned by `atlazora-contracts` and must not be duplicated into `atlazora-intelligence`.

These decisions establish only the minimum reproducible Python foundation needed to proceed with W00-WU06 implementation.
## W00-WU06 Final Definition of Done Audit

### Product / Domain

- Required domain behavior: N/A — W00-WU06 establishes a Python intelligence foundation and introduces no business-domain intelligence behavior.
- Acceptance criteria: PASS — all 20 W00-WU06 acceptance criteria are satisfied for the closure candidate.

### Data

- Database changes: N/A — no database schema or persistence change was introduced.
- Migrations: N/A — no migration was introduced.
- Data ownership/source-of-truth: PASS — Go/PostgreSQL Core remains authoritative transactional truth.

### Contracts

- API contracts: N/A — no API contract was introduced or changed.
- Shared schemas: N/A — no executable shared schema was introduced or changed.
- Compatibility/versioning impact: N/A — no executable contract change was made.
- Shared executable contracts remain owned by `atlazora-contracts`; no duplication was introduced.

### Security

- Authorization: N/A — no protected runtime/service surface was introduced.
- Input/domain validation: N/A — no business/runtime external input surface was introduced.
- Appropriate security review: PASS.
- Committed-secret review: PASS — no tracked secret-pattern hit was detected.
- Configuration/credential surface review: PASS — no runtime credential/configuration surface was introduced.
- Least-data/least-permission boundary: PASS for the implemented foundation.
- Blocking Critical/High security findings: none identified.

### Reliability / Distributed Behavior

- Events: N/A — no producer or consumer runtime was introduced.
- Transactional Outbox: N/A — no transactional write path was introduced.
- Idempotency: N/A — no distributed processing behavior was introduced.
- Error/retry behavior: N/A — no external-I/O or long-running runtime was introduced.

### User Experience

- Web UI: N/A — outside W00-WU06.
- Admin/operations UI: N/A — outside W00-WU06.
- UI error/loading/empty/forbidden/recovery states: N/A — no UI was introduced.

### Tests

- Unit tests: PASS — pytest completed successfully with 1 passing test.
- Integration tests: N/A — no integration surface was introduced.
- Contract tests: N/A — no executable contract change was introduced.
- E2E tests: N/A — no executable application flow was introduced.
- Regression coverage: PASS — import, pytest, Ruff, mypy, install/dependency, security, and boundary verification cover the implemented foundation risk.

### Operations

- Observability: N/A — no long-running runtime was introduced.
- Audit trail: N/A — no business operation was introduced.
- Operational/support procedures: N/A — no deployed runtime was introduced; local setup/test/run workflow is documented in the repository README.
- Deployment/migration/rollback impact: N/A — no deployment or migration behavior was introduced.

### Engineering Quality

- Documentation: PASS — repository-local setup, verification, testing, boundary, configuration/secrets, and applicability documentation is committed.
- CI green: N/A — W00-WU06 does not select or introduce a CI/CD platform or workflow; W00-WU10 owns that foundation.
- Blocking P0/P1 bugs: none identified.
- Blocking Critical/High security issues: none identified.
- Relevant code/configuration review: PASS.
- Ruff: PASS.
- mypy: PASS.
- `pip check`: PASS.

### Project Memory

- `PROJECT_STATE.md`: updated in the closure candidate.
- Relevant ADRs: PASS/N/A for change — existing Accepted ADRs already govern the implemented foundation; no new architectural decision was required.
- Relevant Wave/Work Unit documentation: updated in the closure candidate.
- Formal Handoff: `handoffs/W00-WU06-final-handoff.md` produced in the closure candidate.

### Performance / Resilience

- Performance verification: N/A — no performance-bearing intelligence workload was introduced.
- Resilience/failure-path verification: N/A — no service/external-I/O runtime was introduced.
- Backup/restore/disaster-recovery impact: N/A — W00-WU06 introduces no recoverable datastore or persistent workload.

**Final Definition of Done Audit Result:** PASS for the closure candidate.

The 40 Definition of Done checklist entries are individually accounted for. The duplicate Critical/High-security requirements under Security and Engineering Quality are treated as separate checklist entries.

## Implementation and Closure Evidence

- Intelligence repository: `atlazora-intelligence`.
- Final Intelligence commit: `e7309277ebd22ced968dc8f041334d638bb12a62`.
- Branch: `main`.
- Local/remote synchronization: PASS.
- Working tree: clean.
- Python target release series: 3.14.
- Locally verified Python runtime: 3.14.4.
- Environment convention: standard-library `venv`.
- Installation/dependency mechanism: repository-local `pip`.
- Project metadata/configuration: `pyproject.toml`.
- Package structure: `src/atlazora_intelligence`.
- pytest: PASS — 1 passed.
- Ruff: PASS — all checks passed.
- mypy: PASS — no issues found in 2 source files.
- `pip check`: PASS — no broken requirements found.
- Package import/runtime verification: PASS.
- Repository-local README setup/test/run documentation: PASS.
- Tracked secret review: PASS.
- Configuration/credential surface review: PASS.
- Transactional authority boundary review: PASS.
- Shared executable contract duplication review: PASS.
- Premature feature/platform scope review: PASS.
- Python remains non-authoritative for Core-owned transactional truth.
- Derived intelligence outputs remain distinguishable from authoritative transactional data.
- Shared executable API/event contracts remain owned by `atlazora-contracts`.
- No business intelligence, recommendation, ranking, scoring, fraud, analytics, or ML feature was introduced.
- No production ML platform, orchestration platform, vector database, feature store, model registry, notebook platform, event broker, infrastructure platform, or CI/CD platform was selected.

## Closure Candidate

Implementation, local workflow verification, type/static-quality verification, automated testing, dependency verification, security/boundary review, documentation, permanent project-memory updates, Definition of Done audit, and Final Handoff requirements pass for the W00-WU06 governance closure candidate.

W00-WU06 is `COMPLETE` in this closure candidate.

No primary Work Unit is `IN_PROGRESS`.

W00-WU07 remains `PLANNED` and has not started.
