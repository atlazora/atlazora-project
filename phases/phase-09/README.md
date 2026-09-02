# Phase 09 â€” Implementation Roadmap

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 09 defines the approved implementation execution model for Atlazora.

Planning is organized into Phases.

Implementation is executed through:

**Phase â†’ Wave â†’ Work Unit â†’ Task**

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Execution Principle

Implementation is organized as vertical slices that deliver coherent, testable capability.

A Work Unit is not complete merely because code was written.

Applicable domain behavior, persistence, contracts, authorization, validation, events, idempotency, UI, operations, testing, security, observability, audit, documentation, and deployment concerns are part of delivering the capability.

## Foundation Rule

Any Foundation required for V1 to be correct, secure, operable, scalable, and avoid painful rebuilds must be implemented from the beginning.

Defer advanced complexity, not foundations.

A later Wave assignment does not justify omitting a foundation required by an earlier capability.

## Work Unit Lifecycle

Approved Work Unit statuses are:

- `PLANNED`
- `READY`
- `IN_PROGRESS`
- `BLOCKED`
- `REVIEW`
- `COMPLETE`

A Work Unit must satisfy Definition of Ready before execution.

A Work Unit must satisfy Definition of Done and produce the required Handoff before completion.

## Solo WIP Rule

Atlazora currently follows a solo-development WIP rule.

Only one primary Work Unit may be `IN_PROGRESS`.

A side task may proceed only when the primary Work Unit is genuinely blocked and the side work does not create uncontrolled parallel scope.

## Priority Model

The approved prioritization vocabulary is:

### P0 â€” Blocking / Critical

Required immediately because execution, correctness, security, data integrity, or release safety cannot proceed without it.

### P1 â€” High

Required for the current Wave/capability and materially important to V1 correctness or completion.

### P2 â€” Normal

Required work that should be completed in normal roadmap order but is not currently blocking.

### P3 â€” Lower / Improvement

Useful improvement that may be scheduled after higher-priority V1 requirements.

### P4 â€” Future / Optional

Future, experimental, advanced, or non-V1 work unless evidence promotes it.

Priority does not override architectural foundations or release/security gates.

## Wave Roadmap

The approved execution order is:

- W00 â€” Engineering Foundation
- W01 â€” Identity & Organizations
- W02 â€” Supplier & Verification
- W03 â€” Catalog
- W04 â€” Offers
- W05 â€” Search & Discovery
- W06 â€” RFQ / Quotes / Messaging
- W07 â€” Orders & Samples
- W08 â€” Payments / Finance / Protection
- W09 â€” Logistics
- W10 â€” Inspection
- W11 â€” Disputes / Completion
- W12 â€” Reviews / Reputation
- W13 â€” Monetization
- W14 â€” Platform Completion
- W15 â€” Legacy Final Migration
- W16 â€” Cutover Readiness
- W17 â€” Legacy Retirement

Wave ordering communicates the implementation progression.

It does not authorize violating domain dependencies or omitting a foundation required earlier.

## W00 â€” Engineering Foundation

W00 establishes the engineering platform required for safe feature implementation.

Approved Work Units:

1. W00-WU01 â€” Project Governance & Repositories
2. W00-WU02 â€” Local Development Platform
3. W00-WU03 â€” Go Core Foundation
4. W00-WU04 â€” Contracts Foundation
5. W00-WU05 â€” Event & Outbox Foundation
6. W00-WU06 â€” Python Intelligence Foundation
7. W00-WU07 â€” Web Foundation
8. W00-WU08 â€” Admin Foundation
9. W00-WU09 â€” Infrastructure Foundation
10. W00-WU10 â€” CI/CD & Supply Chain
11. W00-WU11 â€” Observability Foundation
12. W00-WU12 â€” Security Baseline
13. W00-WU13 â€” Foundation Integration Test

W00-WU01 is COMPLETE with its Definition of Done and Final Handoff recorded. W00-WU02 is in `REVIEW` pending final GitHub Governance Validation evidence. No primary Work Unit is currently `IN_PROGRESS`; W00-WU03 remains `PLANNED` until W00-WU02 formally reaches `COMPLETE`.

## W00-WU01 â€” Project Governance & Repositories

Establish:

- official repositories.
- permanent Git project memory.
- governance hierarchy.
- ADR lifecycle.
- Definition of Ready.
- Definition of Done.
- Handoff standard.
- GitHub execution governance.
- approved planning preservation.

## W00-WU02 â€” Local Development Platform

