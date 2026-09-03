# Phase 06 — Target Architecture

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 06 defines the approved target software architecture for Atlazora V1 and its evolution path.

The architecture is designed to support a correct, secure, operable, scalable V1 without prematurely introducing unnecessary distributed-system complexity.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Architecture Direction

Atlazora uses:

- React + TypeScript for Web and Admin presentation applications; `atlazora-web` uses React 19 + Next.js 16 + Tailwind CSS 4, while the exact `atlazora-admin` application framework is finalized during W00-WU08 readiness.
- Go for the primary transactional Core.
- Python for intelligence, analytics, ranking, enrichment, and data-oriented workloads.
- PostgreSQL as transactional truth.
- versioned REST/OpenAPI contracts.
- structured versioned business events.
- Transactional Outbox from Day One.
- idempotency from Day One.
- derived/rebuildable Search.
- ephemeral-only Redis.
- S3-compatible object-storage abstraction.
- Terraform-managed infrastructure.

The legacy Laravel application is transitional/reference software rather than the target transactional architecture.

## Modular First

The Go transactional Core begins as a modular architecture.

The target is not microservices from Day One.

Modules may later be extracted into independent services only when justified by evidence such as:

- independent scaling requirements.
- reliability/isolation needs.
- security boundaries.
- operational ownership.
- deployment independence.
- materially different workload characteristics.

A new repository must not be created merely to simulate a microservice boundary.

Service extraction requires an explicit architectural decision.

## Transactional Core

`atlazora-core` owns primary transactional domain behavior according to the approved domain ownership model.

The Core may expose separately scalable runtime processes such as:

- API process.
- Worker/background process.

These may share the same Core codebase while scaling independently.

Separate runtime processes do not automatically imply separate services or repositories.

## Python Intelligence Boundary

`atlazora-intelligence` owns intelligence/data-oriented workloads such as:

- ranking.
- scoring.
- enrichment.
- analytics-oriented processing.
- data/ML workloads.

The approved boundary is:

**Python may analyze and score; the transactional Core decides and owns transactional state.**

Python intelligence must not directly mutate Core-owned transactional database state.

Where Python-derived output affects business behavior, the Core consumes that output through an explicit contract and applies the authoritative domain decision.

The Intelligence repository may expose API and worker processes where needed.

## Web Architecture

`atlazora-web` is the React 19 + Next.js 16 + TypeScript application for:

- Marketplace.
- Buyer experience.
- Supplier experience.

It communicates with platform capabilities through approved APIs/contracts.

It must not become an independent source of transactional business truth.

## Admin Architecture

`atlazora-admin` is a separate React + TypeScript deployable for administrative and operational workflows. Its exact application framework is finalized during W00-WU08 readiness.

Admin operates through approved application APIs and domain behaviors.

Direct database manipulation is not an approved Admin integration mechanism.

Operational convenience must not bypass:

- authorization.
- domain validation.
- audit.
- financial controls.
- workflow rules.

## Contracts

`atlazora-contracts` owns executable/shared platform contracts, including:

- OpenAPI definitions.
- event schemas.
- shared contract definitions.

REST/OpenAPI is the approved V1 synchronous contract direction.

Contracts must be:

- versioned.
- compatibility-aware.
- explicit about validation.
- explicit about errors.
- traceable through correlation/context identifiers where applicable.
- designed with timeout/retry behavior in mind.
- idempotency-aware where retry can create duplicate effects.

## Data Architecture

PostgreSQL is the transactional source of truth.

A shared PostgreSQL cluster is acceptable initially for the modular architecture.

However:

- every authoritative data type has one owner.
- direct cross-domain writes are not allowed merely because data is physically co-located.
- modules interact through controlled application boundaries.
- physical co-location does not remove logical ownership.
- distributed database transactions are not the normal cross-domain integration model.

## Event Architecture

Transactional Outbox is foundational.

When transactional state changes require reliable publication, durable event-publication intent is committed with the applicable transactional change.

