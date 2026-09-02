$ErrorActionPreference = "Stop"

$script:RepoRoot = (
    Resolve-Path (Join-Path $PSScriptRoot "..\..")
).Path

$script:ComposeFile = Join-Path $script:RepoRoot "local\compose.yaml"
$script:EnvFile = Join-Path $script:RepoRoot "local\.env"
$script:EnvExampleFile = Join-Path $script:RepoRoot "local\.env.example"

function Assert-DockerAvailable {
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        throw "Docker CLI was not found in PATH."
    }

    docker info *> $null

    if ($LASTEXITCODE -ne 0) {
        throw "Docker Engine is not available."
    }

    docker compose version *> $null

    if ($LASTEXITCODE -ne 0) {
        throw "Docker Compose is not available."
    }
}

function Ensure-LocalEnv {
    if (-not (Test-Path $script:EnvFile)) {
        if (-not (Test-Path $script:EnvExampleFile)) {
            throw "Neither local\.env nor local\.env.example exists."
        }

        Copy-Item $script:EnvExampleFile $script:EnvFile
        Write-Host "Created local\.env from local\.env.example."
    }
}

function Get-LocalEnvValue {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [string]$DefaultValue
    )

    Ensure-LocalEnv

    $match = Get-Content $script:EnvFile |
        Where-Object {
            $_ -match "^\s*$([regex]::Escape($Name))\s*="
        } |
        Select-Object -Last 1

    if (-not $match) {
        return $DefaultValue
    }

    $value = ($match -split "=", 2)[1].Trim()

    if ([string]::IsNullOrWhiteSpace($value)) {
        return $DefaultValue
    }

    return $value
}

function Get-LocalPlatformConfig {
    return @{
        PostgresDb   = Get-LocalEnvValue -Name "POSTGRES_DB" -DefaultValue "atlazora"
        PostgresUser = Get-LocalEnvValue -Name "POSTGRES_USER" -DefaultValue "atlazora"
        PostgresPort = Get-LocalEnvValue -Name "POSTGRES_PORT" -DefaultValue "15432"
        RedisPort    = Get-LocalEnvValue -Name "REDIS_PORT" -DefaultValue "16379"
        S3Port       = Get-LocalEnvValue -Name "S3_PORT" -DefaultValue "18333"
    }
}
function Get-ComposeArgs {
    Ensure-LocalEnv

    return @(
        "--env-file", $script:EnvFile,
        "-f", $script:ComposeFile
    )
}

function Invoke-Compose {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    $composeArgs = Get-ComposeArgs

    & docker compose @composeArgs @Arguments

    if ($LASTEXITCODE -ne 0) {
        throw "docker compose command failed: $($Arguments -join ' ')"
    }
}

function Wait-LocalPlatformHealthy {
    param(
        [int]$TimeoutSeconds = 180
    )

    $containers = @(
        "atlazora-local-postgres",
        "atlazora-local-redis",
        "atlazora-local-s3"
    )

    $deadline = (Get-Date).AddSeconds($TimeoutSeconds)

    do {
        $allHealthy = $true

        foreach ($container in $containers) {
            $state = docker inspect `
                --format '{{.State.Status}}|{{if .State.Health}}{{.State.Health.Status}}{{else}}no-healthcheck{{end}}' `
                $container 2>$null

            if ($LASTEXITCODE -ne 0) {
                $state = "missing"
            }

            Write-Host "$container => $state"

            if ($state -ne "running|healthy") {
                $allHealthy = $false
            }
        }

        if ($allHealthy) {
            return
        }

        Start-Sleep -Seconds 5

    } while ((Get-Date) -lt $deadline)

    throw "Local platform did not become healthy within $TimeoutSeconds seconds."
}