Establish a reproducible local development platform for the target repositories and required local dependencies.

The local platform must support the actual architecture rather than creating a disposable environment that hides production-relevant integration behavior.

## W00-WU03 â€” Go Core Foundation

Establish the Go transactional Core foundation including approved project/module structure and foundational application/runtime conventions.

It must preserve domain ownership and the approved modular-first architecture.

## W00-WU04 â€” Contracts Foundation

Establish versioned OpenAPI/event/shared-contract foundations in `atlazora-contracts`.

Contract validation and compatibility become part of normal engineering workflow.

## W00-WU05 â€” Event & Outbox Foundation

Establish the foundational Transactional Outbox and idempotent asynchronous integration model.

The exact event broker remains an explicit decision until resolved through the appropriate engineering decision process.

## W00-WU06 â€” Python Intelligence Foundation

Establish the Python intelligence/data engineering foundation.

The boundary must preserve the rule that Python intelligence does not directly mutate Core-owned transactional truth.

## W00-WU07 â€” Web Foundation

Establish the Vue 3 + TypeScript Marketplace/Buyer/Supplier application foundation.

## W00-WU08 â€” Admin Foundation

Establish the Vue 3 + TypeScript Admin/Operations application foundation.

Admin operates through approved APIs/domain behavior rather than direct database manipulation.

## W00-WU09 â€” Infrastructure Foundation

Establish the initial Terraform/GCP infrastructure foundation consistent with the approved infrastructure architecture.

Production-ready foundations do not require Production-size spending.

## W00-WU10 â€” CI/CD & Supply Chain

Establish CI/CD and applicable software supply-chain controls.

Build once and promote immutable artifacts.

## W00-WU11 â€” Observability Foundation

Establish foundational logs, metrics, correlation/tracing where applicable, health visibility, and operational diagnostics.

Exact numeric SLOs remain open until formally approved.

## W00-WU12 â€” Security Baseline

Establish the engineering security baseline required before feature Waves depend on it.

Security remains integrated into every later Work Unit rather than being completed once and forgotten.

## W00-WU13 â€” Foundation Integration Test

Verify the W00 engineering platform as an integrated foundation.

The goal is to demonstrate that the repositories, local platform, Core, contracts, events/outbox, Intelligence, Web, Admin, infrastructure, CI/CD, observability, and security foundations work together sufficiently to begin feature Waves safely.

## Later Wave Scope

### W01 â€” Identity & Organizations

Establish User/Organization separation, organization membership, roles/permissions, and foundational identity/authorization workflows.

### W02 â€” Supplier & Verification

Establish supplier profile, onboarding, verification/KYB workflow, operational review, and verification lifecycle.

### W03 â€” Catalog

Establish target Product/catalog/taxonomy/media capability.

### W04 â€” Offers

Establish supplier-specific Offer, MOQ, tier pricing, availability, lead-time, and commercial offer behavior.

### W05 â€” Search & Discovery

Establish buyer discovery over derived/rebuildable search indexes.

### W06 â€” RFQ / Quotes / Messaging

Establish structured RFQ sourcing, versioned Quotes, negotiation, and messaging while preserving that chat is not official commercial truth.

### W07 â€” Orders & Samples

Establish accepted commercial Order snapshots, Order lifecycle, Order changes, and first-class Sample workflows.

### W08 â€” Payments / Finance / Protection

Establish payment/provider integration boundaries, Trade Protection lifecycle, Ledger, Refund, Commission, Settlement, and financial integrity.

### W09 â€” Logistics

Establish Shipment and logistics workflows including supported shipping models and partial/multiple shipments.

### W10 â€” Inspection

Establish independent Inspection workflow and applicable fulfillment gates.

### W11 â€” Disputes / Completion

Establish dispute evidence/resolution, explicit financial propagation, order completion, and related lifecycle behavior.

### W12 â€” Reviews / Reputation

Establish transaction-eligible reviews, sample distinction, reputation, and trust presentation.

### W13 â€” Monetization

Establish Professional Supplier Plan, entitlements, promotions, sponsored placement, and monetization operations without conflating payment with verification or reputation.

### W14 â€” Platform Completion

Complete remaining V1 cross-cutting platform capabilities, operational gaps, and release-readiness requirements not owned by a narrower domain Wave.

### W15 â€” Legacy Final Migration

Execute final approved migration of remaining required legacy data/capabilities using Progressive Semantic Migration.

### W16 â€” Cutover Readiness

