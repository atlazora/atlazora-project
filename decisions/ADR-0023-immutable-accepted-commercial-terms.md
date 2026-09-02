# ADR-0023 — Accepted Commercial Terms Are Immutable Historical Truth

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 05 — Domain & Data Model
- **Related Wave(s):** W06–W11
- **Related Work Unit(s):** RFQ, Quote, Order, Finance, Dispute, and Migration Work Units

## Context

Atlazora commercial transactions may progress through RFQ negotiation, multiple Quote revisions, acceptance, Order creation, payment, fulfillment, inspection, and dispute handling.

If later negotiation, catalog changes, Offer changes, or administrative edits can silently rewrite the commercial terms that were actually accepted, historical transaction truth becomes ambiguous.

That would weaken dispute handling, finance reconciliation, auditability, migration correctness, and operational support.

## Decision

Accepted commercial terms are immutable historical truth.

Quote revisions create new QuoteVersion records rather than destructively rewriting accepted commercial history.

Once accepted, the authoritative QuoteVersion used for the transaction must remain historically traceable.

Order creation records the accepted commercial snapshot required to explain the agreement represented by that Order.

Later changes to Product, Offer, pricing, organization profile, negotiation, or policy must not silently rewrite the historical accepted Order commercial snapshot.

Where a legitimate post-acceptance commercial change is supported, it must use an explicit domain workflow that preserves the previous state and the reason for change.

Exact physical schema and persistence representation are finalized in the owning implementation Work Units.

## Rationale

Marketplace transactions require the system to answer what commercial terms were actually agreed at the time of acceptance.

Preserving immutable historical agreement data supports:

- dispute resolution.
- finance reconciliation.
- auditability.
- customer and supplier support.
- semantic migration.
- reproducible transaction history.

## Alternatives Considered

### Rewrite the Existing Quote

Rejected because later negotiation would destroy historical agreement truth.

### Reconstruct Historical Terms From Current Product / Offer Data

Rejected because current catalog or Offer state may differ from the terms actually accepted.

### Store Only References to Mutable Commercial Records

Rejected where those references cannot reproduce the accepted historical agreement.

## Consequences

### Positive

- Accepted agreement history remains explainable.
- Disputes can reference the actual accepted terms.
- Migration can preserve historical commercial meaning.
- Later catalog changes do not corrupt transaction history.
- Audit and operational investigation become stronger.

### Negative / Trade-offs

- Versioning and snapshot persistence require additional storage and implementation discipline.
- Legitimate post-acceptance changes require explicit workflows rather than destructive updates.

## Security Impact

Authorization must prevent unauthorized modification or replacement of accepted commercial history.

Sensitive commercial snapshots must follow appropriate access controls.

## Data / Migration Impact

Migration must preserve the historical meaning of accepted commercial records where source data permits.

Legacy mutable structures may require semantic transformation into versioned or snapshot-based target records.

## Operational Impact

Admin/Ops tooling must expose supported correction/change workflows rather than silently editing accepted historical commercial truth.

## Related Decisions

- ADR-0001 — Product and Offer Are Separate Domain Concepts
- ADR-0007 — PostgreSQL as Transactional Source of Truth
- ADR-0019 — Progressive Semantic Migration
- ADR-0020 — One Source of Truth Per Data Type During Migration
- ADR-0024 — Order, Payment, and Shipment Have Separate Domain Ownership

## Supersession

None.
