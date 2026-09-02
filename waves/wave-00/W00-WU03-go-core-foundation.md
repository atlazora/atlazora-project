# W00-WU03 — Go Core Foundation

- **Wave:** W00 — Engineering Foundation
- **Status:** COMPLETE
- **Primary Repository:** `atlazora-core`
- **Project Memory Repository:** `atlazora-project`
- **Technology:** Go 1.27.x
- **Started:** 2026-09-02

## Objective

Establish the Go transactional Core foundation including the approved project/module structure and foundational application/runtime conventions while preserving explicit domain ownership and the approved modular-first architecture.

## Scope

### In Scope

- Activate the official `atlazora-core` repository as the Go transactional Core repository.
- Establish the Go module and repository baseline.
- Establish a modular Core project structure that preserves approved domain boundaries.
- Establish application/runtime foundations required for the Core to compile, run, and evolve safely.
- Establish configuration conventions appropriate to the Core foundation.
- Establish process entry points appropriate to the approved Core architecture.
- Establish foundational health/lifecycle behavior needed to verify the runtime.
- Establish PostgreSQL connectivity foundation without implementing domain-owned physical schemas or domain business persistence.
- Establish structured logging/runtime error-handling conventions at foundation level.
- Establish graceful startup/shutdown conventions.
- Establish baseline tests for foundational behavior.
- Establish repository-local developer commands/documentation needed to build, test, vet, and run the Core.
- Perform security review appropriate to this Work Unit.
- Record the resulting implementation and verification evidence in permanent Git project memory.

### Out of Scope

- Business domain feature implementation.
- Physical domain table/schema design beyond what is strictly required for connectivity verification.
- Domain migrations and domain persistence repositories.
- Shared executable OpenAPI, event, or platform contracts; those belong to W00-WU04 and `atlazora-contracts`.
- Transactional Outbox and event publication foundation; those belong to W00-WU05.
- Full CI/CD supply-chain implementation belonging to later Engineering Foundation Work Units.
- Full observability foundation belonging to its dedicated Work Unit.
- Full application security baseline belonging to its dedicated Work Unit.
- Service extraction or repository-per-domain decomposition.
- Migration of Laravel business behavior.

## Dependencies

- W00-WU01 — Project Governance and Repositories — COMPLETE.
- W00-WU02 — Local Development Platform — COMPLETE.
- Official `atlazora-core` repository exists and is available locally.
- Go 1.27.x toolchain is installed and verified.
- Local PostgreSQL environment from W00-WU02 is available for integration verification where required.

## Relevant ADRs

- ADR-0003 — Go Transactional Core.
- ADR-0006 — Modular Architecture First, Progressive Microservices.
- ADR-0007 — PostgreSQL as Transactional Source of Truth.
- ADR-0008 — Transactional Outbox Day One.
- ADR-0009 — Idempotency Where Duplicate Effects Are Possible.
- ADR-0010 — REST/OpenAPI Versioned Contracts.
- ADR-0011 — Multi-Repository Strategy.
- ADR-0021 — Testing and Security in Every Work Unit.
- ADR-0022 — Git as Permanent Project Memory.

## Architecture Constraints

- `atlazora-core` owns primary transactional domain behavior.
- The initial target is a modular Go Core, not microservices from day one.
- Modules preserve explicit domain ownership even when deployed together.
- PostgreSQL is authoritative transactional truth.
- Shared physical PostgreSQL infrastructure does not grant cross-domain write ownership.
- Cross-domain behavior must use controlled application/module boundaries.
- Python intelligence must not directly mutate Core-owned transactional truth.
- Redis remains ephemeral.
- Search and projections remain derived/rebuildable.
- Shared executable API/event schemas remain owned by `atlazora-contracts`.
- Transactional Outbox remains a required architectural foundation, but its implementation belongs to W00-WU05.

## Contracts

No new shared executable external contract is defined by W00-WU03.

If runtime endpoints are introduced solely for process health/readiness verification, they must remain implementation-level operational endpoints and must not replace the future versioned API contract foundation in `atlazora-contracts`.

## Security Considerations

- No secrets committed to Git.
- Configuration must support environment-based secret injection.
- Database credentials must not be hard-coded.
- Runtime errors must not expose sensitive configuration or credentials.
- Process shutdown must be controlled and deterministic.
- Dependencies must be reviewed and minimized.
- Foundation tests and security verification are mandatory under ADR-0021.
- Database access must follow least-privilege-compatible design.

## Acceptance Criteria

