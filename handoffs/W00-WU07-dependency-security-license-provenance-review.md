# W00-WU07 — Dependency, Security, License, and Provenance Review

## Scope

This artifact records the permanent W00-WU07 review evidence for the adopted Web Foundation dependency baseline, dependency security, registry provenance, donor independence, browser-secret exposure, licensing, and production/distribution exposure.

It is project-memory evidence for W00-WU07 closure. It does not replace the required W00-WU07 Final Handoff and does not authorize a lifecycle transition.

## Exact Revisions

- Project-memory repository: `atlazora-project`
- Governance revision assessed: `2b1f2ce0f0c477215b78c9124ce29792cf73e2f0`
- Web repository: `atlazora-web`
- Web revision assessed: `62087dc6391cf818c416d8adf4c0f8c4025b5ea8`
- Web revision and `origin/main` were synchronized and clean during the final assessment.
- Governance revision and `origin/main` were synchronized and clean before this review artifact was created.

## Dependency and Security Review

- Result: **PASS**.
- Direct runtime and development dependencies were inventoried from `package.json`.
- The committed `package-lock.json` dependency graph was reviewed.
- High/Critical dependency-audit blocker: **NONE IDENTIFIED**.
- Browser-exposed privileged secret signal: **NONE IDENTIFIED**.
- No browser-side credential, token, password, private key, or API-key authority was accepted as part of the foundation.
- The review does not make browser authorization or visibility controls authoritative security enforcement.

## Registry Provenance Review

- Result: **PASS**.
- Resolved dependency provenance was reviewed from the lockfile.
- Expected package registry provenance was `registry.npmjs.org`.
- Unexpected resolved registry host requiring remediation: **NONE IDENTIFIED**.

## Donor Independence Review

- Result: **PASS**.
- Direct dependency on Spree, Mercur, Medusa, or a donor-specific authoritative domain package: **NONE**.
- Donor/reference names found in project documentation are architectural/reference context rather than runtime authority.
- Atlazora-owned presentation models, Services/Adapters boundaries, contracts, authorization boundaries, backend APIs, persistence, and transactional truth remain authoritative.
- No donor backend/domain/API model was accepted as an authoritative Atlazora contract or domain model.

## License Review

- Result: **PASS WITH DOCUMENTATION OBLIGATION**.
- Reviewed production-relevant transitive platform artifact: `@img/sharp-win32-x64@0.35.4`.
- Dependency relation: `Next 16.3.4 -> sharp 0.35.4 -> @img/sharp-win32-x64@0.35.4`.
- Relationship to Atlazora: transitive and optional; it is not a direct Atlazora dependency declaration.
- Recorded license expression: `Apache-2.0 AND LGPL-3.0-or-later`.
- Upstream package license evidence: package `LICENSE` file present in the installed dependency.
- The license signal does not require removal of Next.js or Sharp for W00-WU07.
- Distribution/license notices and applicable upstream license obligations must be preserved when producing or distributing artifacts that include the relevant dependency.

## Distribution Exposure

- `@img/sharp-win32-x64@0.35.4` was present in the production dependency tree on the assessed Windows environment.
- The platform artifact was also referenced by the Next.js server dependency trace (`next-server.js.nft.json`).
- Therefore the licensing review is recorded as a real production/distribution consideration rather than a lockfile-only theoretical signal.
- Other platform-specific Sharp artifacts may appear as optional lockfile records; platform selection determines which artifact is installed/used for a given environment.

## Documentation Obligation

- Preserve applicable upstream copyright/license notices when distribution conditions require them.
- Do not remove or obscure applicable upstream license evidence from distributed dependency material.
- Re-evaluate the dependency/license inventory when Next.js, Sharp, `@img/sharp-*` artifacts, packaging strategy, deployment platform, or distribution model materially changes.
- This record is engineering project memory and is not a substitute for legal advice where a future distribution model requires formal legal review.

## Closure Decision

- Dependency/security review: **PASS**.
- Registry provenance review: **PASS**.
- Donor-independence review: **PASS**.
- License review: **PASS WITH DOCUMENTATION OBLIGATION**.
- Blocking Critical/High security finding: **NONE IDENTIFIED**.
- W00-WU07 dependency/security/licensing/provenance/donor-independence closure evidence: **PASS**.
- Remaining W00-WU07 closure work includes permanent project-memory reconciliation and the required formal Final Handoff.
- This artifact alone does **not** change W00-WU07 from `IN_PROGRESS` and does **not** authorize W00-WU08.
