. (Join-Path $PSScriptRoot "_common.ps1")

Write-Host "`n=== Atlazora Local Platform: STATUS ==="

Assert-DockerAvailable

$composeArgs = Get-ComposeArgs
$config = Get-LocalPlatformConfig

& docker compose @composeArgs ps

if ($LASTEXITCODE -ne 0) {
    throw "Unable to read local platform status."
}

Write-Host "`nHost endpoints:"
Write-Host "PostgreSQL : 127.0.0.1:$($config.PostgresPort)"
Write-Host "Redis      : 127.0.0.1:$($config.RedisPort)"
Write-Host "S3         : http://127.0.0.1:$($config.S3Port)"

Write-Host "`nContainer endpoints:"
Write-Host "PostgreSQL : postgres:5432"
Write-Host "Redis      : redis:6379"
Write-Host "S3         : http://s3:8333"
Write-Host "Network    : atlazora-local"