- [x] `atlazora-core` is initialized as a valid Go module.
- [x] The repository has an approved modular project structure.
- [x] Core domain/module boundaries are represented without creating independent services or repositories.
- [x] The project builds successfully.
- [x] All Go source is formatted.
- [x] `go vet ./...` passes.
- [x] `go test ./...` passes.
- [x] Core runtime can start successfully.
- [x] Core runtime supports controlled graceful shutdown.
- [x] Foundational configuration loading is implemented and tested.
- [x] Foundational structured logging is implemented.
- [x] PostgreSQL connectivity foundation is implemented and locally verified.
- [x] PostgreSQL remains the transactional source of truth.
- [x] No business-domain schema or business feature is prematurely implemented.
- [x] No shared executable API/event contract is duplicated from `atlazora-contracts`.
- [x] No Transactional Outbox implementation is prematurely absorbed from W00-WU05.
- [x] Security review for this Work Unit passes.
- [x] Repository documentation provides reproducible build/test/run instructions.
- [x] Project-memory documentation is updated with final implementation and verification state.
- [x] Formal Handoff is produced before COMPLETE.

## Definition of Ready

- [x] Objective is clear.
- [x] Scope is clear.
- [x] Dependencies are complete/resolved.
- [x] Relevant ADRs are available.
- [x] Acceptance criteria are clear and testable.
- [x] Repositories to be changed are known.
- [x] Security considerations are known.
- [x] Contract ownership is known sufficiently for this Work Unit.
- [x] Required previous Handoff is complete.
- [x] Go toolchain is installed and verified.
- [x] `atlazora-core` is locally available and pristine.

**Definition of Ready Result:** PASS

## Tasks

1. Establish repository baseline files.
2. Initialize the Go module.
3. Establish modular Core package structure.
4. Establish process/runtime entry points.
5. Establish configuration foundation.
6. Establish structured logging foundation.
7. Establish lifecycle and graceful shutdown behavior.
8. Establish PostgreSQL connectivity foundation.
9. Add foundational unit/integration tests.
10. Add developer build/test/run documentation.
11. Perform formatting, vet, test, build, runtime, PostgreSQL, and security verification.
12. Update permanent project memory.
13. Audit Definition of Done.
14. Produce formal Handoff.
15. Commit, push, and verify repository CI/governance state before closure.

## Verification Plan

The Work Unit must include, as applicable:

- `gofmt` verification.
- `go vet ./...`.
- `go test ./...`.
- `go build ./...`.
- Runtime startup verification.
- Graceful shutdown verification.
- Configuration failure-path verification.
- PostgreSQL connectivity verification against the W00-WU02 local platform.
- Secret/configuration review.
- Dependency review.
- Git diff/status verification.
- GitHub repository verification after push.

## Definition of Done

Definition of Done will be evaluated against `templates/DEFINITION_OF_DONE.md`.

Any item considered not applicable must have an explicit reason.

W00-WU03 must not be marked COMPLETE until:

- all applicable acceptance criteria pass,
- all applicable verification passes,
- security review passes,
- permanent project memory is updated,
- a formal Handoff exists,
- the implementation is committed and pushed,
- final repository state is verified.

## Handoff

A formal Handoff will be created under `handoffs/` when W00-WU03 reaches closure readiness.

## Implementation Evidence

- Core repository: `atlazora-core`.
- Core implementation commit: `1431a5cb3f124c3c4f12b183d80aff3eeae1a982`.
- Commit message: `feat(core): establish W00-WU03 Go Core foundation`.
- Commit pushed to `origin/main` and local/remote HEAD equality verified.
- Core working tree verified clean after push.
- 34 foundation files committed with 950 insertions.
- Go module: `github.com/atlazora/atlazora-core`.
- Go toolchain baseline: Go 1.27.x.
- PostgreSQL driver: `github.com/jackc/pgx/v5` pinned at `v5.9.2`.

## Final Verification Evidence

- `go fmt ./...`: PASS.
- `go vet ./...`: PASS.
- `go test ./... -count=1`: PASS.
- `go build ./...`: PASS.
- API process build: PASS.
- Worker process build: PASS.
- Configuration success/failure-path tests: PASS.
- Structured JSON logging tests: PASS.
- Lifecycle cancellation tests: PASS.
- PostgreSQL database package tests: PASS.
- Local PostgreSQL connectivity against W00-WU02: PASS.
- API runtime startup against PostgreSQL: PASS.
- API `GET /health/live`: HTTP 200 with `{"status":"ok"}`.
- Worker runtime startup against PostgreSQL: PASS.
- API graceful Ctrl+C shutdown: PASS.
- Worker graceful Ctrl+C shutdown: PASS.
- PostgreSQL error sanitization regression tests: PASS.
- Real governed PostgreSQL password repository scan: zero matches.
- Forbidden WU03 scope artifact count: zero.
- All 12 approved Core domain boundaries staged and committed.
- `git diff --cached --check`: PASS before commit.
- Local and remote Core HEAD equality: PASS.

## Security Review Result

