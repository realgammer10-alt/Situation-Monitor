param(
    [int]$Port = 4173
)

$projectRoot = Join-Path $PSScriptRoot 'situation-monitor-main'
$packageJson = Join-Path $projectRoot 'package.json'
$buildIndex = Join-Path $projectRoot 'build\index.html'

if (-not (Test-Path $packageJson)) {
    throw "Project package.json not found at $packageJson"
}

if (-not (Test-Path $buildIndex)) {
    throw "Production build not found at $buildIndex. Run npm --prefix `"$projectRoot`" run build first."
}

npm --prefix $projectRoot run preview -- --port $Port
