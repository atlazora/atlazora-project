# Phase 08 — Migration Strategy

## Status

Planning complete and formally preserved in Git during W00-WU01.

## Purpose

Phase 08 defines the approved strategy for migrating Atlazora from the legacy Laravel system to the target architecture.

The approved strategy is:

**Progressive Semantic Migration**

Migration preserves business meaning and validated historical facts rather than mechanically copying legacy implementation structure.

The authoritative preservation source is:

`../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Migration Principle

The legacy Laravel system is:

- a reference for existing behavior.
- a source of historical data where validated.
- a migration input.
- temporarily operational where required during transition.

It is not the target domain model or permanent transactional architecture.

Legacy implementation details must not silently become target requirements merely because they exist in old code.

## Progressive Semantic Migration

Migration proceeds capability/data-area by capability/data-area.

For each migrated area, the team must understand:

1. legacy meaning.
2. target meaning.
3. semantic mapping.
4. transformation rules.
5. ownership before migration.
6. ownership after migration.
7. compatibility/coexistence requirements.
8. validation criteria.
9. rollback/recovery strategy.
10. completion/cutover criteria.

Migration is not a blind table-to-table copy.

## One Source of Truth

Every authoritative data type has one source of truth at any point in the migration.

Temporary coexistence is permitted.

Ambiguous ownership is not.

The migration plan must explicitly identify which system is authoritative before and after cutover for the relevant data.

## Dual-Write Rule

Random or uncontrolled dual writes are not an approved migration strategy.

If temporary synchronization is ever required, it must have:

- explicit ownership.
- explicit direction.
- idempotency.
- conflict behavior.
- observability.
- reconciliation.
- a removal/cutover plan.

A temporary migration mechanism must not become permanent hidden architecture.

## Legacy Identity

Where migrated records require traceability to legacy data, the target model/migration tooling may preserve explicit migration metadata such as:

- `legacy_source`
- `legacy_id`

These identifiers support:

- traceability.
- repeatable imports.
- idempotency.
- reconciliation.
- audit/debugging.
- migration validation.

Legacy identifiers do not replace the target system's own identity strategy.

The exact target/public ID convention remains a separate open decision.

## ETL / Migration Jobs

Migration jobs must be designed to be repeatable and idempotent.

Re-running an import must not silently create duplicate target business records.

Migration execution should provide appropriate:

- extraction.
- transformation.
- loading.
- validation.
- error reporting.
- progress visibility.
- reconciliation.
- retry/recovery.

Exact migration tooling is selected during implementation.

## Validation

Migration completion is based on evidence rather than successful script exit alone.

Validation may include, where applicable:

- record counts.
- semantic/business-rule checks.
- ownership checks.
- referential checks.
- financial reconciliation.
- sample/manual verification.
- duplicate detection.
- missing-data detection.
- target-domain invariant checks.

Validation requirements depend on the risk of the migrated data.

## Missing Legacy Facts

Missing historical facts must not be invented.

If the legacy system does not contain reliable evidence for a target field or state, migration must:

- leave the value appropriately unknown/null where valid.
- derive it only when an approved deterministic rule exists.
- flag it for review where required.
- record a migration limitation where appropriate.

Migration must not fabricate historical commercial, financial, verification, or operational facts merely to satisfy a target schema.

## Semantic Mapping

The approved migration analysis includes the following broad mappings.

### Identity / Organizations

Legacy user/vendor/account concepts are migration inputs.

The target preserves the approved separation:

**User != Organization**

Organization membership, ownership, roles, and commercial capabilities are represented explicitly in the target model.

### Catalog

Legacy product/category/media concepts may provide reusable historical/content data.

Target Catalog semantics follow the approved target domain model.

### Product / Offer

Legacy supplier-product associations such as ProductSupplier are migration inputs.

The target preserves:

**Product != Offer**

Legacy structures must not force Product and supplier-specific commercial terms back into one target concept.

### Money / Currency / Tax

Legacy assumptions such as single-currency behavior or hardcoded tax behavior are not target architecture requirements.

Migration must map only known historical facts.

Exact target money representation remains a separate Engineering Foundation decision.

### Orders

Useful historical order facts may be migrated.

The target Order model follows the approved commerce invariants and must not inherit legacy structural weaknesses merely for schema similarity.

Historical commercial truth must be preserved where reliable.

### Finance / Payments

Legacy payment/provider/accounting records are migration inputs.

They must be mapped into the target Finance model without fabricating financial state.

Provider-specific legacy assumptions do not automatically become permanent target provider architecture.

### Cart

Legacy cart data/behavior does not define the target B2B commercial truth model.

Any migration or compatibility requirement is evaluated deliberately.

### Logistics / Delivery

Legacy delivery/driver concepts are migration inputs where relevant.

They map semantically into the target Shipment/Logistics model rather than forcing legacy implementation boundaries into the new system.

### Reviews / Returns

Legacy review/return scaffolding must be evaluated for actual reliable data before migration.

Incomplete legacy functionality must not be presented as completed historical business truth.

Target Trust and Dispute/Refund behavior follows the approved target domains.

### Admin / UI

Legacy Admin, Supplier, and Vue UI assets may inform experience migration.

UI reuse does not imply reuse of legacy domain ownership or direct database workflows.

## Media and Files

Legacy file/media migration must consider:

- source existence.
- ownership.
- target classification.
- authorization.
- integrity.
- metadata.
- duplicates.
- missing files.
- public/private/sensitive handling.

Migration must not automatically make legacy files public merely because their old storage path was accessible.

## Migration Execution

Migration tooling belongs in the appropriate implementation repository according to ownership.

Migration scripts/jobs must be:

- version controlled.
- reviewable.
- repeatable.
- idempotent where applicable.
- observable.
- recoverable.
- documented.

Production migration execution must not rely on undocumented one-off commands as permanent process.

## Rehearsal

Material production migration must be rehearsed using representative data/environment conditions where feasible.

Rehearsal should validate:

- execution procedure.
- duration.
- resource requirements.
- transformation behavior.
- validation.
- reconciliation.
- failure handling.
- rollback/recovery.

## Cutover

A data area moves to the target source of truth only when its cutover criteria are satisfied.

Cutover must define:

- previous source of truth.
- new source of truth.
- write transition.
- read transition where applicable.
- synchronization shutdown where applicable.
- validation.
- rollback/recovery.
- operational ownership.

Source-of-truth transition must be explicit.

## Rollback / Recovery

Migration plans must define what recovery means before execution.

Rollback may mean different things depending on whether authoritative writes have begun in the target system.

Migration must not assume every cutover can safely be reversed through a simple database restore.

## Legacy Retirement

Laravel is retired only after verified cutover.

Retirement requires evidence that required business/data ownership has moved successfully and that required historical access/retention is preserved.

Legacy retirement includes appropriate:

- final data validation.
- final MySQL backup/export.
- retention decision.
- repository archival/reference preservation.
- removal of obsolete runtime dependencies.
- removal of obsolete synchronization paths.
- operational documentation.

The legacy repository remains historical/reference material even after runtime retirement.

## No Permanent Hybrid

Temporary coexistence is part of Progressive Semantic Migration.

A permanent accidental hybrid architecture is not the target.

Every temporary bridge must have a purpose and an exit condition.

## Security and Audit

Migration must preserve applicable:

- authorization boundaries.
- sensitive-data handling.
- auditability.
- financial integrity.
- document classification.
- access controls.

Migration tooling must not become an ungoverned privileged bypass around target security rules.

## Observability

Material migration runs require enough visibility to determine:

- what ran.
- which source was used.
- what was created/updated/skipped.
- what failed.
- what requires reconciliation.
- whether validation passed.

## Open / Unresolved

Phase 08 intentionally does not finalize:

- exact ETL/migration framework.
- exact batch sizes.
- exact migration job topology.
- exact target physical schemas.
- exact public ID convention.
- exact money representation.
- exact cutover dates.
- exact downtime windows.
- exact retention periods.
- provider-specific migration rules not supported by validated source data.

These remain implementation decisions.

## Rejected Directions

The approved migration strategy rejects:

- line-by-line application rewrite as the migration architecture.
- blind table-to-table migration.
- uncontrolled dual writes.
- ambiguous source-of-truth ownership.
- permanent accidental hybrid operation.
- fabricating missing historical facts.
- treating legacy behavior as the target specification.
- retiring Laravel before verified cutover.
- destructive all-at-once migration without validated need.

## Related Documentation

- `../../architecture/data-architecture.md`
- `../../architecture/system-overview.md`
- `../../architecture/infrastructure.md`
- `../../domains/README.md`
- `../../decisions/ADR-0019-progressive-semantic-migration.md`
- `../../decisions/ADR-0020-one-source-of-truth-during-migration.md`
- `../source/ATLAZORA_APPROVED_PLANNING_SOURCE.md`

## Execution Relationship

Migration implementation is delivered progressively through the relevant execution Waves.

W15 performs Legacy Final Migration.

W16 performs Cutover Readiness.

W17 performs Legacy Retirement.

Phase 08 defines the migration rules these Waves must preserve.
