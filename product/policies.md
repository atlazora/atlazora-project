# Atlazora Product Policies

## Purpose

This document records product-level policies that affect implementation across multiple domains.

## Confirmed Policies

### Permanent Project Memory

Git-tracked documentation is the permanent project memory.

Chat history must never be the only source of a product or architecture decision.

### Foundation Before Convenience

Any V1 foundation required for correctness, security, operability, scalability, or avoidance of painful rebuilds must be implemented when first needed.

### Explicit Source of Truth

Each transactional data type must have one authoritative source of truth.

During migration, ownership may move progressively, but ambiguity about authority is not allowed.

### Legacy Role

`Atlazora-original-laravel` is a legacy/reference repository.

Legacy behavior is an input to migration and gap analysis, not an automatic specification for the target architecture.

### Contract Discipline

Externally meaningful APIs and shared schemas must be versioned and represented through the contracts repository.

### Security and Testing

Testing and security are integrated into every applicable Work Unit and are not end-of-project activities.

### Completion Discipline

A Work Unit is not `COMPLETE` until its applicable Definition of Done passes and a formal Handoff exists.

## Pending Formalization

Any additional commercial, operational, moderation, marketplace, supplier, buyer, dispute, payment, or monetization policies approved in Phases 01–03 must be imported here or into the appropriate domain documentation before W00-WU01 completion.
