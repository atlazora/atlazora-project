# W00-WU01 — Project Governance & Repositories

- **Phase:** Phase 09 — Implementation Roadmap / execution foundation
- **Wave:** W00 — Engineering Foundation
- **Work Unit:** W00-WU01
- **Status:** IN_PROGRESS
- **Primary Repository:** `atlazora-project`
- **Supporting Scope:** GitHub organization and the eight official Atlazora repositories
- **Owner:** Atlazora
- **Last Updated:** 2026-09-02

## Objective

Establish the durable engineering-governance foundation required to execute Atlazora implementation without relying on chat history.

This Work Unit establishes:

- the official repository baseline
- permanent Git-based project memory
- Phase / Wave / Work Unit / Task hierarchy
- Work Unit lifecycle and WIP rules
- Definition of Ready
- Definition of Done
- Handoff standard
- ADR governance and initial Accepted ADR baseline
- project state and roadmap documentation
- GitHub execution governance
- the formal transition point into W00-WU02

## Scope

### In Scope

- Establish exactly eight official repositories.
- Establish `atlazora-project` as the project-memory/governance repository.
- Document planning Phase and execution Wave indexes.
- Establish Work Unit statuses and governance.
- Establish formal Definition of Ready.
- Establish formal Definition of Done.
- Establish Handoff standard.
- Establish ADR lifecycle.
- Formalize already-approved architectural decisions into ADRs.
- Establish `PROJECT_STATE.md`.
- Establish GitHub milestone, issue, label, PR, and Project Board governance.
- Establish initial repository governance/templates as applicable.
- Verify W00-WU01 against its Definition of Done.
- Write the Final Handoff for W00-WU02.

### Out of Scope

- Application feature implementation.
- Identity/organization feature implementation.
- General application repository toolchain implementation belonging to W00-WU02.
- Creating additional microservice repositories.
- Production infrastructure provisioning.
- Dev/Staging/Production deployments.

## Dependencies

- GitHub organization established.
- GitHub organization ownership/security baseline established.
- Dedicated Atlazora Git/SSH identity established.
- GitHub CLI authenticated with required organization/repository access.
- Eight official repositories created.
- Approved planning decisions from Phases 01–13 available as baseline inputs.

## Relevant ADRs

Initial W00-WU01 ADR baseline:

- ADR-0001 — Product and Offer Are Separate Domain Concepts
- ADR-0002 — User and Organization Are Separate Domain Concepts
- ADR-0003 — Go Transactional Core
- ADR-0004 — Python Intelligence Boundary
- ADR-0005 — Vue 3 and TypeScript for Web and Admin
- ADR-0006 — Modular Architecture First, Progressive Microservices
- ADR-0007 — PostgreSQL as Transactional Source of Truth
- ADR-0008 — Transactional Outbox From Day One
- ADR-0009 — Idempotency From Day One
- ADR-0010 — REST and OpenAPI Versioned Contracts
- ADR-0011 — Multi-Repository Strategy
- ADR-0012 — GCP / Dammam / GKE Autopilot
- ADR-0013 — Terraform / Infrastructure as Code
- ADR-0014 — Managed Production Data Services
- ADR-0015 — S3-Compatible Object Storage Abstraction
- ADR-0016 — Redis Is Ephemeral Only
- ADR-0017 — Search Is Derived and Rebuildable
- ADR-0018 — Build Once, Promote Immutable Artifacts
- ADR-0019 — Progressive Semantic Migration
- ADR-0020 — One Source of Truth Per Data Type During Migration
- ADR-0021 — Testing and Security Integrated Into Every Work Unit
- ADR-0022 — Git as Permanent Project Memory

## Contracts

No application API or event contract is implemented by W00-WU01.

Governance establishes that versioned application contracts will live in `atlazora-contracts`.

## Security Considerations

W00-WU01 security scope includes:

- organization ownership continuity
- mandatory organization 2FA baseline
- restricted organization base permissions
- restricted repository creation/deletion/transfer behavior
- dedicated Atlazora SSH identity
- project-specific Git identity
- no secrets committed to Git
- security integrated into Work Unit governance
- no unresolved blocking Critical/High security issue before completion

