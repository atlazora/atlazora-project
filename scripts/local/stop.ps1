. (Join-Path $PSScriptRoot "_common.ps1")

Write-Host "`n=== Atlazora Local Platform: STOP ==="

Assert-DockerAvailable

Invoke-Compose -Arguments @("down", "--remove-orphans")

Write-Host "`nNamed PostgreSQL and S3 volumes were preserved."
Write-Host "LOCAL_PLATFORM_STOP=PASS"
