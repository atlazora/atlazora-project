# Atlazora Definition of Done

A Work Unit may be marked `COMPLETE` only when every applicable item below is satisfied.

If an item is not applicable, mark it `N/A` and record why.

## Product / Domain

- [ ] Required domain behavior is implemented and verified.
- [ ] Acceptance criteria have passed.

## Data

- [ ] Required database changes are implemented.
- [ ] Required migrations are safe, reviewed, and tested.
- [ ] Data ownership/source-of-truth rules remain valid.

## Contracts

- [ ] Required API contracts are implemented or updated.
- [ ] Required shared schemas are implemented or updated.
- [ ] Compatibility/versioning impact has been reviewed.

## Security

- [ ] Authorization is implemented and tested.
- [ ] Input and domain validation are implemented.
- [ ] Security review appropriate to the change is complete.
- [ ] No unresolved blocking Critical/High security issue remains.

## Reliability / Distributed Behavior

- [ ] Required events are implemented.
- [ ] Transactional Outbox requirements are satisfied where applicable.
- [ ] Idempotency requirements are satisfied where applicable.
- [ ] Error and retry behavior is defined and tested where applicable.

## User Experience

- [ ] Required web UI is complete.
- [ ] Required admin/operations UI is complete.
- [ ] Error, empty, loading, forbidden, and relevant recovery states are handled.

## Tests

- [ ] Required unit tests pass.
- [ ] Required integration tests pass.
- [ ] Required contract tests pass.
- [ ] Required E2E tests pass.
- [ ] Regression coverage is appropriate to the risk.

## Operations

- [ ] Required observability is implemented.
- [ ] Required audit trail is implemented.
- [ ] Operational or support procedures are documented where applicable.
- [ ] Deployment/migration/rollback impact is understood.

## Engineering Quality

- [ ] Documentation is updated.
- [ ] CI is green.
- [ ] No unresolved blocking P0/P1 bug remains.
- [ ] No unresolved blocking Critical/High security issue remains.
- [ ] Relevant code/configuration review is complete.

## Project Memory

- [ ] `PROJECT_STATE.md` is updated.
- [ ] Relevant ADRs are updated or created.
- [ ] Relevant Phase/Wave/Work Unit documentation is updated.
- [ ] Formal Handoff is written.

## Completion Rule

If any applicable item above is incomplete, the Work Unit status is **NOT COMPLETE**.

A Work Unit must never be declared complete merely because implementation code exists.
