# Atlazora Local Development Platform

## Purpose

This runbook documents the local infrastructure platform implemented by W00-WU02.

It provides local dependencies only. Application runtimes, business schemas, application contracts, event-broker selection, search infrastructure, cloud infrastructure, and production environments remain outside this Work Unit.

## Prerequisites

- Docker Desktop using Linux containers
- Docker Engine
- Docker Compose
- PowerShell

## Services

| Dependency | Host endpoint | Container endpoint | Persistence |
| --- | --- | --- | --- |
| PostgreSQL | `127.0.0.1:15432` | `postgres:5432` | Persistent |
| Redis | `127.0.0.1:16379` | `redis:6379` | Ephemeral |
| S3-compatible storage | `http://127.0.0.1:18333` | `http://s3:8333` | Persistent |

Docker network: `atlazora-local`

Persistent volumes:

- `atlazora-local-postgres-data`
- `atlazora-local-seaweed-data`

## Configuration

Version-controlled defaults: `local/.env.example`

Developer-local configuration: `local/.env`

`local/.env` is intentionally ignored by Git.

All committed credentials are deterministic development-only values. They are not real secrets and must never be reused in Development, Staging, or Production.

Local S3-compatible credentials:

- access key: `atlazora-local`
- secret key: `atlazora-local-only`

No cloud credentials, provider credentials, production credentials, or licensed LocalStack authentication token are required.

## Lifecycle Commands

Start: `.\scripts\local\start.ps1`

Status: `.\scripts\local\status.ps1`

Validate: `.\scripts\local\validate.ps1`

Stop: `.\scripts\local\stop.ps1`

Destructive reset: `.\scripts\local\reset.ps1 -Force`

Running `reset.ps1` without `-Force` must refuse the destructive operation.

Normal shutdown preserves PostgreSQL and S3 persistent volumes.

Redis state is intentionally disposable.

## Architecture Boundaries

PostgreSQL is the transactional source of truth.

Redis is ephemeral and non-authoritative.

Object storage uses an S3-compatible boundary.

SeaweedFS is a W00-WU02 local-development implementation choice only. It does not select the Production object-storage provider.

W00-WU02 does not select or implement the asynchronous event broker or search platform.

## Security Boundary

Published dependency ports are bound to `127.0.0.1`.

No real secrets belong in Git.

Production secret management and broader application security controls remain outside W00-WU02 scope.
