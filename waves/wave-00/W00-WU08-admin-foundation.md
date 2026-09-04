# W00-WU08 — Admin Foundation

- **Status:** IN_PROGRESS
- **Wave:** W00 — Engineering Foundation
- **Target Repository:** `atlazora-admin`
- **Architecture:** React + TypeScript + Vite
- **Required ADRs:** ADR-0025, ADR-0029, ADR-0030
- **Primary Work Unit IN_PROGRESS:** W00-WU08
- **Implementation Authorized:** YES — effective only after this lifecycle transition is committed, pushed, and validated

## Objective

Establish the Admin/Operations presentation foundation in `atlazora-admin` using React + TypeScript + Vite while preserving the approved application, authorization, contract, and domain boundaries.

## Definition of Ready

W00-WU08 has passed its readiness assessment.

The readiness decision confirms:

- W00-WU07 — Web Foundation is formally COMPLETE with its Final Handoff recorded.
- ADR-0025 — Admin/Operations application boundaries is Accepted.
- ADR-0029 — React + TypeScript presentation architecture is Accepted.
- ADR-0030 — React + Vite Admin Application Framework is Accepted and template-conformant.
- `atlazora-contracts` remains the authoritative executable contract boundary.
- No primary Work Unit is currently IN_PROGRESS.
- W00-WU08 scope and downstream boundaries are sufficiently defined for a later READY -> IN_PROGRESS lifecycle decision.

## Approved Foundation Scope

W00-WU08 owns the Admin presentation foundation necessary to begin later implementation, including:

- React + TypeScript + Vite application foundation in `atlazora-admin`.
- Admin shell and layout foundation.
- Permission-aware navigation as a presentation and usability concern.
- Approved API and authoritative contract integration.
- Services/Adapters presentation boundaries.
- English and Arabic localization foundations.
- LTR and RTL presentation behavior.
- Accessibility baseline appropriate to the Admin foundation.
- Audit-friendly privileged-action UX boundaries.
- Repository-local build, test, dependency, and CI checks required for the Admin foundation.

## Application Boundaries

The Admin application must consume approved APIs, commands, domain behavior, and authoritative contracts.

`atlazora-contracts` remains the authoritative executable shared contract dependency.

Permission-aware navigation and UI visibility do not constitute authorization. Backend and domain authorization remain authoritative.

Routine direct database manipulation is prohibited.

The Admin application must not create an alternative business source of truth.

Privileged or materially consequential operations must preserve authentication, authorization, least privilege, actor attribution, validation, and auditability through approved application boundaries.

## Architecture Decision

ADR-0030 establishes React + TypeScript + Vite for `atlazora-admin`.

Next.js is not selected for the W00-WU08 Admin foundation because the readiness assessment identified no Admin-specific requirement for SSR, SSG, SEO, public anonymous rendering, or equivalent server-framework capabilities.

This decision does not modify the separate `atlazora-web` architecture established under W00-WU07.

## Explicit Non-Goals

W00-WU08 does not own:

- W00-WU09 cloud, GKE, Terraform, or infrastructure provisioning.
- W00-WU10 platform-wide CI/CD or supply-chain architecture.
- W00-WU11 platform-wide observability.
- W00-WU12 the broad cross-platform security baseline.
- W00-WU13 cross-foundation integration certification.
- backend authorization rules implemented inside the Admin frontend.
- routine direct database manipulation.
- an alternative Admin business truth.
- changes to the `atlazora-web` runtime architecture.

Repository-local tests and checks required to validate the W00-WU08 foundation remain within W00-WU08 scope.

## Lifecycle Governance

Current lifecycle status: `IN_PROGRESS`.

The READY assessment has passed, and W00-WU08 is transitioning into active execution under the single-primary-Work-Unit rule.

W00-WU08 is the sole primary Work Unit currently `IN_PROGRESS`.

Implementation is authorized only after this W00-WU08 `READY -> IN_PROGRESS` governance transition is committed, pushed, and validated according to repository governance.

## Active Execution State

W00-WU08 is the sole primary Work Unit `IN_PROGRESS`.

After this governance transition is committed, pushed, and validated:

- W00-WU08 implementation is authorized within the approved foundation scope;
- implementation must remain within ADR-0025, ADR-0029, and ADR-0030 boundaries;
- `atlazora-contracts` remains authoritative;
- backend and domain authorization remain authoritative;
- W00-WU09 through W00-WU13 remain outside W00-WU08 ownership.
