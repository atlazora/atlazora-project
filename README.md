# Atlazora Project Governance

This repository is the permanent project memory and governance source for Atlazora.

It does not contain product application code. It records architecture, product decisions, execution state, ADRs, phases, waves, Work Units, handoffs, runbooks, and governance standards.

## Source of Truth

Git-tracked Markdown and repository history are the permanent source of truth for the project.

Chat conversations are working sessions only. A future Work Unit must be able to start from Git without relying on previous chat history.

Required reading when starting a Work Unit:

1. `PROJECT_STATE.md`
2. Relevant ADRs in `decisions/`
3. Relevant Wave and Work Unit documentation
4. Previous formal Handoff
5. Relevant architecture/product documents

## Engineering Principle

Any foundation required for V1 to be correct, secure, operable, scalable, and to avoid painful rebuilds must be implemented from the beginning.

Defer advanced complexity, not foundations.

## Official Repository Set

Atlazora has exactly eight official repositories at the W00-WU01 baseline:

| Repository | Responsibility |
|---|---|
| `Atlazora-original-laravel` | Legacy/reference source only |
| `atlazora-project` | Project memory and governance |
| `atlazora-web` | Vue 3 + TypeScript Marketplace / Buyer / Supplier |
| `atlazora-admin` | Vue 3 + TypeScript Admin / Operations |
| `atlazora-core` | Go modular transactional core |
| `atlazora-intelligence` | Python intelligence and data workloads |
| `atlazora-contracts` | OpenAPI, events, shared contracts |
| `atlazora-infra` | Terraform, deployment, and cloud infrastructure |

Do not create additional service repositories unless an architectural decision explicitly extracts a module into an independently operated service.

## Delivery Hierarchy

The canonical execution hierarchy is:

`Phase → Wave → Work Unit → Task`

### Phase

A major planning or lifecycle area.

### Wave

A coherent implementation stream.

### Work Unit

The primary independently reviewable unit of engineering execution.

### Task

A concrete implementation, bug, test, documentation, security, or operational item.

## Work Unit Statuses

Only these statuses are valid:

- `PLANNED`
- `READY`
- `IN_PROGRESS`
- `BLOCKED`
- `REVIEW`
- `COMPLETE`

`COMPLETE` may only be used after the applicable Definition of Done is satisfied and a formal Handoff is written.

## Work In Progress Rule

For a solo developer, only one primary Work Unit may be `IN_PROGRESS`.

A side task may be started only when the primary Work Unit is genuinely blocked and the side work does not create conflicting project state.

## Definition of Ready

A Work Unit is `READY` only when, at minimum:

- objective is clear
- scope is clear
- dependencies are complete
- relevant ADRs are available
- acceptance criteria are clear
- repositories are known
- security considerations are known
- contracts are known enough to begin safely
- previous required Handoff is complete

The Work Unit template contains the formal checklist.

## Definition of Done

The canonical Definition of Done is maintained in:

`templates/DEFINITION_OF_DONE.md`

Completion is evidence-based. Inapplicable items must be explicitly marked N/A with a reason.

## ADR Governance

Architecture Decision Records live in `decisions/`.

Valid ADR statuses:

- Proposed
- Accepted
- Superseded
- Deprecated
- Rejected

Accepted history is immutable. An obsolete ADR is not deleted; it is superseded or deprecated with references to the replacement decision.

## GitHub Execution Model

- Milestones represent Waves.
- Issues represent Tasks, Bugs, and Work Unit execution items as appropriate.
- Pull Requests represent implementation changes.
- Releases represent meaningful deployable milestones.
- Project Board flow:
  `Backlog → Ready → In Progress → Review/Test → Done`

## Commit Convention

Use conventional, scoped commit messages where practical.

Examples:

- `feat(organizations): add organization creation`
- `fix(auth): prevent expired session refresh`
- `test(rbac): cover member permission boundaries`
- `docs(adr): record organization ownership rule`

## Pull Request Checkpoint

Every implementation PR must communicate:

- What
- Why
- How
- Testing
- Security Impact
- Migration Impact, when applicable

## Tooling Model

GitHub, Git-tracked Markdown, the GitHub Project Board, and ChatGPT are sufficient for the current project governance model.

Jira and Notion are not required at this stage.

## Chat / Work Unit Continuity

Each major Work Unit should use a separate chat within the same Atlazora project.

Do not begin the next Work Unit until the current Work Unit satisfies its Definition of Done and has a formal Handoff.

If a conversation becomes too long, write an Interim Handoff and continue the same Work Unit in another chat. Its status remains `IN_PROGRESS`.
