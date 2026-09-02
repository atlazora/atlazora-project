# Atlazora Business Flows

## Purpose

This document is the Git-tracked index for end-to-end business flows approved during Phase 03.

Implementation Work Units must preserve the business lifecycle across domain and repository boundaries.

## Confirmed Flow Areas

The execution roadmap confirms the following major business flow areas:

- identity and organization participation
- supplier onboarding and verification
- catalog management
- commercial offers
- buyer search and discovery
- RFQ creation and supplier quotation
- buyer/supplier messaging around commercial workflows
- orders
- samples
- payments and finance/protection flows
- logistics
- inspection
- disputes and completion
- reviews and reputation
- monetization

## Cross-Cutting Flow Requirements

Business flows must be designed with:

- explicit authorization boundaries
- validation and invariant enforcement
- reliable transactional state changes
- idempotent handling where retry or duplicate delivery is possible
- traceable operational/audit history where required
- versioned external contracts
- defined failure and recovery behavior
- migration compatibility while legacy and new systems coexist

## System Boundary Rule

The Go transactional core owns transactional business behavior.

The Python intelligence boundary may derive, analyze, rank, or enrich data but must not silently become the source of transactional truth.

Search is derived and rebuildable.

## Migration Rule

During semantic migration, one source of truth must exist for each data type at any given point in the migration.

## Planning Status

The detailed Phase 03 End-to-End Business Flows are approved inputs.

This document currently records only flow areas and cross-cutting requirements that are already confirmed in the execution and architecture baseline. Detailed step-by-step actor flows must be imported from the approved planning material before W00-WU01 completion.
