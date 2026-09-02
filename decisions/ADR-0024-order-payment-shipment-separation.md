# ADR-0024 — Order, Payment, and Shipment Have Separate Domain Ownership

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 05 — Domain & Data Model
- **Related Wave(s):** W07–W11
- **Related Work Unit(s):** Order, Payment, Logistics, Inspection, Dispute, and Migration Work Units

## Context

A marketplace transaction includes related but distinct commercial, financial, and fulfillment lifecycles.

Treating Order, Payment, and Shipment as the same state machine would create ambiguous ownership and make partial payment, refunds, retries, multiple shipment activity, inspection gates, disputes, and provider reconciliation difficult to model correctly.

## Decision

Atlazora preserves explicit domain ownership between Order, Payment, and Shipment.

`Order != Payment`.

`Order != Shipment`.

The Order domain owns the authoritative commercial Order lifecycle and accepted commercial agreement state.

The Finance/Payment domain owns payment and financial lifecycle truth.

The Logistics/Fulfillment domain owns shipment and fulfillment lifecycle truth.

These domains coordinate through explicit contracts, state transitions, and events where applicable, but one domain's state must not be treated as a substitute for another domain's authoritative truth.

A provider browser return is not authoritative payment confirmation.

Where external payment providers are used, authoritative provider confirmation controls provider payment outcome according to the implemented payment flow.

Financial corrections must preserve historical/audit integrity through explicit adjustments, reversals, or other approved financial records rather than destructive rewriting of historical financial truth.

Inspection and dispute decisions may affect commerce, fulfillment, or finance, but those effects must propagate explicitly through the owning domains.

Exact provider, ledger, money representation, shipment-provider, and physical schema choices remain subject to their owning Work Units and decisions.

## Rationale

Separating these lifecycles preserves:

- clear source-of-truth ownership.
- correct retry and idempotency behavior.
- provider reconciliation.
- partial/multiple fulfillment capability where supported.
- dispute and refund traceability.
- independent evolution of commercial, financial, and logistics workflows.

## Alternatives Considered

### Single Order State Machine for Commerce, Payment, and Shipment

Rejected because unrelated lifecycle transitions would become coupled and ambiguous.

### Payment Status as Order Financial Truth

Rejected because provider and financial lifecycle state requires independent ownership and reconciliation.

### Shipment Status as Order Fulfillment Truth

Rejected because fulfillment may have its own entities, retries, providers, partial activity, and operational lifecycle.

## Consequences

### Positive

- Clear domain boundaries.
- Better financial correctness.
- Better fulfillment modeling.
- Easier provider integration.
- Stronger audit and dispute handling.
- Reduced hidden coupling between commerce and external providers.

### Negative / Trade-offs

- Cross-domain coordination requires explicit contracts/events.
- More than one lifecycle must be observed operationally.
- Eventual coordination paths require idempotency and failure handling.

## Security Impact

Authorization must respect domain ownership and prevent unauthorized cross-domain state mutation.

Financial and fulfillment operations require appropriate privilege separation and auditability.

## Data / Migration Impact

Legacy records that combine commercial, payment, or shipment state may require semantic decomposition during migration.

Each resulting data type must preserve one authoritative source of truth during migration.

## Operational Impact

Operations must be able to inspect correlated Order, Payment, Shipment, inspection, and dispute state without relying on unsafe direct database edits.

## Related Decisions

- ADR-0007 — PostgreSQL as Transactional Source of Truth
- ADR-0008 — Transactional Outbox From Day One
- ADR-0009 — Idempotency From Day One
- ADR-0019 — Progressive Semantic Migration
- ADR-0020 — One Source of Truth Per Data Type During Migration
- ADR-0023 — Accepted Commercial Terms Are Immutable Historical Truth
- ADR-0025 — Admin and Operations Use Approved Application Boundaries

## Supersession

None.
