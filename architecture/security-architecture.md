# Atlazora Security Architecture

## Security Principle

Security is integrated into every applicable Work Unit.

It is not deferred to a final hardening phase.

## Identity and Authorization

Authentication identity and organizational authorization must remain distinct concerns.

Authorization must account for the User ↔ Organization relationship and domain-specific roles/permissions rather than assuming that authenticated identity automatically grants business authority.

## Required Work Unit Security Coverage

Where applicable, each Work Unit must consider and test:

- authentication
- authorization
- input validation
- domain validation
- least privilege
- sensitive data handling
- auditability
- abuse cases
- dependency/supply-chain risk
- secret handling
- secure configuration
- error information exposure
- API and contract security

## Security Completion Rule

A Work Unit may not be marked complete with an unresolved blocking Critical or High security issue.

## Secrets

Secrets must never be committed to Git-tracked project files.

Infrastructure and application secret delivery must use appropriate managed mechanisms.

## Audit

Security-sensitive and materially important business operations require auditability where applicable.

Audit data must be designed intentionally rather than reconstructed solely from application logs.

## CI / Engineering Integration

Security tooling and checks should be integrated into CI and Work Unit verification according to repository risk and technology.

## Architecture Evolution

New trust boundaries, externally exposed services, authentication systems, authorization models, payment boundaries, or sensitive-data processing require explicit security review and, where architectural, an ADR.
