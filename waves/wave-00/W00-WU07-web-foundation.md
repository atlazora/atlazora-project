# W00-WU07 — Web Foundation

- **Phase:** Phase 09 — Implementation Roadmap
- **Wave:** W00 — Engineering Foundation
- **Work Unit:** W00-WU07
- **Status:** IN_PROGRESS
- **Primary Repository/Repositories:** `atlazora-web`, `atlazora-project`
- **Contract Dependency Repository:** `atlazora-contracts`
- **Backend Dependency Repository:** `atlazora-core`
- **Owner:** Atlazora
- **Last Updated:** 2026-09-03

## Objective

Establish the production-oriented Web foundation for Atlazora in `atlazora-web` using React 19, Next.js 16, TypeScript, and Tailwind CSS 4, with an independent Atlazora Design System and an explicit Atlazora-owned contract/adapter boundary.

The foundation must prepare the Marketplace, Buyer, and Supplier presentation surface for later business-feature Work Units without importing Spree, Mercur, Medusa, or other donor-specific backend, domain, API, authorization, persistence, or transactional assumptions.

## Scope

### In Scope

- Establish the `atlazora-web` repository baseline for the Marketplace, Buyer, and Supplier Web surface.
- Establish the approved React 19 + Next.js 16 + TypeScript + Tailwind CSS 4 application foundation.
- Establish a maintainable Web project/application structure appropriate to the approved presentation boundary.
- Establish the independent Atlazora Design System foundation, including tokens, typography, spacing, semantic styling, component conventions, accessibility, responsive behavior, RTL/LTR behavior, Arabic/English presentation, and Atlazora product identity.
- Establish foundational reusable presentation primitives required by the Web foundation without prematurely implementing business features.
- Establish the explicit Atlazora Web Services / Adapters boundary between presentation code and backend contracts.
- Establish typed Atlazora contract models/clients or their approved derivation path from authoritative contracts where applicable.
- Ensure UI components consume Atlazora-owned presentation-oriented view models rather than donor-specific domain models.
- Establish foundational handling for loading, error, empty, forbidden, and relevant recovery states where applicable to the foundation.
- Establish environment/configuration conventions appropriate to the Web application.
- Prevent privileged backend credentials, secrets, or server-only configuration from entering browser bundles.
- Establish production build and local run verification for the approved Web stack.
- Establish TypeScript/static-quality, lint/format, unit/component, integration, and browser/E2E foundation verification where applicable.
- Establish accessibility verification appropriate to foundational components and application structure.
- Establish Arabic/English and RTL/LTR verification at foundation level.
- Perform dependency, security, licensing, secret, and donor-independence review appropriate to this Work Unit.
- Record intentionally unresolved implementation/tooling choices without silently converting them into architectural decisions.
- Record implementation and verification evidence in permanent Git project memory and produce the required Final Handoff before completion.

### Out of Scope

- Implementing complete Marketplace, Buyer, Supplier, catalog, cart, checkout, order, payment, supplier, procurement, fulfillment, or other business-feature flows.
- Implementing W00-WU08 — Admin Foundation or changing `atlazora-admin`.
- Selecting the exact `atlazora-admin` application framework.
- Changing Atlazora domain ownership or backend business behavior.
- Replacing or reshaping Atlazora APIs merely to imitate Spree, Mercur, Medusa, or another donor project.
- Adopting Spree Commerce backend behavior, domain models, SDK assumptions, or transactional ownership.
- Adopting Mercur or Medusa backend behavior, domain models, API assumptions, or transactional ownership.
- Making donor-specific presentation models authoritative Atlazora domain or persistence models.
- Making browser-side authorization, visibility, or validation authoritative for security decisions.
- Making the Web application an authoritative source of transactional truth.
- Direct database access from the Web application.
- Creating new backend/domain service boundaries merely for frontend convenience.
- Introducing new shared executable API contracts unless separately reviewed and governed through `atlazora-contracts`.
- Infrastructure provisioning owned by W00-WU09.
- Full CI/CD and software supply-chain foundation owned by W00-WU10.
- Full observability foundation owned by W00-WU11.
- Broader engineering security baseline owned by W00-WU12.
- Foundation-wide integration closure owned by W00-WU13.
- Migration of legacy Laravel business behavior.
- Premature implementation of later Wave business features.

## Dependencies

- W00-WU01 — Project Governance & Repositories: `COMPLETE`.
- W00-WU02 — Local Development Platform: `COMPLETE`.
- W00-WU03 — Go Core Foundation: `COMPLETE`.
- W00-WU04 — Contracts Foundation: `COMPLETE`.
- W00-WU05 — Event & Outbox Foundation: `COMPLETE`.
- W00-WU06 — Python Intelligence Foundation: `COMPLETE`.
- W00-WU06 Final Handoff is complete and is the required predecessor Handoff.
- ADR-0029 is `Accepted` and is the current authoritative Web presentation architecture decision.
- ADR-0005 is superseded by ADR-0029 and remains historical project memory only.
- `atlazora-web` is the approved primary application repository for Marketplace, Buyer, and Supplier Web presentation.
- `atlazora-contracts` remains authoritative for shared versioned API contracts.
- `atlazora-core` and approved backend services remain authoritative for domain behavior, authorization, business invariants, and transactional truth.
- PostgreSQL/Core transactional ownership is not changed by this Work Unit.
- Spree Storefront and Mercur may be used only as selective UX, layout, flow, component, or code references/donors where technically and legally appropriate.
- Donor backend/domain/API assumptions must not become Atlazora architecture.
- Exact repository-local frontend quality/testing tooling remains a W00-WU07 implementation decision unless separately governed.

