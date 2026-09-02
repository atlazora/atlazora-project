# Architecture Decision Records

This directory contains Atlazora Architecture Decision Records (ADRs).

ADRs preserve important technical and architectural decisions independently of chat history.

## Statuses

Only these ADR statuses are valid:

- Proposed
- Accepted
- Superseded
- Deprecated
- Rejected

## Rules

1. Use the template at `templates/ADR_TEMPLATE.md`.
2. Give each ADR a stable sequential number.
3. Never delete an ADR merely because the decision changes.
4. Replace an obsolete accepted decision by creating or identifying the replacement ADR and marking the old record `Superseded`.
5. Record meaningful consequences and operational impact.
6. Fundamental decisions not already approved by planning should begin as `Proposed`.
7. Do not silently convert an undecided architectural question into an Accepted decision.
8. Relevant Work Units must reference the ADRs on which they depend.

## Naming

Preferred pattern:

`ADR-NNNN-short-decision-title.md`

Example:

`ADR-0001-product-offer-separation.md`

## Initial Accepted ADR Baseline

| ADR | Decision | Status |
|---|---|---|
| ADR-0001 | Product and Offer separation | Accepted |
| ADR-0002 | User and Organization separation | Accepted |
| ADR-0003 | Go transactional core | Accepted |
| ADR-0004 | Python intelligence boundary | Accepted |
| ADR-0005 | Vue 3 + TypeScript web/admin | Accepted |
| ADR-0006 | Modular-first progressive microservices | Accepted |
| ADR-0007 | PostgreSQL transactional truth | Accepted |
| ADR-0008 | Transactional Outbox from Day One | Accepted |
| ADR-0009 | Idempotency from Day One | Accepted |
| ADR-0010 | REST/OpenAPI versioned contracts | Accepted |
| ADR-0011 | Multi-repository strategy | Accepted |
| ADR-0012 | GCP / Dammam / GKE Autopilot | Accepted |
| ADR-0013 | Terraform / Infrastructure as Code | Accepted |
| ADR-0014 | Managed production data services | Accepted |
| ADR-0015 | S3-compatible object storage abstraction | Accepted |
| ADR-0016 | Redis ephemeral only | Accepted |
| ADR-0017 | Search derived and rebuildable | Accepted |
| ADR-0018 | Build once, promote immutable artifacts | Accepted |
| ADR-0019 | Progressive Semantic Migration | Accepted |
| ADR-0020 | One source of truth per data type during migration | Accepted |
| ADR-0021 | Testing and security integrated into every Work Unit | Accepted |
| ADR-0022 | Git as permanent project memory | Accepted |

## Baseline State

The initial ADR baseline contains exactly 22 Accepted decisions.

Future changes must follow the lifecycle rules above. Existing ADRs are preserved as historical records and are superseded rather than deleted when decisions change.
