# Atlazora Security Architecture

## Security Principle

Security is integrated into every applicable Work Unit.

It is not deferred to a final hardening phase.

## Identity and Authorization

Authentication identity and organizational authorization remain distinct concerns.

Authorization must account for the User ↔ Organization relationship and domain-specific roles/permissions rather than assuming authenticated identity automatically grants business authority.

## Required Work Unit Security Coverage

Where applicable, each Work Unit must consider and test:

- authentication.
- authorization.
- input validation.
- domain validation.
- least privilege.
- sensitive data handling.
- auditability.
- abuse cases.
- dependency/supply-chain risk.
- secret handling.
- secure configuration.
- error information exposure.
- API and contract security.

## Security Completion Rule

A Work Unit may not be marked complete with an unresolved blocking Critical or High security issue.

## Cloud Least Privilege

Cloud identities must receive only the permissions required for their role or workload.

Production access must be more tightly controlled than routine non-production development access.

Environment separation must prevent casual reuse of Production credentials or secrets.

## Workload Identity

GKE workloads should use GCP Workload Identity or an equivalent approved federated identity mechanism.

Long-lived static service-account JSON credentials are not the normal application authentication mechanism.

## CI Cloud Authentication

CI/CD should use federated identity to cloud services where supported.

Long-lived cloud credentials stored as routine CI secrets should be avoided when a safer federated mechanism is available.

## Secrets

Secrets must never be committed to Git-tracked project files or embedded in container images.

Google Cloud Secret Manager is the approved direction for runtime secret storage/delivery on GCP.

Secret access must be:

- identity-controlled.
- least-privilege.
- environment-aware.
- auditable where appropriate.

## Environment Isolation

Production identities, data, secrets, and privileged access must be intentionally separated from non-production environments.

Separate cloud projects are the approved direction for meaningful environment isolation.

Exact project topology is implemented through Terraform.

## Network Security

Infrastructure must support explicit trust/network boundaries.

Applicable controls include:

- controlled ingress.
- TLS.
- private/service connectivity where appropriate.
- restricted administrative access.
- edge/WAF protections where required.
- controlled egress where justified.

Exact product-level configuration remains an implementation decision.

## Sensitive Files

Documents/files require appropriate classification such as:

- public.
- private.
- sensitive.

Authorization must be enforced according to classification.

Sensitive-file handling may require:

- validation.
- malware/security scanning.
- controlled access.
- audit.
- retention policy.

Exact mechanisms are finalized in applicable Work Units.

## Supply-Chain Security

CI/CD and repository controls must progressively establish appropriate:

- dependency scanning.
- secret scanning.
- static/security analysis.
- container/image scanning.
- Infrastructure as Code scanning.
- artifact traceability.
- SBOM generation where applicable.

Exact overlapping tools remain implementation decisions and are further formalized in Phase 10.

## Immutable Artifact Security

Production must deploy known immutable artifacts created by the approved build pipeline.

Ad-hoc local builds must not silently replace controlled Production artifacts.

Artifact provenance and traceability must be preserved according to the implemented CI/CD foundation.

## Audit

Security-sensitive and materially important business operations require auditability where applicable.

Audit data must be designed intentionally rather than reconstructed solely from application logs.

Privileged administrative and operational actions require appropriate attribution.

## Infrastructure Changes

Infrastructure affecting security or Production architecture must be represented through approved Infrastructure as Code and review processes.

Manual emergency intervention, when unavoidable, must not become undocumented permanent configuration.

## CI / Engineering Integration

Security tooling and checks are integrated into CI and Work Unit verification according to repository risk and technology.

Security validation grows with the system rather than being postponed until launch.

## Architecture Evolution

New trust boundaries, externally exposed services, authentication systems, authorization models, payment boundaries, sensitive-data processing, or major infrastructure exposure changes require explicit security review and, where architectural, an ADR.

## Open / Unresolved

The security architecture does not yet finalize:

- exact WAF product/rules.
- exact overlapping CI security tools.
- exact SIEM/security monitoring stack.
- exact retention periods.
- exact Production privileged-access workflow.
- exact numeric security/SLO targets.

These remain explicit later implementation and Phase 10 decisions.

## Phase 10 Testing & Security Model

The detailed approved testing/security model is preserved in `phases/phase-10/README.md`.

Architecturally important security requirements include:

- explicit User/Organization authorization and organization-isolation testing.
- server-side authorization independent of UI visibility.
- privileged Admin/Ops authorization and auditability.
- failure-oriented payment/financial security testing.
- concurrency and idempotency verification.
- event/outbox retry, duplicate-delivery, and consumer-idempotency verification.
- public/private/sensitive file-access enforcement.
- threat modeling for meaningful trust-boundary changes.
- abuse-case testing where risk warrants it.
- risk-based performance and resilience testing.
- backup/restore and disaster-recovery verification before Production readiness.
- staged CI/security verification from Pull Request through Release Candidate.

Candidate/baseline tools recorded by Phase 10 include Gitleaks, Semgrep, Trivy, Checkov, Playwright, OWASP ZAP, and Python type-analysis candidates such as mypy or Pyright.

These tools are not all immutable architectural commitments.

Exact overlapping tool choices remain implementation decisions provided the required security/testing coverage is preserved.

## Security Release Gates

An unresolved exploitable Critical security issue blocks Production release.

A Work Unit may not be marked complete with an unresolved blocking Critical or High security issue.

Other findings require explicit risk disposition according to severity, exploitability, affected scope, compensating controls, and release context.

Security findings must not be silently waived merely to satisfy a schedule.

## Phase 12 Production Security Operations

Private or public Production exposure requires Production-grade security controls.

Privileged Production operations require explicit authorization, least privilege, strong authentication appropriate to risk, and auditability.

Admin/Ops workflows must use approved application/API boundaries; routine direct Production database modification is not an approved operational workflow.

Production secrets, provider credentials, data, and privileged identities must remain separated from non-production environments.

Production security operations require an incident path capable of containment, credential/access revocation or rotation, evidence preservation, impact assessment, recovery, and follow-up.

Suspicious account, payment, or commercial activity requires an operational fraud/abuse review path.

Automated intelligence may assist detection or scoring but must not silently become authoritative for sensitive decisions without approved controls.

Security-sensitive Production interventions must remain traceable.

Exact SIEM tooling, privileged-access workflow, retention periods, fraud rules, and legal notification requirements remain open until formally determined by implementation and applicable policy/law.
