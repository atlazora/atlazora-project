# ADR-0029 — React and TypeScript Web Presentation Architecture

- **Status:** Accepted
- **Date:** 2026-09-03
- **Related Phase:** Phase 06 — Target Architecture
- **Related Waves:** W00-W17
- **Related Work Units:** W00-WU07 — Web Foundation; W00-WU08 — Admin Foundation
- **Supersedes:** ADR-0005

## Context

ADR-0005 currently selects Vue 3 with TypeScript for atlazora-web and atlazora-admin.

Before W00-WU07 implementation, new frontend architecture inputs became relevant:

- Spree Storefront provides useful customer-commerce UX and React/Next.js implementation references.
- Mercur provides useful marketplace and supplier/vendor UX references in the React ecosystem.
- Atlazora must remain independent from Spree, Mercur, Medusa, and their backend/domain assumptions.
- Atlazora remains authoritative for domain behavior, backend behavior, transactional state, contracts, authorization, and business invariants.

Keeping Vue would substantially reduce the value of selective reuse from the chosen React ecosystem donors.

A replacement frontend architecture decision is therefore proposed before W00-WU07 can pass Definition of Ready.

## Decision

### Web technology

atlazora-web will use:

- TypeScript
- React 19
- Next.js 16
- Tailwind CSS 4

Next.js is the application framework for the Marketplace / Buyer / Supplier Web surface.

### Atlazora ownership

Atlazora owns:

- product and domain behavior;
- backend/runtime behavior;
- authoritative transactional state;
- API and event contracts;
- authorization and business invariants;
- the Atlazora Design System and final product identity.

External frontend projects do not become authoritative architecture owners.

### Atlazora Design System

Atlazora will maintain an independent design system covering:

- design tokens;
- typography;
- spacing;
- semantic styling;
- component conventions;
- accessibility;
- responsive behavior;
- RTL/LTR behavior;
- Arabic/English presentation;
- Atlazora product identity.

External projects may provide useful UX and implementation references without becoming the Atlazora design system.

### Spree Storefront role

Spree Storefront may be used selectively as:

- UX reference;
- commerce-flow reference;
- layout reference;
- component/code donor where technically and legally appropriate.

Spree Storefront is not Atlazora's:

- backend;
- domain model;
- API contract;
- transactional source of truth.

Spree-specific API or SDK assumptions must not define Atlazora APIs.

### Mercur role

Mercur may be used selectively as:

- marketplace UX reference;
- supplier/vendor workspace reference;
- dashboard/interaction reference;
- component/code donor where technically and legally appropriate.

Mercur is not Atlazora's:

- backend;
- domain model;
- API contract;
- transactional source of truth.

Mercur or Medusa backend assumptions must not define Atlazora APIs or domain behavior.

### Anti-coupling boundary

Presentation code must consume Atlazora-owned contracts through an explicit integration boundary.

Conceptual flow:

Browser / Next.js
→ Atlazora Web Services / Adapters
→ Typed Atlazora Contract Models / Clients
→ Versioned REST/OpenAPI APIs
→ Atlazora Backend

UI components should consume presentation-oriented view models rather than depend directly on Spree, Mercur, Medusa, or donor-specific domain models.

### Contract ownership

atlazora-contracts remains authoritative for shared versioned API contracts.

Typed or generated web clients may be derived from approved Atlazora OpenAPI contracts.

Atlazora backend APIs must not be reshaped merely to imitate Spree or Mercur APIs.

## Security Impact

Frontend authorization and visibility checks are UX controls only.

Authoritative authentication, authorization, organization isolation, validation, and business invariants remain server-side.

Privileged backend credentials and secrets must not be exposed to browser code.

External donor code and dependencies require appropriate security, licensing, and dependency review.

### Repository boundaries

The existing eight-repository architecture remains unchanged.

No Spree, Mercur, Medusa, or donor-specific repository becomes an authoritative Atlazora repository.

W00-WU07 primarily activates atlazora-web.

W00-WU08 remains responsible for the Admin / Operations foundation in atlazora-admin.

### Admin scope

This ADR establishes React + TypeScript as the intended shared frontend presentation ecosystem.

W00-WU07 does not implement atlazora-admin.

The exact application framework for atlazora-admin, such as Next.js or React/Vite, must be confirmed through the W00-WU08 readiness/architecture process before Admin implementation begins.

## Related Decisions

- ADR-0005 - Vue 3 and TypeScript for Web and Admin.
- ADR-0010 - REST/OpenAPI synchronous API direction.
- ADR-0021 - Testing and security integrated into every Work Unit.
- ADR-0025 - Admin and Operations use approved application boundaries.
- ADR-0028 - Shared API and platform conventions.

## Supersession

ADR-0029 supersedes ADR-0005.

ADR-0005 remains preserved in Git as historical project memory and is marked Superseded.

ADR-0029 is now the current Accepted frontend architecture decision.

## Consequences

### Positive

- React ecosystem donor assets can be selectively adapted instead of translated to Vue.
- Atlazora remains independent from donor backends and domains.
- API ownership remains with Atlazora contracts.
- The adapter boundary limits external architectural coupling.
- Atlazora retains its own design system and product identity.

### Negative / Trade-offs

- ADR-0005 is formally superseded by this ADR.
- Current governance documents that explicitly identify Vue require controlled reconciliation.
- React/Next.js dependency, build, security, and operational conventions become part of the Web foundation.
- Admin framework selection remains a separate W00-WU08 readiness decision.

## Data / Migration Impact

This decision does not change Atlazora transactional data ownership, PostgreSQL truth, domain persistence, or migration strategy.

Frontend view models, generated clients, and presentation adapters may evolve, but donor-specific data models must not become authoritative Atlazora persistence models.

## Operational Impact

W00-WU07 must establish applicable:

- TypeScript/static verification;
- lint/format verification;
- unit/component tests;
- integration tests where applicable;
- browser/E2E foundation where applicable;
- dependency/security review;
- production build verification;
- CI integration;
- accessibility verification;
- Arabic/English and RTL/LTR foundation verification.

Exact tooling remains a W00-WU07 implementation decision unless separately governed.

## Rationale

The React ecosystem provides the strongest alignment with the approved presentation-layer donor strategy for W00-WU07.

Using React 19 and Next.js 16 for atlazora-web allows selective adaptation of Spree Storefront and Mercur presentation assets while preserving Atlazora-owned domain behavior, backend behavior, API contracts, authorization, and transactional truth.

The explicit adapter boundary prevents external frontend projects from dictating Atlazora APIs or domain models.

## Alternatives Considered

### Keep Vue 3 + TypeScript

Not preferred because the selected frontend donor/reference strategy is strongly aligned with the React ecosystem.

### Adopt Spree Storefront wholesale

Rejected because Atlazora must not inherit Spree backend, API, SDK, or domain coupling.

### Adopt Mercur or Medusa wholesale

Rejected because Atlazora must preserve its independent backend, domain model, contracts, transactional truth, and business rules.

### React without an explicit adapter boundary

Rejected because donor-specific assumptions could leak into Atlazora APIs and domain design.

## Non-Goals

This ADR does not:

- replace the Go transactional Core;
- replace Python intelligence;
- replace PostgreSQL transactional truth;
- replace Atlazora OpenAPI contracts;
- adopt the Spree Commerce backend;
- adopt the Medusa/Mercur backend;
- import external business rules as Atlazora domain truth;
- start W00-WU08;
- authorize W00-WU07 implementation by itself.

W00-WU07 must still pass its full Definition of Ready before execution.
