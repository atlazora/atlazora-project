# ADR-0001 — Product and Offer Are Separate Domain Concepts

- **Status:** Accepted
- **Date:** 2026-09-02
- **Decision Owners:** Atlazora
- **Related Phase:** Phase 05 — Domain & Data Model
- **Related Wave(s):** W03, W04
- **Related Work Unit(s):** Future Catalog and Offer Work Units

## Context

Marketplace implementations often collapse product description and commercial selling terms into a single record. This creates ownership ambiguity, duplicated catalog data, and difficulty supporting multiple suppliers or commercial propositions for the same product concept.

## Decision

Atlazora will model Product and Offer as separate domain concepts.

A Product represents what an item is.

An Offer represents a supplier-specific or commercial proposition associated with a Product.

## Rationale

This separation provides clear domain ownership and allows commercial terms to evolve independently from product identity and descriptive information.

## Alternatives Considered

### Combined Product/Offer Record

Rejected because it couples catalog identity to supplier and commercial state.

## Consequences

### Positive

- Clear catalog and commercial boundaries.
- Multiple Offers can reference a Product.
- Better support for supplier-specific commercial terms.
- Cleaner search and discovery projections.

### Negative / Trade-offs

- Additional relationships and domain coordination are required.

## Security Impact

Authorization must distinguish permissions for managing Products from permissions for managing Offers.

## Data / Migration Impact

Legacy records may require semantic decomposition into Product and Offer entities during migration.

## Operational Impact

Search and derived views may combine Product and Offer data but must preserve authoritative ownership.

## Related Decisions

- ADR-0020 — One Source of Truth Per Data Type During Migration

## Supersession

None.
