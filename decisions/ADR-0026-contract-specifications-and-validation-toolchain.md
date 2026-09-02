# ADR-0026 — Contract Specifications and Validation Toolchain

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 06 / Phase 09 / Phase 10
- **Related Wave(s):** W00
- **Related Work Unit(s):** W00-WU04

## Context

ADR-0010 established REST APIs with versioned OpenAPI contracts for externally meaningful synchronous interfaces and established `atlazora-contracts` as the owner of shared API definitions.

W00-WU04 must now establish an executable contracts repository with explicit specification versions, schema conventions, validation, compatibility checking, and breaking-change detection.

The approved planning baseline does not currently prescribe:

- an exact OpenAPI Specification minor/patch version.
- an exact JSON Schema dialect.
- an OpenAPI linting and bundling tool.
- an OpenAPI compatibility and breaking-change tool.

These are material engineering choices because they affect repository structure, CI behavior, contract authoring, consumer compatibility, dependency management, and future upgrades.

The local Engineering Foundation environment already provides Node.js/npm and Docker. Contract-specific tools are not currently installed globally.

## Decision

The proposed W00-WU04 contract specification and validation baseline is:

1. OpenAPI contracts use OpenAPI Specification 3.1, with new W00-WU04 root descriptions declaring `openapi: 3.1.2`.
2. Standalone shared JSON Schemas use JSON Schema Draft 2020-12 and declare their schema dialect explicitly.
3. YAML is the preferred human-authored representation for OpenAPI root descriptions unless a specific machine-generated artifact requires JSON.
4. JSON Schema files use JSON where practical so schema dialect and machine-readable structures remain explicit and unambiguous.
5. Redocly CLI is the proposed primary OpenAPI linting and bundling tool.
6. `oasdiff` is the proposed OpenAPI compatibility and breaking-change detection tool.
7. Ajv `8.20.0` is the proposed repository-local validator for standalone JSON Schema Draft 2020-12 contracts, including shared schemas and event-envelope/event-payload schemas. Draft 2020-12 validation uses the Ajv 2020-specific implementation rather than relying on the default draft-07 validator behavior.
8. JSON Schema compatibility checks use an explicit conservative Atlazora compatibility policy implemented by repository-local verification scripts and executable fixtures. The policy must detect at least the breaking-change classes required by W00-WU04 and must not claim mathematically complete compatibility analysis for arbitrary JSON Schema constructs.
9. For shared/event schemas, prohibited breaking changes include at minimum removal or renaming of previously available required or semantically established properties, incompatible type changes, new required properties that invalidate previously valid producer payloads, enum narrowing that rejects previously valid values, and equivalent constraint tightening that rejects previously valid instances. Compatible fixtures must demonstrate permitted additive evolution such as new optional properties where the applicable contract permits them.
10. Compatibility direction must support non-atomic producer/consumer rollout: a new contract revision must not silently invalidate payloads that were valid under the compatibility baseline when backward-compatible evolution is required.
11. Tool versions used by the repository and CI must be explicitly pinned rather than depending on mutable `latest` resolution or globally installed developer tools.
12. Repository-local verification commands must produce non-zero exit status for invalid contracts or prohibited breaking changes.
13. CI must execute the same contract validation and compatibility rules used by repository-local verification.
14. Specification or tool upgrades are explicit reviewed changes and must not occur silently through floating dependency versions.

This decision does not select an event transport, event broker, event serialization transport format, or runtime event-publishing implementation.

The event envelope and event identifier convention remain a separate W00-WU04 architectural decision.

## Rationale

OpenAPI 3.1 provides mature tooling support while aligning its Schema Object model with the JSON Schema vocabulary model more closely than OpenAPI 3.0.

Using OpenAPI 3.1.2 provides a stable 3.1 contract baseline while avoiding unnecessary dependence on OpenAPI 3.2 features before the required toolchain is consistently mature across all relevant operations.

JSON Schema Draft 2020-12 is the current published JSON Schema specification baseline and supports explicit reusable machine-readable shared schemas.

Redocly CLI provides OpenAPI validation/linting and bundling suitable for local development and CI.

`oasdiff` provides purpose-built OpenAPI change analysis and breaking-change detection suitable for OpenAPI compatibility gates.

Ajv provides explicit JSON Schema Draft 2020-12 validation for standalone shared and event schemas. Using a pinned repository-local Ajv dependency avoids depending on developer-global tooling and ensures the selected JSON Schema dialect is validated consistently.