## Acceptance Criteria

- [x] GitHub organization baseline established.
- [x] Exactly eight official repositories exist.
- [x] Repository responsibilities are documented.
- [x] `atlazora-project` governance structure exists.
- [x] 13 planning Phase directories exist.
- [x] 18 execution Wave directories exist.
- [x] Work Unit hierarchy is documented.
- [x] Work Unit statuses are documented.
- [x] Solo-development WIP rule is documented.
- [x] Definition of Ready is formalized.
- [x] Definition of Done is formalized.
- [x] Handoff standard is formalized.
- [x] ADR lifecycle is formalized.
- [x] 25 approved architectural decisions are formalized as Accepted ADRs.
- [x] Product and architecture baseline documentation exists.
- [x] Detailed approved planning content from Phases 01–13 is sufficiently preserved in Git.
- [x] GitHub labels are configured.
- [x] GitHub W00–W17 milestones are configured.
- [x] GitHub Project Board workflow is configured.
- [x] GitHub issue/PR governance templates are configured as required.
- [x] Initial Git baseline is committed and pushed.
- [x] Repository default branch and governance state are verified.
- [x] Applicable CI/governance validation is green.
- [ ] Final `PROJECT_STATE.md` is updated.
- [ ] Formal W00-WU01 Final Handoff is written.
- [ ] Final Definition of Done audit passes.

## Definition of Ready

- [x] Objective is clear.
- [x] Scope is clear.
- [x] Dependencies required to begin are complete.
- [x] Relevant approved architectural decisions are available.
- [x] Acceptance criteria are clear.
- [x] Repositories are known.
- [x] Security considerations are known.
- [x] Contracts are known enough for this governance Work Unit.
- [x] Previous Handoff is not applicable because this is the first formal Work Unit.

**Definition of Ready Result:** PASS

## Current Verification Evidence

- Exactly 8 official GitHub repositories verified.
- `atlazora-project` local Git identity verified as `atlazorabusiness`.
- Project-specific email verified as `atlazora.business@gmail.com`.
- Dedicated SSH remote verified.
- Default branch verified as `main`.
- 13 Phase directories verified.
- 18 Wave directories verified.
- No empty files remain in the governance repository.
- 22 ADR files verified.
- All 22 ADRs verified with status `Accepted`.
- Required 14 GitHub labels configured and verified.
- W00 through W17 GitHub milestones configured and verified.
- GitHub Issue Forms and Pull Request template configured on `main`.
- GitHub Project `Atlazora Execution` created under the `atlazora` organization.
- Project workflow verified as `Backlog → Ready → In Progress → Review/Test → Done`.
- Initial governance baseline committed and pushed.
- Governance validation GitHub Actions workflow created and verified.
- Latest Governance Validation workflow run completed successfully.
- GitHub Actions runtime warning was resolved by updating maintained action versions.
- Repository Rulesets are unavailable for the current private repositories on the organization GitHub Free plan.
- Traditional Branch Protection is also unavailable for the current private repositories on the organization GitHub Free plan.
- Ruleset and Branch Protection unavailability is a GitHub plan limitation, not an unexecuted Atlazora configuration item.

## Known Limitations / Remaining Work

W00-WU01 is not complete.

Remaining work includes:

- final `PROJECT_STATE.md` completion update after the final verification passes
- final Definition of Done audit
- Final Handoff to W00-WU02

Known platform limitation:

- GitHub server-side Rulesets and Branch Protection cannot currently be enabled for the private organization repositories on the active GitHub Free plan.
- Atlazora will not make repositories public solely to obtain these controls.
- Governance validation is enforced operationally through GitHub Actions and the documented PR/process model until server-side protection becomes available.

## Completion Guard

Do not change this Work Unit to `COMPLETE` until all applicable items in `templates/DEFINITION_OF_DONE.md` pass and the Final Handoff is written.

Do not begin W00-WU02 before that point.
