# Domains

This directory is the index for Atlazora business and platform domain documentation.

Domain boundaries must align with the approved domain model and relevant ADRs.

A domain document should describe, where applicable:

- purpose and business responsibility
- aggregate or ownership boundaries
- authoritative data
- commands and behaviors
- externally visible contracts
- emitted and consumed events
- authorization concerns
- invariants
- operational considerations
- dependencies on other domains

Domain documentation must not create a second conflicting source of truth for API schemas or event schemas; executable/shared contracts belong in `atlazora-contracts`.
