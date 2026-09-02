# Atlazora V1 Scope

## V1 Direction

Atlazora V1 is implemented through the execution Waves defined in `ROADMAP.md`.

The Waves describe the intended progression of platform capability:

1. Engineering Foundation
2. Identity & Organizations
3. Supplier & Verification
4. Catalog
5. Offers
6. Search & Discovery
7. RFQ / Quotes / Messaging
8. Orders & Samples
9. Payments / Finance / Protection
10. Logistics
11. Inspection
12. Disputes / Completion
13. Reviews / Reputation
14. Monetization
15. Platform Completion
16. Legacy Final Migration
17. Cutover Readiness
18. Legacy Retirement

## Scope Rule

Wave ordering is an execution sequence, not permission to postpone foundations.

Examples of foundations that must be introduced when first required include:

- authorization
- validation
- versioned contracts
- transactional consistency
- outbox/event reliability
- idempotency
- auditability
- observability
- infrastructure as code
- CI and security controls
- safe migration mechanisms

## Architecture Scope

V1 is built around:

- Vue 3 + TypeScript marketplace web application
- Vue 3 + TypeScript admin/operations application
- Go transactional modular core
- Python intelligence/data boundary
- PostgreSQL transactional source of truth
- Redis for ephemeral use only
- rebuildable derived search
- versioned REST/OpenAPI contracts
- event-driven integration where appropriate
- GCP deployment architecture
- Terraform-managed infrastructure

## Repository Scope

The eight official repositories listed in the root `README.md` define the current repository boundary.

Additional service repositories are not part of the V1 baseline unless a future Accepted ADR explicitly extracts a module into an independently deployable service.

## Planning Status

The detailed Phase 02 V1 Functional Scope is an approved planning input.

This file currently preserves the confirmed implementation and architectural V1 boundary. Feature-level acceptance details from the approved Phase 02 material must be formally imported before W00-WU01 can be declared complete.
