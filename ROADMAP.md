# Atlazora Roadmap

Atlazora planning is organized into 13 planning/lifecycle Phases and implementation execution is organized into Waves and Work Units.

The execution hierarchy is:

**Phase → Wave → Work Unit → Task**

## Planning Phases

1. Phase 01 — Product Vision & Business Model
2. Phase 02 — V1 Functional Scope
3. Phase 03 — End-to-End Business Flows
4. Phase 04 — Atlazora Gap Analysis
5. Phase 05 — Domain & Data Model
6. Phase 06 — Target Architecture
7. Phase 07 — Infrastructure & DevOps Architecture
8. Phase 08 — Migration Strategy
9. Phase 09 — Implementation Roadmap
10. Phase 10 — Testing & Security
11. Phase 11 — Staging & Pilot Launch
12. Phase 12 — Production Launch & Operations
13. Phase 13 — Measure → Learn → Develop

Planning decisions from these phases are approved baseline inputs and must be preserved in Git documentation rather than reinvented during implementation.

## Execution Model

Implementation proceeds through coherent vertical slices.

Only one primary Work Unit may be `IN_PROGRESS` during solo development.

A Work Unit must pass Definition of Ready before execution and Definition of Done before completion.

A formal Handoff preserves the transition between completed Work Units.

## Priority Model

- `P0` — Blocking / Critical
- `P1` — High
- `P2` — Normal
- `P3` — Lower / Improvement
- `P4` — Future / Optional

Priority does not override foundational correctness, security, data-integrity, or release gates.

## Execution Waves

| Wave | Name |
|---|---|
| W00 | Engineering Foundation |
| W01 | Identity & Organizations |
| W02 | Supplier & Verification |
| W03 | Catalog |
| W04 | Offers |
| W05 | Search & Discovery |
| W06 | RFQ / Quotes / Messaging |
| W07 | Orders & Samples |
| W08 | Payments / Finance / Protection |
| W09 | Logistics |
| W10 | Inspection |
| W11 | Disputes / Completion |
| W12 | Reviews / Reputation |
| W13 | Monetization |
| W14 | Platform Completion |
| W15 | Legacy Final Migration |
| W16 | Cutover Readiness |
| W17 | Legacy Retirement |

## W00 Work Units

| Work Unit | Name | Current Planning Status |
|---|---|---|
| W00-WU01 | Project Governance & Repositories | COMPLETE |
| W00-WU02 | Local Development Platform | COMPLETE |
| W00-WU03 | Go Core Foundation | COMPLETE |
| W00-WU04 | Contracts Foundation | COMPLETE |
| W00-WU05 | Event & Outbox Foundation | COMPLETE |
| W00-WU06 | Python Intelligence Foundation | IN_PROGRESS |
| W00-WU07 | Web Foundation | PLANNED |
| W00-WU08 | Admin Foundation | PLANNED |
| W00-WU09 | Infrastructure Foundation | PLANNED |
| W00-WU10 | CI/CD & Supply Chain | PLANNED |
| W00-WU11 | Observability Foundation | PLANNED |
| W00-WU12 | Security Baseline | PLANNED |
| W00-WU13 | Foundation Integration Test | PLANNED |
W00-WU05 — Event & Outbox Foundation is formally COMPLETE with its Final Handoff recorded. W00-WU06 has passed its Definition of Ready and is now IN_PROGRESS.

W00-WU02 must not begin until W00-WU01 passes Definition of Done and produces its Final Handoff.

Detailed Work Unit execution files are created/formalized when required by the governance lifecycle; roadmap listing does not imply that a Work Unit is already READY or IN_PROGRESS.

## Capability Milestones

| Milestone | Capability |
|---|---|
| M0 | Engineering Platform Ready |
| M1 | Supplier Can Join Atlazora |
| M2 | Supplier Can Publish Wholesale Inventory |
| M3 | Buyer Can Discover & Source |
| M4 | Buyer Can Create Commercial Transaction |
| M5 | Money Can Move Safely |
| M6 | Order Can Be Fulfilled |
| M7 | Trade Lifecycle Complete |
| M8 | Business Model Operational |
| M9 | V1 Feature Complete |

Milestones are capability gates, not invented calendar deadlines.

## Execution Rule

The roadmap does not authorize skipping foundations merely because a capability belongs to a later Wave.

If a foundational capability is required for correctness, security, operability, scalability, or safe evolution of V1, that foundation must be introduced when first required.

Defer advanced complexity, not foundations.

## Scheduling

No arbitrary implementation deadline is established before meaningful execution velocity exists.

Forecasts should be based on measured delivery evidence once enough Work Units have been completed.

## Open Engineering Decisions

The roadmap preserves rather than silently resolves currently open details including:

- exact physical money representation.
- exact public ID convention.
- exact event envelope/ID conventions.
- exact event broker.
- provider-specific integrations.
- exact numeric SLO/RPO/RTO targets.

These are resolved in the appropriate implementation Work Unit and through ADRs where architectural.

## Related Documentation

- `phases/phase-09/README.md`
- `waves/wave-00/README.md`
- `PROJECT_STATE.md`
- `templates/DEFINITION_OF_DONE.md`
- `templates/WORK_UNIT_TEMPLATE.md`
- `templates/HANDOFF_TEMPLATE.md`
