# Atlazora System Overview

## Architecture Direction

Atlazora uses a multi-repository architecture with a modular transactional core and deliberately separated user-facing, intelligence, contract, and infrastructure concerns.

The target is not a collection of microservices from day one.

The approved approach is:

**Modular Architecture first, progressive microservices when justified.**

## Official Components

### `atlazora-web`

Vue 3 + TypeScript application for Marketplace, Buyer, and Supplier experiences.

### `atlazora-admin`

Vue 3 + TypeScript application for administrative and operational workflows.

### `atlazora-core`

Go-based transactional modular core.

It owns transactional domain behavior and authoritative transactional state according to domain ownership rules.

### `atlazora-intelligence`

Python boundary for intelligence, analytics, ranking, enrichment, and data-oriented workloads.

It must not become an accidental transactional system of record.

### `atlazora-contracts`

Versioned OpenAPI definitions, event schemas, and shared contracts.

### `atlazora-infra`

Terraform, cloud infrastructure, deployment, and environment configuration.

### `Atlazora-original-laravel`

Legacy/reference implementation used for understanding existing behavior and supporting migration.

It is not the target runtime architecture.

### `atlazora-project`

Permanent project memory and governance.

## Architectural Principles

- Product and Offer are distinct concepts.
- User and Organization are distinct concepts.
- PostgreSQL is the transactional source of truth.
- Transactional Outbox is foundational.
- Idempotency is foundational.
- APIs are versioned through REST/OpenAPI contracts.
- Search data is derived and rebuildable.
- Redis is ephemeral only.
- Infrastructure is managed as code.
- Artifacts are built once and promoted immutably.
- Migration is progressive and semantic.
- Every data type has one source of truth during migration.
- Testing and security are integrated into each Work Unit.

## Evolution Strategy

A module may later become an independently deployed service when justified by clear scaling, ownership, reliability, security, or operational needs.

Extraction must be a conscious architectural decision and must not create duplicate truth ownership.