## Relevant ADRs

- ADR-0010 — REST and OpenAPI Versioned Contracts.
- ADR-0011 — Multi-Repository Strategy.
- ADR-0021 — Testing and Security Integrated Into Every Work Unit.
- ADR-0022 — Git as Permanent Project Memory.
- ADR-0026 — Contract Specifications and Validation Toolchain.
- ADR-0028 — Shared API and Platform Contract Conventions.
- ADR-0029 — React and TypeScript Web Presentation Architecture.

## Contracts

- `atlazora-contracts` remains authoritative for shared executable and versioned API contracts.
- Browser and Next.js presentation code must integrate through the approved conceptual boundary: Browser / Next.js -> Atlazora Web Services / Adapters -> Typed Atlazora Contract Models / Clients -> Versioned REST/OpenAPI APIs -> Atlazora Backend.
- Typed or generated Web clients may be derived from approved Atlazora OpenAPI contracts.
- Web presentation components should consume presentation-oriented Atlazora view models rather than donor-specific backend/domain models.
- Spree, Mercur, Medusa, or other donor API schemas must not become authoritative Atlazora contracts.
- Atlazora backend APIs must not be reshaped merely to imitate donor APIs.
- Shared API conventions such as `/v1`, RFC 9457 problem details, cursor pagination, and other applicable ADR-0028 conventions remain authoritative where consumed.
- No new shared executable API contract is introduced merely by creating the W00-WU07 foundation.
- Any contract change discovered as necessary during implementation requires explicit review in the owning contract governance path before being treated as authoritative.

## Security Considerations

- Authentication, authorization, organization isolation, validation, and business invariants remain authoritative server-side responsibilities.
- Frontend authorization and visibility checks are UX controls and must not be treated as security enforcement.
- Privileged backend credentials and secrets must not be exposed to browser code or client bundles.
- Environment/configuration handling must distinguish browser-safe values from server-only secrets.
- Untrusted external, URL, form, contract, and donor-derived inputs must be handled safely.
- XSS, unsafe HTML rendering, injection, open redirect, and client-side trust-boundary risks must be considered where applicable.
- Security headers and Content Security Policy implications must be reviewed where applicable to the selected Next.js foundation.
- Dependency and transitive-dependency risk must be reviewed for the Web stack.
- External donor code and dependencies require licensing, provenance, dependency, and security review before adoption.
- Donor code must not introduce hidden backend credentials, endpoints, telemetry, domain assumptions, or authority boundaries.
- Sensitive data must not be written to browser-visible logs or diagnostic surfaces.
- Tenant/organization isolation must remain enforced by the backend even when the frontend presents tenant-scoped UX.
- No unresolved blocking Critical or High security issue may remain at completion.

## Acceptance Criteria

- [ ] `atlazora-web` has an established repository/application baseline consistent with ADR-0029.
- [ ] React 19, Next.js 16, TypeScript, and Tailwind CSS 4 are established as the verified Web foundation stack.
- [ ] The repository has a clear maintainable project/application structure appropriate to Marketplace, Buyer, and Supplier presentation.
- [ ] The foundation installs/prepares reproducibly according to documented repository-local commands.
- [ ] The application starts or otherwise executes through its documented local development verification path.
- [ ] A production build completes successfully.
- [ ] TypeScript/static verification passes using the approved repository-local workflow.
- [ ] Lint/format verification passes using the approved repository-local workflow.
- [ ] Required unit/component tests pass.
- [ ] Required integration tests pass where applicable to the implemented foundation.
- [ ] Browser/E2E foundation or smoke verification passes where applicable.
- [ ] The independent Atlazora Design System foundation is established without making donor projects authoritative for product identity.
- [ ] Foundational accessibility verification passes.
- [ ] Arabic/English presentation foundation is established and verified.
- [ ] RTL/LTR behavior is established and verified at foundation level.
- [ ] The Atlazora Web Services / Adapters anti-coupling boundary is explicit and implemented where required by the foundation.
- [ ] UI components do not depend directly on Spree, Mercur, Medusa, or donor-specific authoritative domain models.
- [ ] Shared executable contracts are not duplicated from `atlazora-contracts`.
- [ ] The Web application does not become authoritative for transactional truth, authorization, or business invariants.
- [ ] No privileged backend credential or secret is exposed in the browser/client bundle.
- [ ] Foundational loading, error, empty, forbidden, and relevant recovery-state behavior is handled where applicable.
- [ ] Dependency, security, licensing, provenance, and donor-independence review passes for adopted dependencies/code.
- [ ] No blocking Critical/High security issue remains.
- [ ] No full Marketplace/Buyer/Supplier business feature is prematurely implemented.
- [ ] No W00-WU08 Admin implementation is introduced.
- [ ] No W00-WU09 through W00-WU13 responsibility is silently absorbed beyond the repository-local verification required for this foundation.
- [ ] Repository documentation provides the commands required to set up, verify, test, build, and run the foundation.
- [ ] Permanent Git project memory is updated with implementation and verification evidence.
- [ ] A formal W00-WU07 Final Handoff is produced before completion.

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
- [x] `atlazora-web` repository availability and current baseline are verified read-only.
- [x] Required local Node.js/npm and frontend toolchain availability is verified without starting implementation.
- [x] Current repository package-manager state and existing dependency baseline are known before choosing or modifying tooling.
- [x] React 19, Next.js 16, TypeScript, and Tailwind CSS 4 compatibility with the intended repository baseline is verified.
- [x] Intentionally unresolved repository-local testing, linting, formatting, browser/E2E, and related tooling decisions are confirmed not to block safe foundation implementation.
- [x] Donor/reference usage constraints and licensing/security review requirements are understood before any donor code is adopted.