Perform final cutover validation, migration verification, release gates, operational readiness, and go/no-go preparation.

### W17 â€” Legacy Retirement

Retire the legacy Laravel runtime only after verified cutover while preserving required backups, retention, and historical/reference material.

## Milestones

The approved capability milestones are:

- M0 â€” Engineering Platform Ready
- M1 â€” Supplier Can Join Atlazora
- M2 â€” Supplier Can Publish Wholesale Inventory
- M3 â€” Buyer Can Discover & Source
- M4 â€” Buyer Can Create Commercial Transaction
- M5 â€” Money Can Move Safely
- M6 â€” Order Can Be Fulfilled
- M7 â€” Trade Lifecycle Complete
- M8 â€” Business Model Operational
- M9 â€” V1 Feature Complete

Milestones describe demonstrated business/engineering capability.

They are not arbitrary calendar deadlines.

## Milestone Intent

### M0 â€” Engineering Platform Ready

W00 foundations are sufficiently integrated and verified for feature implementation.

### M1 â€” Supplier Can Join Atlazora

Identity, organization, supplier onboarding, and verification capability are operational.

### M2 â€” Supplier Can Publish Wholesale Inventory

Catalog and Offer capability allow verified/eligible suppliers to prepare and publish wholesale inventory according to policy.

### M3 â€” Buyer Can Discover & Source

Buyers can discover supply and initiate sourcing through Search/RFQ capability.

### M4 â€” Buyer Can Create Commercial Transaction

Accepted commercial terms can become an Order/Sample transaction with preserved commercial truth.

### M5 â€” Money Can Move Safely

Payment and Finance foundations support controlled, auditable financial execution.

### M6 â€” Order Can Be Fulfilled

Orders can progress through applicable logistics and inspection workflows.

### M7 â€” Trade Lifecycle Complete

Completion, disputes, refunds/financial propagation, and trust lifecycle are operational.

### M8 â€” Business Model Operational

Monetization and remaining platform operations required for the V1 business model are operational.

### M9 â€” V1 Feature Complete

Approved V1 functional scope is implemented sufficiently to enter final migration/cutover/launch readiness work.

## Failure-First Engineering

Implementation must explicitly test important failure behavior rather than validating only the happy path.

Examples include:

- duplicate commands.
- duplicate provider callbacks.
- retry/reordering of events.
- stale commercial data.
- authorization boundary violations.
- partial external-provider failure.
- migration retry.
- search/cache loss.
- infrastructure/dependency failure.
- reconciliation mismatch.

Failure handling is part of capability correctness.

## Cross-Wave Engineering Rules

The roadmap preserves these approved rules:

- no floating-point arithmetic for authoritative money.
- timestamps must be normalized according to approved platform conventions.
- domain ownership remains explicit.
- Python Intelligence does not directly update Core transactional truth.
- Search is derived and rebuildable.
- Redis is ephemeral.
- provider integrations use controlled adapter/boundary patterns.
- events are structured/versioned.
- retryable operations require idempotency where duplicate effects are possible.
- testing and security are integrated into every Work Unit.

## Explicitly Open Engineering Decisions

Phase 09 does not silently decide unresolved Engineering Foundation details.

Explicit open decisions include:

- exact physical money representation.
- exact public ID convention.
- exact event envelope/ID conventions.
- exact event broker.
- provider-specific integrations.
- exact numeric SLO/RPO/RTO targets.
- exact overlapping engineering/security tools where not already accepted.

These are resolved in the appropriate W00/domain Work Unit and through ADRs where architectural.

## Scheduling Rule

Atlazora does not invent an arbitrary implementation deadline before meaningful execution velocity exists.

Scheduling and forecasting should use actual measured delivery evidence once enough Work Units have been completed.

Business urgency may influence priority, but it must not cause foundations or completion gates to be silently skipped.

## Governance Relationship

Each Work Unit starts from Git-tracked project memory, including:

- `PROJECT_STATE.md`
- relevant Accepted ADRs
- relevant Wave/Work Unit documentation
- previous Handoff
- relevant architecture/product/domain documentation

Chat is a working execution surface, not permanent project memory.

## Related Documentation

- `../../ROADMAP.md`
- `../../PROJECT_STATE.md`
- `../../templates/DEFINITION_OF_DONE.md`
- `../../templates/WORK_UNIT_TEMPLATE.md`
- `../../templates/HANDOFF_TEMPLATE.md`
- `../../waves/wave-00/README.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`
