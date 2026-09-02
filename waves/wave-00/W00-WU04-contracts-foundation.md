# W00-WU04 Ã¢â‚¬â€ Contracts Foundation

- **Phase:** Phase 09 Ã¢â‚¬â€ Implementation Roadmap
- **Wave:** W00 Ã¢â‚¬â€ Engineering Foundation
- **Work Unit:** W00-WU04
- **Status:** IN_PROGRESS
- **Primary Repository/Repositories:** `atlazora-contracts`, `atlazora-project`
- **Owner:** Atlazora
- **Last Updated:** 2026-09-02

## Objective

Establish the shared, versioned, executable contract foundation for Atlazora so synchronous APIs, asynchronous events, and shared platform data conventions can evolve through explicit validation and compatibility controls.

## Scope

### In Scope

- Establish the `atlazora-contracts` repository baseline.
- Establish versioned OpenAPI contract structure.
- Establish API versioning conventions.
- Establish common API error contract conventions.
- Establish pagination contract conventions.
- Establish shared money representation conventions.
- Establish shared identifier representation conventions.
- Establish timestamp representation conventions.
- Establish structured and versioned event contract foundations.
- Resolve and document the foundational event envelope.
- Resolve and document the foundational event identifier convention.
- Establish machine-readable shared schemas where appropriate.
- Establish schema and contract validation.
- Establish compatibility and breaking-change checks.
- Establish developer documentation for contract authoring and evolution.
- Establish automated contract verification suitable for normal engineering workflow.
- Preserve authoritative domain ownership and approved architecture boundaries.

### Out of Scope

- Transactional Outbox implementation.
- Event publisher runtime implementation.
- Event consumer runtime implementation.
- Retry and idempotent-consumption implementation owned by W00-WU05.
- Selection of the final event broker/provider.
- Business-domain feature APIs belonging to later feature Work Units.
- Business-domain event catalogs that do not yet exist.
- Microservice decomposition.
- Python Intelligence implementation.
- Web or Admin implementation.
- Infrastructure provisioning.
- Full CI/CD and supply-chain foundation owned by W00-WU10.

## Dependencies

- W00-WU01 Ã¢â‚¬â€ Project Governance & Repositories: COMPLETE.
- W00-WU02 Ã¢â‚¬â€ Local Development Platform: COMPLETE.
- W00-WU03 Ã¢â‚¬â€ Go Core Foundation: COMPLETE.
- W00-WU03 Final Handoff: COMPLETE.
- Official `atlazora-contracts` repository is available.
- Approved architecture and planning sources are available.

## Relevant ADRs

- ADR-0010 Ã¢â‚¬â€ REST and OpenAPI Versioned Contracts.
- ADR-0021 — Testing & Security in Every Work Unit.
- ADR-0026 — Contract Specifications and Validation Toolchain (Accepted).
- ADR-0027 — CloudEvents Envelope and Event Identifier Convention (Accepted).
- ADR-0028 — Shared API and Platform Contract Conventions (Accepted).
- Existing Accepted ADRs apply where relevant.
- New material engineering decisions must use the ADR process.

## Contracts

W00-WU04 owns the shared executable contract foundation.

Known contract categories:

- versioned OpenAPI definitions.
- shared API error structures.
- pagination conventions.
- money representation.
- identifier representation.
- timestamp representation.
- structured and versioned event schemas.
- event envelope.
- event identifier convention.
- shared machine-readable schemas.
- compatibility and breaking-change policy.

REST/OpenAPI remains the approved synchronous direction.

Shared API and event schemas belong in `atlazora-contracts`.

## Security Considerations

- Contracts must not expose secrets or sensitive implementation details.
- Authentication and authorization requirements must be representable where applicable.
- Contract-defined inputs must support explicit validation.
- Examples and fixtures must not contain real credentials or secrets.
- Contract evolution must not silently weaken security requirements.
- New contract tooling or dependencies require appropriate security review.

## Acceptance Criteria

- [ ] `atlazora-contracts` repository baseline is established.
- [ ] Versioned OpenAPI structure exists and validates.
- [ ] API versioning conventions are explicit.
- [ ] Shared error conventions are explicit and machine-readable where appropriate.
- [ ] Pagination conventions are explicit.
- [ ] Money representation is explicit and safe.
- [ ] Identifier conventions are explicit.
- [ ] Timestamp conventions are explicit.
- [ ] Event schemas are structured and versioned.
- [ ] Event envelope is explicitly defined.
- [ ] Event identifier convention is explicitly defined.
- [ ] Shared schemas are machine-readable where applicable.
- [ ] Contract/schema validation is automated.
- [ ] Compatibility and breaking-change detection is implemented.
- [ ] Invalid fixtures fail verification.
- [ ] Compatible evolution passes verification.
- [ ] Breaking evolution is detected.
- [ ] Contract authoring and evolution are documented.
- [ ] W00-WU05 boundaries remain preserved.
- [ ] No event broker is selected without an approved decision.
- [ ] Security review passes.
- [ ] Required contract checks pass.
- [ ] Project memory is updated.
- [ ] Formal Handoff is produced before COMPLETE.

## Definition of Ready

Before execution:

- [x] Objective is clear.
- [x] Scope is clear.
- [x] Dependencies are complete/resolved.
- [x] Relevant ADRs are available.
- [x] Acceptance criteria are clear and testable.
- [x] Repositories to be changed are known.
- [x] Security considerations are known.
- [x] Contracts are known enough to begin safely.
- [x] Previous required Handoff is complete.
- [x] Official `atlazora-contracts` repository is available.
- [x] Contract ownership is explicit.
- [x] OpenAPI synchronous-contract direction is approved.
- [x] Event contract ownership and architecture boundaries are documented.
- [x] W00-WU05 implementation boundaries are explicit.

**Definition of Ready Result:** PASS

## Tasks

1. Establish `atlazora-contracts` repository baseline.
2. Establish repository documentation and contribution conventions.
3. Establish versioned OpenAPI structure.
4. Establish API versioning conventions.
5. Establish shared API error contract.
6. Establish pagination conventions.
7. Establish money representation.
8. Establish identifier conventions.
9. Establish timestamp conventions.
10. Establish event schema/versioning conventions.
11. Resolve and document event envelope.
12. Resolve and document event identifier convention.
13. Establish shared schema structure.
14. Establish validation tooling.
15. Establish compatibility and breaking-change verification.
16. Add valid, invalid, compatible, and breaking fixtures.
17. Add repository-local verification commands.
18. Add contracts-repository CI validation.
19. Perform security and dependency review.
20. Verify W00-WU05 scope separation.
21. Update permanent project memory.
22. Audit Definition of Done.
23. Produce formal Handoff.
24. Commit, push, and verify CI/governance before closure.

## Verification Plan

- OpenAPI validation.
- Shared schema validation.
- Event schema validation.
- Versioning verification.
- Compatibility verification.
- Breaking-change detection.
- Positive fixtures.
- Negative fixtures.
- Compatible-evolution fixtures.
- Breaking-evolution fixtures.
- Security review.
- Dependency/tooling review.
- Secret scan.
- Git diff/status verification.
- GitHub repository verification.
- CI contract validation.

## Definition of Done

Definition of Done will be evaluated against `templates/DEFINITION_OF_DONE.md`.

Any N/A item must have an explicit reason.

W00-WU04 must not be marked COMPLETE until all applicable acceptance criteria, validation, compatibility checks, security review, documentation, project-memory, and Handoff requirements pass.

## Handoff

A formal Handoff is required before changing status to `COMPLETE`.
