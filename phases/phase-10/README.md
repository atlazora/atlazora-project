# Phase 10 — Testing & Security

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 10 defines the approved testing and security model for Atlazora.

Testing and security are engineering responsibilities from W00 and throughout every applicable Work Unit.

They are not final-stage hardening activities.

The authoritative preserved planning source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Core Principle

Every capability must be tested and secured according to its actual risk.

A Work Unit is not complete merely because its happy path works.

Applicable correctness, authorization, isolation, failure handling, security, resilience, observability, and regression behavior are part of the capability.

## Test Layers

The approved testing model progresses through complementary layers:

1. Unit tests
2. Integration tests
3. Contract tests
4. End-to-End tests
5. Performance tests where applicable
6. Resilience/failure tests where applicable

The layers are complementary rather than interchangeable.

A large E2E suite does not replace domain/unit/integration coverage.

Unit tests do not replace real persistence/integration verification.

## Unit Testing

Unit tests should verify isolated domain and application behavior where external infrastructure is not required.

Important coverage includes:

- business rules.
- invariants.
- validation.
- state transitions.
- authorization decisions where appropriately isolated.
- calculations.
- failure branches.
- idempotency-related pure behavior where applicable.

Tests should emphasize meaningful behavior rather than line-count metrics alone.

## Integration Testing

Integration tests verify behavior across real integration boundaries.

For the Go transactional Core, important persistence behavior should be tested against real PostgreSQL rather than relying only on mocked database behavior.

Applicable integration coverage includes:

- database constraints.
- transactions.
- migrations.
- repositories/persistence.
- Transactional Outbox.
- idempotency persistence.
- concurrency-sensitive behavior.
- provider adapters.
- object storage boundaries.
- cache/search integration where required.
- worker behavior.

## Contract Testing

Versioned contracts are tested as first-class engineering artifacts.

Applicable contract verification includes:

- OpenAPI compatibility.
- request/response schemas.
- shared schemas.
- event schemas.
- event versioning.
- producer/consumer compatibility.
- error contract behavior.
- required headers/metadata where defined.

Breaking compatibility must not be introduced silently.

## End-to-End Testing

E2E tests verify important user and operational journeys through deployed application surfaces.

Applicable journeys include:

- authentication.
- organization membership/authorization.
- supplier onboarding.
- catalog/offer publication.
- discovery.
- RFQ/Quote.
- Sample.
- Order.
- Payment.
- fulfillment.
- inspection.
- dispute.
- review.
- monetization.
- Admin/Ops workflows.

E2E coverage should focus on high-value journeys and release confidence rather than attempting to express every low-level rule through browser automation.

## Technology Testing Baseline

### Go

Use Go-native testing for unit behavior.

Use real PostgreSQL integration testing for persistence and transaction behavior where applicable.

Exact supporting test libraries may be selected in the appropriate Work Unit.

### Python

Python intelligence/data repositories use `pytest` as the approved testing direction.

Linting and static/type analysis are required.

Ruff and a Python type checker such as mypy or Pyright are approved candidates/baseline tools; the exact overlapping tool choice remains an implementation decision until formally selected.

### Vue 3 + TypeScript

Web and Admin require:

- TypeScript type checking.
- ESLint or the approved linting equivalent.
- unit/component testing.
- E2E browser testing.

Playwright is the approved E2E direction/candidate baseline.

Exact unit/component test libraries are finalized in the relevant W00 Work Units.

## Authorization and Organization Isolation

Authentication success does not prove authorization correctness.

Security tests must explicitly verify User/Organization boundaries and domain-specific authority.

Applicable tests include:

- user cannot access another organization without membership/authority.
- member roles cannot exceed granted permissions.
- removed/restricted membership loses applicable authority.
- supplier/buyer capability follows organization/domain rules rather than account labels.
- Admin/Ops authority is explicitly controlled.
- object/document access respects classification and organization/domain ownership.
- API authorization is enforced server-side regardless of UI visibility.

Organization isolation is a security boundary and requires dedicated regression coverage.

## Administrative Security

Admin/Operations capability requires stronger scrutiny because of privileged impact.

Applicable tests include:

- role/permission enforcement.
- sensitive action authorization.
- audit attribution.
- privileged workflow validation.
- prevention of direct database shortcuts.
- restricted access to sensitive files/data.
- high-impact action review where required.

## Authentication Security

Applicable authentication security coverage includes:

- session/token validity.
- expiration.
- revocation behavior where supported.
- invalid credentials.
- brute-force/abuse controls where applicable.
- privilege changes.
- sensitive account recovery/change flows.
- secure secret/token handling.

Exact authentication implementation is resolved in its owning Work Unit.

## Input and Domain Validation

Validation occurs at trusted server/domain boundaries.

Client-side validation improves UX but is not the authoritative security boundary.

Tests should cover:

- malformed input.
- unexpected values.
- boundary values.
- invalid state transitions.
- unauthorized object references.
- unsafe file input.
- invalid commercial combinations.
- replay/duplicate requests where applicable.

## File Security

Public, private, and sensitive file classifications must be enforced.

Applicable security testing includes:

- authorization.
- file-type/content validation.
- malicious upload handling.
- access URL behavior.
- sensitive-file exposure.
- retention/deletion behavior where defined.
- auditability.

Malware/security scanning mechanisms are finalized in the relevant implementation Work Unit.

## Payment and Financial Testing

Payment and financial behavior requires failure-oriented testing.

Applicable scenarios include:

- duplicate provider callback.
- delayed callback.
- out-of-order callback.
- provider timeout.
- browser return without authoritative provider confirmation.
- retry after ambiguous failure.
- duplicate payment command.
- refund bounds.
- repeated refund attempt.
- ledger adjustment behavior.
- commission snapshot integrity.
- settlement eligibility.
- reconciliation mismatch.

Provider confirmation remains authoritative according to the approved payment boundary.

Financial corrections must preserve historical/audit integrity rather than silently rewriting history.

## Concurrency and Idempotency

Concurrency-sensitive workflows require explicit verification.

Applicable scenarios include:

- duplicate command.
- simultaneous update.
- stale version/state.
- repeated callback.
- repeated event delivery.
- worker retry.
- competing state transition.
- idempotency-key reuse.
- partial failure between internal and external operations.

Testing must verify outcomes, not merely absence of exceptions.

## Event and Outbox Testing

Applicable event tests include:

- transactional write and outbox consistency.
- publisher retry.
- duplicate event delivery.
- consumer idempotency.
- event schema/version validation.
- reordering where consumers may observe it.
- poison/failing message behavior.
- recovery after temporary dependency failure.
- observability of failed/retried processing.

Exact broker-specific tests are introduced after the broker is formally selected.

## Search Testing

Search is derived and rebuildable.

Applicable tests include:

- indexing from authoritative state.
- update propagation.
- deletion/removal behavior.
- authorization-safe indexing/query behavior.
- stale index behavior.
- rebuild from source of truth.
- search service loss and recovery.

Search results must not become transactional authority.

## Redis / Cache Testing

Redis is ephemeral.

Applicable tests must verify that loss, expiry, eviction, or restart of Redis does not destroy authoritative business state.

The system should recover/rebuild ephemeral state according to the owning capability.

## Localization and UI Testing

Arabic and English are initial supported languages.

Applicable testing includes:

- language switching.
- translation presence.
- RTL/LTR behavior.
- layout integrity.
- localized validation/error presentation.
- money/date/number presentation according to approved conventions.
- loading, empty, error, forbidden, and recovery states.

## Security Analysis Categories

CI and engineering workflows progressively cover appropriate categories including:

- secret scanning.
- dependency/vulnerability scanning.
- static application security analysis.
- container/image scanning.
- Infrastructure as Code scanning.
- API/dynamic security testing where applicable.
- software supply-chain/provenance checks.
- SBOM generation where applicable.

## Security Tooling Baseline / Candidates

Approved candidate/baseline tools include:

- Gitleaks for secret scanning.
- Semgrep for static/security analysis.
- Trivy for dependency/container/image scanning.
- Checkov for Infrastructure as Code scanning.
- mypy or Pyright for Python type analysis.
- Playwright for browser E2E testing.
- OWASP ZAP for applicable dynamic/API security testing.

These names preserve the approved Phase 10 planning baseline.

They are not all immutable architectural commitments.

Exact overlapping tool selection, configuration, replacement, and repository applicability are resolved in the appropriate W00/security/CI Work Units.

A tool may be replaced when there is a documented engineering reason and required security coverage remains satisfied.

## Threat Modeling

Threat modeling is required where risk warrants it.

Explicit review is particularly important for:

- new trust boundaries.
- authentication/authorization changes.
- organization isolation.
- payments/financial boundaries.
- sensitive document/data processing.
- externally exposed services.
- privileged Admin/Ops capabilities.
- new provider integrations.
- infrastructure/network exposure.
- migration/cutover of sensitive or authoritative data.

Architecturally significant security decisions require ADR treatment.

## Abuse Cases

Security review must consider intentional misuse, not only accidental invalid input.

Applicable abuse cases include:

- privilege escalation.
- cross-organization access.
- enumeration.
- replay.
- duplicate financial action.
- upload abuse.
- spam/automation abuse.
- unauthorized administrative action.
- provider callback spoofing.
- manipulation of client-visible state.
- attempts to bypass commercial workflow gates.

Exact fraud/risk controls evolve with the owning domain and evidence.

## Performance Testing

Performance testing is risk-based and introduced before a capability's expected load requires confidence.

Applicable targets include:

- Core API latency/throughput.
- database query behavior.
- search latency.
- worker throughput/backlog.
- event processing.
- high-volume imports/migration.
- Web/Admin critical journeys.

Exact numeric thresholds and capacity targets remain open until formally approved.

Performance tests should establish evidence rather than invent unsupported targets.

## Resilience Testing

Applicable resilience testing includes:

- dependency timeout.
- dependency unavailability.
- retry behavior.
- worker restart.
- duplicate/reordered events.
- cache loss.
- search loss/rebuild.
- database connection interruption.
- external-provider failure.
- partial infrastructure degradation.
- safe recovery after failure.

The system should degrade intentionally rather than corrupt authoritative state.

## Backup / Restore / Disaster-Recovery Verification

Production-readiness testing includes verification of applicable backup, restore, and disaster-recovery procedures.

A backup that has never been restored is not sufficient evidence of recoverability.

Exact numeric RPO/RTO targets remain open until formally approved.

## CI Verification Tiers

Testing/security depth increases through delivery stages.

### Pull Request

Fast feedback appropriate to the changed repository, including applicable:

- lint.
- type checks.
- unit tests.
- focused integration/contract tests.
- secret/security checks.
- dependency/IaC checks.
- build validation.

### Main

Main branch verifies the merged baseline with broader applicable:

- integration.
- contract.
- security.
- build/artifact.
- regression checks.

### Staging

Staging supports deployed-system verification including applicable:

- E2E journeys.
- provider sandbox integrations.
- dynamic/API security testing.
- migration rehearsal.
- performance/resilience testing.
- operational verification.

### Release Candidate

Release Candidate verification applies the release gates required for Production promotion, including applicable:

- critical E2E.
- security findings review.
- migration/cutover readiness.
- rollback readiness.
- backup/restore evidence.
- operational readiness.
- known-risk review.

Exact pipeline partitioning is implemented in W00-WU10 and later environment Work Units.

## Findings Classification

Engineering/security findings must be classified by severity and release impact.

The approved severity vocabulary includes:

- Critical
- High
- Medium
- Low

Bug/execution prioritization separately uses the roadmap P0-P4 model.

Security severity and roadmap priority are related operationally but are not identical concepts.

## Release Gate

An unresolved exploitable Critical security issue blocks Production release.

A Work Unit may not be completed with an unresolved blocking Critical or High security issue.

P0/P1 blocking bugs also prevent Work Unit completion according to Definition of Done.

Other findings require explicit disposition according to severity, exploitability, scope, compensating controls, and release risk.

Security findings must not disappear merely because a release date is desired.

## Observability for Testing and Security

Failures must be diagnosable.

Applicable verification should confirm:

- useful structured logs.
- correlation identifiers where defined.
- failed/retried background work visibility.
- provider integration diagnostics.
- security-relevant audit records.
- metrics/alerts where required.
- no inappropriate sensitive-data leakage through telemetry.

## Data and Privacy in Testing

Production-sensitive data should not be casually copied into lower environments.

Test fixtures and seeded data should be deterministic where practical and must respect privacy/security requirements.

Sensitive test credentials and provider secrets must be handled through approved secret-management mechanisms.

## Regression Strategy

A defect fix should add appropriate regression coverage where practical.

High-risk historical failures should remain protected against recurrence.

Regression tests should exist at the lowest reliable layer that proves the behavior, with higher-level coverage added where business risk justifies it.

## Definition of Done Relationship

Phase 10 does not replace the canonical:

`../../templates/DEFINITION_OF_DONE.md`

The Definition of Done remains the Work Unit completion gate.

Phase 10 provides the approved testing/security model used to determine what coverage is applicable to a Work Unit.

## Explicitly Open Decisions

Phase 10 intentionally does not invent unresolved details.

Open items include:

- exact overlapping security/scanning toolset.
- exact Go supporting test libraries.
- exact Vue unit/component testing libraries.
- exact Python type checker between approved candidates.
- exact coverage thresholds.
- exact performance thresholds.
- exact browser/device matrix.
- exact numeric SLO/RPO/RTO targets.
- exact external penetration-testing scope/timing.
- exact SIEM/security monitoring stack.
- exact WAF product/rules.

These are resolved by the owning Work Unit and through ADRs where architectural.

## Deferred / Evidence-Driven Detail

The approved baseline does not require every advanced testing/security capability to be maximally implemented on Day One.

Depth grows with:

- capability risk.
- external exposure.
- data sensitivity.
- financial impact.
- operational maturity.
- measured load.
- Production readiness.

Foundations required to add that depth safely must exist from the beginning.

## Related Documentation

- `../../architecture/security-architecture.md`
- `../../architecture/event-architecture.md`
- `../../architecture/data-architecture.md`
- `../../architecture/infrastructure.md`
- `../../templates/DEFINITION_OF_DONE.md`
- `../../ROADMAP.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