- Environment-based secret injection is implemented.
- No real PostgreSQL credential is committed in `atlazora-core`.
- Database configuration and connection errors are sanitized and regression-tested against sentinel credentials.
- Structured logging does not intentionally log runtime configuration objects or database credentials.
- Runtime shutdown is signal-aware and deterministic.
- Dependency footprint remains minimal; pgx is the only direct external module dependency.
- PostgreSQL access foundation remains compatible with least-privilege operation.
- No unresolved blocking Critical/High security issue was identified for W00-WU03.

**Security Review Result:** PASS

## Final Definition of Done Audit

### Product / Domain

- Required domain behavior: N/A — W00-WU03 establishes module boundaries and runtime foundation; business-domain behavior is explicitly out of scope.
- Acceptance criteria: PASS — all W00-WU03 acceptance criteria are satisfied by implementation and verification evidence.

### Data

- Required database changes: N/A — connectivity foundation only; business schemas are explicitly out of scope.
- Required migrations: N/A — migrations are explicitly deferred to domain implementation Work Units.
- Data ownership/source-of-truth rules: PASS — PostgreSQL remains transactional truth and domain ownership remains explicit.

### Contracts

- Required API contracts: N/A — shared executable contracts belong to W00-WU04 and `atlazora-contracts`.
- Required shared schemas: N/A — shared schemas belong to W00-WU04.
- Compatibility/versioning impact: PASS — W00-WU03 introduces no shared executable external contract.

### Security

- Authorization: N/A — no business/user authorization surface is introduced by this foundation Work Unit.
- Input/domain validation: N/A for business inputs; foundational configuration validation is implemented and tested.
- Security review: PASS.
- Blocking Critical/High security issues: PASS — none identified.

### Reliability / Distributed Behavior

- Required events: N/A — event foundation belongs to W00-WU05.
- Transactional Outbox: N/A — implementation belongs to W00-WU05.
- Idempotency: N/A — no duplicate-effect business operation is introduced.
- Error/retry behavior: PASS where applicable — startup/configuration/database failure behavior is deterministic; distributed retry policy is not introduced in this Work Unit.

### User Experience

- Web UI: N/A — belongs to W00-WU07.
- Admin/Operations UI: N/A — belongs to W00-WU08.
- UI states: N/A — no user-facing UI is introduced.

### Tests

- Required unit tests: PASS.
- Required integration tests: PASS — PostgreSQL connectivity and runtime integration were locally verified.
- Required contract tests: N/A — no shared executable contract is introduced.
- Required E2E tests: N/A — no end-user business flow is introduced.
- Regression coverage: PASS — configuration, logging, lifecycle, and database-secret/error behavior are covered appropriate to WU03 risk.

### Operations

- Required observability: PASS for WU03 scope — structured JSON logging and foundational health visibility are implemented; full observability belongs to W00-WU11.
- Required audit trail: N/A — no business mutation/audit capability is introduced.
- Operational/support procedures: PASS — repository README documents build, test, configuration, API/Worker execution, PostgreSQL connectivity, health, and shutdown.
- Deployment/migration/rollback impact: PASS — no production deployment or migration is introduced; WU03 is a foundational repository root commit.

### Engineering Quality

- Documentation updated: PASS.
- CI: N/A for `atlazora-core` at this stage — full CI/CD and supply-chain implementation belongs to W00-WU10; local mandatory verification passed. Governance closure CI remains required before final COMPLETE.
- Blocking P0/P1 bugs: PASS — none identified.
- Blocking Critical/High security issues: PASS — none identified.
- Relevant code/configuration review: PASS.

### Project Memory

- `PROJECT_STATE.md`: pending final COMPLETE transition after closure-candidate Governance Validation.
- Relevant ADRs: PASS — existing Accepted ADRs were sufficient; no new ADR was required.
- Relevant Phase/Wave/Work Unit documentation: PASS for closure candidate.
- Formal Handoff: PASS — `handoffs/W00-WU03-final-handoff.md` created as the final handoff record, subject to final closure evidence.

### Performance / Resilience

- Performance verification: N/A — no performance-sensitive business workload or SLO is introduced by WU03.
- Resilience/failure-path verification: PASS — missing configuration, failed database connection, signal cancellation, and graceful process shutdown were verified.
- Backup/restore or disaster-recovery impact: N/A — WU03 introduces no recoverability policy or production data lifecycle.

**Final Definition of Done Audit Result:** PASS

Final COMPLETE remains gated on committing/pushing this governance closure candidate and successful Governance Validation.

### Final Governance Closure Evidence

- Closure-candidate governance commit: 6d6cfe3467b961faf30388917b7598ba8db37554
- Governance Validation run: 33643588775
- Governance Validation status: completed
- Governance Validation conclusion: success
- Core implementation commit: 1431a5cb3f124c3c4f12b183d80aff3eeae1a982
- Final Work Unit status: COMPLETE
- Completion Date: 2026-09-02
