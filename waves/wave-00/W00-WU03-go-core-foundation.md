# W00-WU03 — Go Core Foundation

- **Wave:** W00 — Engineering Foundation
- **Status:** IN_PROGRESS
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

- [ ] `atlazora-core` is initialized as a valid Go module.
- [ ] The repository has an approved modular project structure.
- [ ] Core domain/module boundaries are represented without creating independent services or repositories.
- [ ] The project builds successfully.
- [ ] All Go source is formatted.
- [ ] `go vet ./...` passes.
- [ ] `go test ./...` passes.
- [ ] Core runtime can start successfully.
- [ ] Core runtime supports controlled graceful shutdown.
- [ ] Foundational configuration loading is implemented and tested.
- [ ] Foundational structured logging is implemented.
- [ ] PostgreSQL connectivity foundation is implemented and locally verified.
- [ ] PostgreSQL remains the transactional source of truth.
- [ ] No business-domain schema or business feature is prematurely implemented.
- [ ] No shared executable API/event contract is duplicated from `atlazora-contracts`.
- [ ] No Transactional Outbox implementation is prematurely absorbed from W00-WU05.
- [ ] Security review for this Work Unit passes.
- [ ] Repository documentation provides reproducible build/test/run instructions.
- [ ] Project-memory documentation is updated with final implementation and verification state.
- [ ] Formal Handoff is produced before COMPLETE.

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
