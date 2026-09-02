param(
    [switch]$Force
)

. (Join-Path $PSScriptRoot "_common.ps1")

Write-Host "`n=== Atlazora Local Platform: DESTRUCTIVE RESET ==="

if (-not $Force) {
    Write-Host ""
    Write-Host "This operation deletes Atlazora local PostgreSQL and S3 data."
    Write-Host "Redis is already disposable."
    Write-Host ""
    Write-Host "Re-run with:"
    Write-Host "  .\scripts\local\reset.ps1 -Force"
    Write-Host ""
    throw "Destructive reset requires explicit -Force."
}

Assert-DockerAvailable

Invoke-Compose -Arguments @(
    "down",
    "--volumes",
    "--remove-orphans"
)

Write-Host "`nStarting a clean local platform..."
Invoke-Compose -Arguments @("up", "-d")

Wait-LocalPlatformHealthy

Write-Host "`nLOCAL_PLATFORM_RESET=PASS"