**Definition of Ready Result:** `PASS`.

W00-WU07 is `IN_PROGRESS`. Definition of Ready remains `PASS`. Implementation may now begin within the approved W00-WU07 scope.

## Tasks

- [ ] Inspect the current `atlazora-web` repository before implementation.
- [ ] Verify the approved local Node.js/npm/frontend runtime and toolchain baseline.
- [ ] Verify the current repository package-manager and dependency state before modifying it.
- [ ] Confirm the minimum repository-local testing, linting, formatting, static-analysis, and browser verification toolchain needed for W00-WU07.
- [ ] Establish the React 19 + Next.js 16 + TypeScript + Tailwind CSS 4 application baseline.
- [ ] Establish the foundational Web project/application structure.
- [ ] Establish the independent Atlazora Design System foundation.
- [ ] Establish Arabic/English and RTL/LTR presentation foundations.
- [ ] Establish foundational accessibility conventions and verification.
- [ ] Establish the Atlazora Web Services / Adapters integration boundary.
- [ ] Establish typed contract client/model/view-model boundaries appropriate to the foundation.
- [ ] Establish safe browser/server configuration and secret-handling conventions.
- [ ] Establish foundational loading, error, empty, forbidden, and recovery presentation behavior where applicable.
- [ ] Establish production build and local run verification.
- [ ] Implement baseline static-quality and automated test verification.
- [ ] Establish browser/E2E foundation or smoke verification where applicable.
- [ ] Review dependency, licensing, provenance, security, and donor-independence risks.
- [ ] Verify no donor backend/domain/API authority leaked into Atlazora architecture.
- [ ] Verify no Admin or later Work Unit implementation leaked into scope.
- [ ] Add repository-local developer setup/test/build/run documentation.
- [ ] Update permanent project memory with implementation and verification evidence.
- [ ] Audit Definition of Done.
- [ ] Produce W00-WU07 Final Handoff.

## Verification Plan

Verification must include, where applicable:

- Local Node.js/npm/frontend toolchain verification.
- Package-manager and dependency-state verification.
- Reproducible dependency installation/preparation verification.
- React/Next.js/TypeScript/Tailwind foundation verification.
- TypeScript/static-quality verification.
- Lint/format verification.
- Unit/component test verification.
- Integration verification for implemented foundation boundaries where applicable.
- Browser/E2E foundation or smoke verification where applicable.
- Production build verification.
- Local application execution verification.
- Accessibility verification.
- Arabic/English presentation verification.
- RTL/LTR behavior verification.
- Loading/error/empty/forbidden/recovery-state verification where applicable.
- Contract/adapter boundary verification against Atlazora-owned contracts.
- Verification that donor-specific models and APIs are not authoritative dependencies.
- Verification that browser-side authorization is not treated as authoritative enforcement.
- Secret and client-bundle configuration review.
- Dependency and transitive-dependency review.
- External donor licensing/provenance/security review where donor code is adopted.
- Verification that no full business feature, Admin foundation, infrastructure, broader CI/CD, observability, or later foundation scope leaked into W00-WU07.
- Git diff/status verification.
- Repository synchronization verification before final completion.

Exact repository-local verification tools remain W00-WU07 implementation decisions unless already governed elsewhere. Required verification coverage must still be preserved.

## Definition of Done

Evaluate this Work Unit against `templates/DEFINITION_OF_DONE.md`.

Any N/A item must include an explicit reason.

W00-WU07 must not be changed to `COMPLETE` until all applicable implementation, acceptance criteria, verification, security review, documentation, project-memory, and Handoff requirements pass.

## Handoff

A formal Handoff is required before changing status to `COMPLETE`.

## Planning Boundary

This file records the formally assessed W00-WU07 Definition of Ready.

W00-WU07 Definition of Ready is `PASS` and the Work Unit is `IN_PROGRESS`.

W00-WU07 application foundation implementation is authorized only within this Work Unit's approved scope. W00-WU08 work and later Work Unit execution remain unauthorized.
