. (Join-Path $PSScriptRoot "_common.ps1")

Write-Host "`n=== Atlazora Local Platform: VALIDATE ==="

Assert-DockerAvailable

$composeArgs = Get-ComposeArgs
$config = Get-LocalPlatformConfig

Write-Host "`n--- Compose Configuration ---"

& docker compose @composeArgs config --quiet

if ($LASTEXITCODE -ne 0) {
    throw "Compose configuration validation failed."
}

Write-Host "COMPOSE_CONFIG=PASS"

Write-Host "`n--- Container Health ---"

Wait-LocalPlatformHealthy

Write-Host "CONTAINER_HEALTH=PASS"

Write-Host "`n--- PostgreSQL Connectivity ---"

& docker compose @composeArgs exec -T postgres `
    psql `
    -U $config.PostgresUser `
    -d $config.PostgresDb `
    -v ON_ERROR_STOP=1 `
    -tAc "SELECT 1;" | Out-Host

if ($LASTEXITCODE -ne 0) {
    throw "PostgreSQL connectivity validation failed."
}

Write-Host "POSTGRES_CONNECTIVITY=PASS"

Write-Host "`n--- Redis Connectivity ---"

$redisResult = & docker compose @composeArgs exec -T redis `
    redis-cli --raw PING

if ($LASTEXITCODE -ne 0 -or "$redisResult".Trim() -ne "PONG") {
    throw "Redis connectivity validation failed."
}

Write-Host "REDIS_CONNECTIVITY=PASS"

Write-Host "`n--- S3 Health Endpoint ---"

$response = Invoke-WebRequest `
    -Uri "http://127.0.0.1:$($config.S3Port)/healthz" `
    -UseBasicParsing `
    -TimeoutSec 5

if ($response.StatusCode -ne 200) {
    throw "S3 health endpoint validation failed."
}

Write-Host "S3_CONNECTIVITY=PASS"

Write-Host "`nLOCAL_PLATFORM_VALIDATION=PASS"
