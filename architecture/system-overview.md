# Atlazora System Overview

## Architecture Direction

Atlazora uses a multi-repository architecture with a modular transactional core and deliberately separated user-facing, intelligence, contract, infrastructure, migration, and governance concerns.

The target is not a collection of microservices from Day One.

The approved approach is:

**Modular Architecture first, progressive microservices when justified.**

## Official Components

### `atlazora-web`

React 19 + Next.js 16 + TypeScript application for Marketplace, Buyer, and Supplier experiences, with Tailwind CSS 4 and the independent Atlazora Design System.

It consumes approved platform APIs/contracts and does not own authoritative transactional state.

### `atlazora-admin`

React + TypeScript application for administrative and operational workflows. Its exact application framework is finalized during W00-WU08 readiness and implementation planning.

Admin must operate through approved application APIs and domain behavior.

Direct database manipulation is not an approved Admin integration mechanism.

### `atlazora-core`

Go-based transactional modular core.

It owns transactional domain behavior and authoritative transactional state according to domain ownership rules.

API and Worker processes may be deployed/scaled separately from the same Core codebase where appropriate without implying separate services.

### `atlazora-intelligence`

Python boundary for intelligence, analytics, ranking, enrichment, scoring, and data-oriented workloads.

Python may analyze, derive, and score.

The Go transactional Core remains responsible for authoritative transactional decisions and state.

Python intelligence must not directly mutate Core-owned transactional database state.

### `atlazora-contracts`

Owns versioned OpenAPI definitions, event schemas, and shared platform contracts.

### `atlazora-infra`

Owns Terraform, cloud infrastructure, deployment, and environment configuration.

### `Atlazora-original-laravel`

Legacy/reference implementation used for understanding existing behavior and supporting Progressive Semantic Migration.

It is not the target runtime architecture or permanent transactional core.

### `atlazora-project`

Permanent Git-tracked project memory and governance.

## Synchronous Integration

REST/OpenAPI is the approved V1 synchronous contract direction.

Contracts must be versioned and compatibility-aware.

Retryable operations must consider idempotency.

Timeouts, validation, error semantics, and correlation/context must be explicit where applicable.

## Asynchronous Integration

Structured versioned events are used where asynchronous integration is appropriate.

Transactional Outbox is foundational for reliable event publication from transactional state changes.

Consumers must tolerate duplicate, delayed, retried, and potentially reordered delivery.

The exact broker remains unresolved.

The approved direction is to begin with a lightweight reliable transport appropriate to actual needs rather than adopting Kafka by default.

## Data Ownership

PostgreSQL is the transactional source of truth.

A shared initial PostgreSQL cluster is permitted.

Shared physical storage does not imply shared write ownership.

Every authoritative data type has one owning domain.

Cross-domain distributed database transactions are not the normal integration model.

## Search and Ephemeral State

Search is derived and rebuildable.

The long-term search direction is OpenSearch-compatible capability, while exact provider/deployment choices remain open.

Redis is ephemeral only and must not hold irreplaceable transactional truth.

## Object Storage

Application file/document storage uses an S3-compatible abstraction.

Document handling must support appropriate public/private/sensitive classification and authorization.

## Architectural Principles

- Product and Offer are distinct concepts.
- User and Organization are distinct concepts.
- PostgreSQL is the transactional source of truth.
- Transactional Outbox is foundational.
- Idempotency is foundational.
- APIs are versioned through REST/OpenAPI contracts.
- business events are structured and versioned.
- Search data is derived and rebuildable.
- Redis is ephemeral only.
- Python intelligence does not directly mutate Core transactional truth.
- Admin operates through APIs/domain behavior rather than database shortcuts.
- Infrastructure is managed as code.
- artifacts are built once and promoted immutably.
- migration is progressive and semantic.
- every data type has one source of truth during migration.
- testing and security are integrated into each Work Unit.

## Localization

Arabic and English are the initial supported product languages.

The architecture remains extensible for additional languages and must support applicable RTL/LTR behavior.

## Evolution Strategy

A module may later become an independently deployed service when justified by clear:

- scaling.
- ownership.
- reliability.
- security.
- deployment.
- operational requirements.

Extraction must be a conscious architectural decision and must not create duplicate truth ownership.

A new service repository is created only when a real service extraction is approved and implemented.

## Explicitly Open

The target architecture does not yet finalize:

- exact event broker.
- exact event envelope/ID conventions.
- exact public ID convention.
- exact physical money representation.
- exact Search provider/deployment.
- provider-specific integrations.
- numeric SLO/RPO/RTO targets.

These remain explicit later decisions.
