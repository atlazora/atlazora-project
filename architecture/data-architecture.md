# Atlazora Data Architecture

## Transactional Source of Truth

PostgreSQL is the approved source of transactional truth for the Atlazora transactional platform.

Authoritative business state must not be silently duplicated across systems.

## One Source of Truth

During both normal operation and migration, every data type must have one clearly identified authoritative source.

Temporary replication and derived projections are permitted.

Ambiguous write ownership is not.

## Derived Data

Search indexes, caches, analytical projections, and intelligence outputs are derived data.

They must be reproducible from authoritative sources where applicable.

## Search

Search is explicitly derived and rebuildable.

Loss or corruption of the search index must not imply loss of authoritative marketplace transaction data.

## Redis

Redis is approved for ephemeral workloads only.

It must not be the sole durable source for transactional business truth.

Appropriate uses may include caching, short-lived coordination, rate-control state, or similar ephemeral concerns when safely designed.

## Object Storage

Object storage must use an S3-compatible abstraction so application-level storage behavior is not unnecessarily coupled to one provider-specific interface.

## Managed Production Data Services

Production data infrastructure should use managed services where this improves reliability, backups, availability, patching, and operational safety.

## Migration

Atlazora uses Progressive Semantic Migration.

Migration must explicitly define:

- current source of truth
- target source of truth
- ownership transition
- compatibility period
- validation
- rollback or recovery strategy
- completion criteria

## Detailed Model

Schemas, relationships, retention requirements, and domain-specific ownership from Phase 05 must be formalized in domain documentation and implementation migrations as execution proceeds.