Generic JSON Schema compatibility is more expressive than OpenAPI path/operation compatibility and cannot be treated as completely solved by OpenAPI diff tooling. Atlazora therefore uses a documented conservative compatibility policy plus positive, negative, compatible-evolution, and breaking-evolution fixtures for the shared/event schema boundary.

Pinning repository tooling improves reproducibility, supply-chain reviewability, and consistency between developer machines and CI.

Separating event-envelope semantics from specification/tooling selection keeps architectural decisions focused and prevents a tooling ADR from silently defining cross-domain event semantics.

## Alternatives Considered

### OpenAPI 3.2 as the Initial Baseline

Not selected for the initial proposal.

OpenAPI 3.2 is the newest published OpenAPI specification and has growing tool support. However, support is not yet equally mature across every relevant ecosystem operation.

Atlazora does not currently require a 3.2-specific feature for W00-WU04.

A future reviewed upgrade may adopt OpenAPI 3.2 when the compatibility benefit and tooling maturity justify it.

### OpenAPI 3.0

Not selected.

OpenAPI 3.0 has broad ecosystem support, but its schema behavior is less aligned with modern JSON Schema semantics than OpenAPI 3.1.

Starting a new contract foundation on 3.0 would introduce avoidable schema-model differences.

### No Explicit OpenAPI Patch Version

Not selected.

Although OpenAPI tooling generally treats patch releases within a minor feature set as compatible, the repository should remain explicit and reproducible about the specification declared by its root descriptions.

### JSON Schema Draft 7

Not selected.

It remains widely implemented but is not the current JSON Schema specification baseline for a new shared-schema foundation.

### Spectral as the Primary OpenAPI Linter

A credible alternative.

Spectral provides flexible API linting, but W00-WU04 also needs bundling and OpenAPI-oriented repository workflows. Redocly CLI provides both linting and bundling within one proposed toolchain.

This does not prohibit future use of Spectral if a later requirement justifies it.

### Validation Without Dedicated Compatibility Analysis

Rejected.

Schema validity alone does not determine whether a contract evolution breaks existing consumers.

ADR-0010 and W00-WU04 explicitly require compatibility-aware evolution and breaking-change checks.

### Globally Installed Contract Tools

Rejected as the repository baseline.

Global installations produce inconsistent developer and CI environments and weaken reproducibility.

## Consequences

### Positive

- Explicit OpenAPI and JSON Schema baselines.
- Reproducible contract tooling.
- Shared local and CI validation behavior.
- Automated detection of OpenAPI breaking changes.
- Mature tooling baseline without requiring premature OpenAPI 3.2 adoption.
- Clear upgrade path through reviewed changes.
- Reduced dependency on developer-global tooling.

### Negative / Trade-offs

- Repository tooling dependencies must be maintained and periodically upgraded.
- OpenAPI 3.2 features cannot be used until an explicit upgrade decision/change is made.
- More than one validation mechanism is required because lint/schema validation and compatibility analysis solve different problems.
- Tool upgrades may introduce new lint or compatibility findings that require review.

## Security Impact

Contract tooling is part of the engineering supply chain and must use pinned, reviewed versions.

Examples and fixtures must not contain real credentials, secrets, or sensitive implementation data.

OpenAPI contracts must represent applicable authentication and authorization requirements without exposing sensitive implementation details.

Validation must fail malformed or structurally unsafe contract inputs where applicable.

Dependency upgrades must receive the security review required by ADR-0021 and W00-WU04.

## Data / Migration Impact

This decision does not change transactional data ownership or source-of-truth rules.

Shared schema evolution must remain compatibility-aware where existing producers, consumers, clients, or migration paths depend on previous contract versions.

Breaking contract transitions must not assume all producers and consumers update atomically.

## Operational Impact

Repository-local validation and compatibility commands become part of normal contract development.

CI will enforce contract validity and compatibility using pinned tooling.

Tool or specification upgrades require explicit review, validation, and compatibility verification.

The toolchain must remain usable without relying on global developer-machine installations.

## Related Decisions

- ADR-0010 — REST and OpenAPI Versioned Contracts
- ADR-0011 — Multi-Repository Strategy
- ADR-0021 — Testing and Security Integrated Into Every Work Unit
- ADR-0022 — Git as Permanent Project Memory

## Supersession

None.
