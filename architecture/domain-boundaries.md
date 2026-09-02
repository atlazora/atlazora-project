# Atlazora Domain Boundaries

## Purpose

Domain boundaries prevent business concepts, data ownership, and transactional responsibilities from collapsing into a single undifferentiated application model.

## Confirmed Modeling Boundaries

### User and Organization

A User and an Organization are different domain concepts.

Identity of an individual must not be used as a substitute for organizational ownership, membership, permissions, or commercial participation.

### Product and Offer

A Product describes what an item is.

An Offer represents a commercial proposition associated with a product and supplier context.

The two concepts must not be merged into one record merely for implementation convenience.

## Execution-Aligned Domain Areas

The approved Wave structure identifies major domain areas including:

- Identity
- Organizations
- Suppliers
- Verification
- Catalog
- Offers
- Search / Discovery
- RFQ
- Quotes
- Messaging
- Orders
- Samples
- Payments / Finance / Protection
- Logistics
- Inspection
- Disputes / Completion
- Reviews / Reputation
- Monetization

These are execution/domain areas, not a declaration that each requires an independent microservice.

## Ownership Rule

Each authoritative data type must have one owning domain/system.

Cross-domain consumers should use explicit APIs, events, or other approved contracts rather than direct accidental coupling.

## Service Extraction Rule

The initial target is a modular Go core.

A module is extracted only when a future Accepted ADR establishes a justified independent service boundary.

## Detailed Domain Model

The detailed Phase 05 Domain & Data Model remains an approved planning input and must be formalized in `domains/` and relevant ADRs during W00-WU01.
