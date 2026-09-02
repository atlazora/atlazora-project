# W00 â€” Engineering Foundation

## Status

IN_PROGRESS

## Purpose

W00 establishes the engineering platform required to implement Atlazora feature Waves safely and consistently.

The goal is not merely to create repository skeletons.

W00 establishes the foundations for:

- local development.
- transactional Core development.
- versioned contracts.
- reliable events/outbox.
- Intelligence workloads.
- Web.
- Admin/Operations.
- infrastructure.
- CI/CD and supply chain.
- observability.
- security.
- integrated foundation verification.

## Execution Rules

- Work follows Phase â†’ Wave â†’ Work Unit â†’ Task.
- Implementation should deliver coherent vertical slices where applicable.
- Only one primary Work Unit may be `IN_PROGRESS` for solo development.
- A side task may proceed only when the primary Work Unit is genuinely blocked.
- Each Work Unit must satisfy Definition of Ready before execution.
- Each Work Unit must satisfy Definition of Done and produce a formal Handoff before completion.
- Relevant Accepted ADRs are mandatory inputs.
- Testing, security, observability, and documentation are part of capability delivery where applicable.
- Foundations required for V1 correctness, security, operability, scalability, or safe evolution must not be deferred merely to reduce early scope.

## Work Units

| Work Unit | Name | Status |
|---|---|---|
| W00-WU01 | Project Governance & Repositories | COMPLETE |
| W00-WU02 | Local Development Platform | COMPLETE |
| W00-WU03 | Go Core Foundation | IN_PROGRESS |
| W00-WU04 | Contracts Foundation | PLANNED |
| W00-WU05 | Event & Outbox Foundation | PLANNED |
| W00-WU06 | Python Intelligence Foundation | PLANNED |
| W00-WU07 | Web Foundation | PLANNED |
| W00-WU08 | Admin Foundation | PLANNED |
| W00-WU09 | Infrastructure Foundation | PLANNED |
| W00-WU10 | CI/CD & Supply Chain | PLANNED |
| W00-WU11 | Observability Foundation | PLANNED |
| W00-WU12 | Security Baseline | PLANNED |
| W00-WU13 | Foundation Integration Test | PLANNED |

## W00-WU01 â€” Project Governance & Repositories

Establish permanent Git project memory, repository governance, ADRs, execution standards, GitHub governance, and approved planning preservation.

Current status: `COMPLETE`.

## W00-WU02 â€” Local Development Platform

Establish the reproducible local development platform and required local service dependencies.

Status: COMPLETE.

## W00-WU03 â€” Go Core Foundation

Establish the modular Go transactional Core foundation.

Status: IN_PROGRESS.

## W00-WU04 â€” Contracts Foundation

Establish versioned OpenAPI, event, and shared-contract foundations.

Status: `PLANNED`.

## W00-WU05 â€” Event & Outbox Foundation

Establish Transactional Outbox, idempotent consumption, and foundational asynchronous integration behavior.

The exact broker remains open until formally resolved.

Status: `PLANNED`.

## W00-WU06 â€” Python Intelligence Foundation

Establish Python intelligence/data workload foundations while preserving the transactional ownership boundary.

Status: `PLANNED`.

## W00-WU07 â€” Web Foundation

Establish the Vue 3 + TypeScript Marketplace/Buyer/Supplier Web foundation.

Status: `PLANNED`.

## W00-WU08 â€” Admin Foundation

Establish the Vue 3 + TypeScript Admin/Operations foundation using approved APIs/domain behavior.

Status: `PLANNED`.

## W00-WU09 â€” Infrastructure Foundation

Establish Terraform/GCP infrastructure foundations according to the approved infrastructure architecture.

Status: `PLANNED`.

## W00-WU10 â€” CI/CD & Supply Chain

Establish CI/CD, immutable artifact flow, and applicable supply-chain controls.

Status: `PLANNED`.

## W00-WU11 â€” Observability Foundation

Establish foundational logging, metrics, correlation/tracing where applicable, health visibility, and operational diagnostics.

Status: `PLANNED`.

## W00-WU12 â€” Security Baseline

Establish the engineering security baseline required by subsequent feature Waves.

Status: `PLANNED`.

## W00-WU13 â€” Foundation Integration Test

Verify the complete W00 foundation as an integrated engineering platform.

Status: `PLANNED`.

## Current Work

W00-WU03 — Go Core Foundation is the only primary Work Unit currently IN_PROGRESS.

W00-WU01 and W00-WU02 are COMPLETE with Final Handoffs recorded. W00-WU03 Definition of Ready has passed and implementation is IN_PROGRESS.

## Completion Target

W00 reaches its engineering-platform milestone when the approved W00 Work Units have passed their respective completion gates and the Foundation Integration Test demonstrates sufficient readiness for feature Waves.

This corresponds to:

**M0 â€” Engineering Platform Ready**
