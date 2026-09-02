# W00-WU02 — Local Development Platform

- **Phase:** Phase 09 — Implementation Roadmap / execution foundation
- **Wave:** W00 — Engineering Foundation
- **Work Unit:** W00-WU02
- **Status:** REVIEW
- **Primary Repository:** `atlazora-project`
- **Supporting Repositories:** target application repositories consume the local platform in subsequent W00 Work Units
- **Owner:** Atlazora
- **Last Updated:** 2026-09-02

## Objective

Establish a reproducible, secure, and documented local development platform for Atlazora that provides the shared infrastructure dependencies required by subsequent Engineering Foundation Work Units without prematurely implementing application foundations owned by those Work Units.

The platform must reflect approved architectural boundaries sufficiently for meaningful local integration while remaining lightweight enough for routine developer use.

## Scope

### In Scope

- Establish Docker Compose as the local shared dependency orchestration mechanism.
- Establish local PostgreSQL.
- Establish local Redis.
- Establish local S3-compatible object storage.
- Provide deterministic local configuration defaults suitable only for development.
- Provide environment-variable/example configuration without committing real secrets.
- Provide health checks for local dependencies.
- Provide repeatable commands/scripts for:
  - platform startup
  - platform status
  - platform shutdown
  - platform reset
- Persist PostgreSQL and object-storage development data through named local volumes where appropriate.
- Treat Redis state as disposable/ephemeral.
- Establish local network/service naming conventions needed by later W00 Work Units.
- Document host-access and container-network connection information.
- Establish automated validation appropriate to the local-platform configuration.
- Verify clean bootstrap and dependency health.
- Verify restart behavior.
- Verify destructive reset behavior.
- Update permanent Git project memory and produce a formal Handoff.

### Out of Scope

- Go Core application foundation.
- Python Intelligence application foundation.
- Vue Web foundation.
- Vue Admin foundation.
- OpenAPI/shared contract implementation.
- Transactional Outbox implementation.
- Event broker selection or implementation.
- Search engine/provider selection or implementation.
- Kubernetes local-development cluster.
- GKE provisioning.
- GCP resource provisioning.
- Terraform implementation belonging to W00-WU09.
- Development, Staging, or Production environment provisioning.
- CI/CD and software-supply-chain foundation belonging to W00-WU10.
- full observability foundation belonging to W00-WU11.
- application security baseline belonging to W00-WU12.
- physical business database schemas or migrations.
- production credentials or secrets.

## Dependencies

- W00-WU01 — Project Governance & Repositories is COMPLETE.
- W00-WU01 Final Handoff exists.
- `PROJECT_STATE.md` identifies W00-WU02 as READY before execution.
- Docker Engine with Docker Compose support must be available on the development workstation.
- Relevant Accepted ADRs and architecture documentation are available.

## Relevant ADRs

Directly applicable:

- ADR-0007 — PostgreSQL as Transactional Source of Truth
- ADR-0011 — Multi-Repository Strategy
- ADR-0015 — S3-Compatible Object Storage Abstraction
- ADR-0016 — Redis Is Ephemeral Only
- ADR-0021 — Testing and Security Integrated Into Every Work Unit
- ADR-0022 — Git as Permanent Project Memory

Architectural constraints relevant to future consumers:

- ADR-0003 — Go Transactional Core
- ADR-0004 — Python Intelligence Boundary
- ADR-0005 — Vue 3 and TypeScript for Web and Admin
- ADR-0006 — Modular Architecture First, Progressive Microservices
- ADR-0008 — Transactional Outbox From Day One
- ADR-0009 — Idempotency From Day One
- ADR-0010 — REST and OpenAPI Versioned Contracts
- ADR-0013 — Terraform / Infrastructure as Code
- ADR-0014 — Managed Production Data Services
- ADR-0017 — Search Is Derived and Rebuildable
- ADR-0018 — Build Once, Promote Immutable Artifacts

## Contracts

No application API, OpenAPI schema, business event schema, or shared application contract is implemented by W00-WU02.

The local platform establishes infrastructure connection boundaries consumed by later Work Units.

The exact event broker and exact Search provider/deployment remain unresolved and are not selected by this Work Unit.

## Security Considerations

- No real secret may be committed to Git.
- Local credentials must be explicitly development-only.
- Example/default local credentials must never be reused for managed environments.
- Local services must not be treated as Production security configuration.
- Dependency exposure to the host must be limited to what local development requires.
- PostgreSQL remains authoritative transactional storage.
- Redis must contain no irreplaceable authoritative state.
- Object storage must preserve the S3-compatible application boundary.
- Destructive reset operations must be explicit.
- No Production, Staging, Development-cloud, or provider credential is required by this Work Unit.
- Security verification is part of completion.

## Acceptance Criteria

