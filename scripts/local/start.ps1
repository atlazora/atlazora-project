. (Join-Path $PSScriptRoot "_common.ps1")

Write-Host "`n=== Atlazora Local Platform: START ==="

Assert-DockerAvailable

$composeArgs = Get-ComposeArgs

& docker compose @composeArgs config --quiet

if ($LASTEXITCODE -ne 0) {
    throw "Compose configuration validation failed."
}

Invoke-Compose -Arguments @("up", "-d")

Write-Host "`nWaiting for local dependencies..."
Wait-LocalPlatformHealthy

Write-Host "`nLOCAL_PLATFORM_START=PASS"