Business events are structured and versioned.

Consumers must assume delivery can be:

- duplicated.
- retried.
- delayed.
- reordered.

Correctness must not rely on unrealistic exactly-once delivery assumptions.

## Event Transport Direction

The approved direction is to begin with a lightweight, reliable event transport/broker appropriate to actual V1 needs.

Kafka is not required merely because the architecture is event-aware.

Kafka or another higher-complexity platform should be adopted only when justified by real throughput, replay, partitioning, ecosystem, or operational requirements.

The exact broker remains unresolved and belongs to the appropriate Engineering Foundation decision.

## Search

Search is derived and rebuildable.

Search infrastructure does not own authoritative Product, Offer, Supplier, or transaction truth.

The long-term approved search direction is OpenSearch-compatible search capability, while exact provider/deployment details remain subject to infrastructure decisions.

## Redis

Redis is ephemeral only.

It may support suitable caching, rate control, short-lived coordination, or disposable derived state.

Redis must not become the only durable owner of transactional business truth.

## Object Storage

Files/documents use an S3-compatible application abstraction.

The target must support appropriate classifications such as:

- public.
- private.
- sensitive.

Authorization and security controls apply according to classification.

## Notifications

Notifications are cross-domain outcomes rather than authoritative owners of originating business state.

Notification delivery should be driven through explicit application/event integration rather than hidden transactional coupling.

## Security

Security is integrated into architecture and every applicable Work Unit.

Important architectural security concerns include:

- authentication.
- organization-aware authorization.
- least privilege.
- validation.
- sensitive data handling.
- secrets.
- auditability.
- secure contracts.
- externally exposed trust boundaries.

## Observability

The target architecture must support traceability across synchronous and asynchronous flows through appropriate:

- structured logs.
- metrics.
- correlation identifiers.
- error reporting.
- event publication/consumption visibility.
- failure/retry visibility.

Exact tooling and numeric SLOs are resolved in later infrastructure/operations work.

## Localization

Arabic and English are the initial product languages.

The architecture remains extensible for additional languages.

Frontend and content foundations must support RTL/LTR behavior where applicable.

## Official Repository Boundaries

The official repositories are exactly:

1. `Atlazora-original-laravel`
2. `atlazora-project`
3. `atlazora-web`
4. `atlazora-admin`
5. `atlazora-core`
6. `atlazora-intelligence`
7. `atlazora-contracts`
8. `atlazora-infra`

No additional service repository is created unless a real service extraction is approved and implemented.

## Migration Relationship

The target architecture supports Progressive Semantic Migration.

Legacy Laravel remains migration/reference input until verified cutover and retirement.

One source of truth per data type must be maintained during migration.

## Open / Unresolved

Phase 06 intentionally does not finalize:

- exact event broker.
- exact event envelope/ID conventions.
- exact money representation.
- public ID convention.
- exact Search provider/deployment.
- exact infrastructure SKUs.
- provider-specific payment/logistics/inspection integrations.
- exact numeric SLO/RPO/RTO targets.

These remain explicit future decisions rather than assumptions.

## Rejected Architecture Directions

The approved target rejects:

- microservices merely for architectural fashion.
- Python directly mutating Core transactional truth.
- Admin direct-database operational shortcuts.
- Search as transactional truth.
- Redis as durable transactional truth.
- uncontrolled cross-domain writes.
- permanent Laravel transactional ownership.
- new service repositories without real extraction.
- distributed database transactions as the default integration strategy.
- Kafka by default without demonstrated need.

## Related Documentation

- `../../architecture/system-overview.md`
- `../../architecture/domain-boundaries.md`
- `../../architecture/data-architecture.md`
- `../../architecture/event-architecture.md`
- `../../architecture/security-architecture.md`
- `../../architecture/infrastructure.md`
- `../../domains/README.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Execution Relationship

W00 Engineering Foundation establishes the implementation foundations required to realize this architecture.

Later domain Waves build vertical capabilities without silently changing these approved architectural boundaries.