- [x] Docker/Compose prerequisite is verified and documented.
- [x] Local platform configuration is version controlled.
- [x] PostgreSQL starts successfully.
- [x] PostgreSQL has a working health check.
- [x] PostgreSQL local persistence uses an explicit local volume.
- [x] Redis starts successfully.
- [x] Redis has a working health check.
- [x] Redis is explicitly treated as ephemeral and non-authoritative.
- [x] S3-compatible local object storage starts successfully.
- [x] Object storage has a working health check.
- [x] Object-storage local persistence is explicitly defined where appropriate.
- [x] Local services use explicit predictable service names/networking.
- [x] Host connection information is documented.
- [x] Container-network connection information is documented.
- [x] Development-only configuration is separated from real secrets.
- [x] No real secret is committed.
- [x] A repeatable startup command/script exists.
- [x] A repeatable status/health command/script exists.
- [x] A repeatable shutdown command/script exists.
- [x] An explicit destructive reset command/script exists.
- [x] Clean bootstrap from an empty local platform state succeeds.
- [x] All required dependency health checks pass after bootstrap.
- [x] Normal shutdown and restart succeed.
- [x] Destructive reset and subsequent clean bootstrap succeed.
- [x] Configuration validation is automated where appropriate.
- [x] Local development documentation is complete.
- [ ] Applicable CI/governance validation is green.
- [x] No unresolved blocking P0/P1 bug remains.
- [x] No unresolved blocking Critical/High security issue remains.
- [x] `PROJECT_STATE.md` is updated.
- [x] Formal W00-WU02 Final Handoff is written.
- [x] Final Definition of Done audit passes.

## Definition of Ready

- [x] Objective is clear.
- [x] Scope is clear.
- [x] Dependencies required to begin are complete or explicitly identified.
- [x] Relevant ADRs are available.
- [x] Acceptance criteria are clear and testable.
- [x] Repository to be changed is known.
- [x] Security considerations are known.
- [x] Contracts are known enough to begin safely.
- [x] Previous required Handoff is complete.

**Definition of Ready Result:** PASS

W00-WU02 transitions from `READY` to `IN_PROGRESS` when this implementation baseline is created and execution begins.

## Tasks

- [x] Verify workstation Docker/Compose prerequisites.
- [x] Establish local-platform directory/configuration structure.
- [x] Implement PostgreSQL local dependency.
- [x] Implement Redis local dependency.
- [x] Implement S3-compatible local object-storage dependency.
- [x] Implement health checks.
- [x] Implement local lifecycle commands/scripts.
- [x] Implement safe local configuration/example environment handling.
- [x] Document connection and operating procedures.
- [x] Add applicable automated validation.
- [x] Execute clean-bootstrap verification.
- [x] Execute restart verification.
- [x] Execute destructive-reset verification.
- [x] Perform security/configuration review.
- [x] Update project memory.
- [x] Perform final Definition of Done audit.
- [x] Write Final Handoff.

## Verification Plan

Verification must include evidence for:

1. Docker Engine availability.
2. Docker Compose availability.
3. Compose configuration validation.
4. clean platform startup.
5. PostgreSQL healthy state.
6. Redis healthy state.
7. S3-compatible object-storage healthy state.
8. PostgreSQL connectivity.
9. Redis connectivity.
10. S3-compatible endpoint availability.
11. normal shutdown.
12. restart with expected persistent local state behavior.
13. explicit destructive reset.
14. successful bootstrap after reset.
15. Git secret/configuration review.
16. applicable repository validation/CI.

Exact verification commands are recorded as implementation is established.

## Definition of Done

W00-WU02 must be evaluated against `templates/DEFINITION_OF_DONE.md`.

Application-domain, API, event, UI, and application authorization items are expected to be N/A unless implementation scope changes.

Infrastructure configuration, security, tests/verification, documentation, CI, resilience/failure behavior, project memory, and Handoff requirements are applicable.

Any N/A item requires an explicit reason in the final audit.

## Handoff

A formal `handoffs/W00-WU02-final-handoff.md` is required before changing W00-WU02 to `COMPLETE`.

The Handoff must record:

- implemented local services
- configuration/layout
- lifecycle commands
- connection information
- verification evidence
- security considerations
- known limitations
- deferred decisions
- exact starting point for W00-WU03

## Current Verification Evidence

### Docker / Compose Prerequisite

Verified on 2026-09-02:

- Docker Desktop: `4.87.0`
- Docker Client: `29.7.2`
- Docker Engine: `29.7.2`
- Docker Engine OS: Linux
- Docker Engine architecture: `x86_64`
- Docker context: `desktop-linux`
- Docker Compose: `v5.4.0`
- `hello-world` container pull/create/run smoke test: PASS

Docker Engine and Docker Compose are available and operational for W00-WU02 implementation.
