# setup.ps1 - Flutter Agent Kit Automator

$ErrorActionPreference = "Stop"

Write-Host "Starting Flutter Agent Kit Setup..." -ForegroundColor Cyan

# 1. Load project.md
$projectPath = Join-Path $PSScriptRoot "project.md"
if (-not (Test-Path $projectPath)) {
    Write-Error "project.md not found! Please create it before running this script."
}

$config = @{}
Get-Content $projectPath | ForEach-Object {
    $line = $_.Trim()
    # Match key: "value" (handles internal quotes)
    if ($line -match '^(?<key>[^#:]+):\s*"(?<value>.*)"\s*(#.*)?$') {
        $key = $Matches.key.Trim().ToUpper()
        $value = $Matches.value
        $config[$key] = $value
    } # Match key: value (no quotes)
    elseif ($line -match '^(?<key>[^#:]+):\s*(?<value>[^#\s]+)\s*(#.*)?$') {
         $key = $Matches.key.Trim().ToUpper()
         $value = $Matches.value
         $config[$key] = $value
    }
}

Write-Host "Config loaded: $($config.Count) fields found."

# 2. Define tokens and replacements with common aliases
$replacements = @{}
foreach ($key in $config.Keys) {
    $val = $config[$key]
    $replacements["\[$key\]"] = $val
    
    # Aliases for better compatibility with templates
    if ($key -eq "NAME") {
        $replacements["\[PROJECT_NAME\]"] = $val
        $replacements["\[APP_NAME\]"] = $val
    }
    if ($key -eq "PACKAGE") {
        $replacements["\[PACKAGE_NAME\]"] = $val
        $replacements["\[APP_PACKAGE\]"] = $val
    }
}

# 3. Process all files in docs/, root/, and agent/
$foldersToProcess = @("docs", "root", "agent")
foreach ($folder in $foldersToProcess) {
    $targetDir = Join-Path $PSScriptRoot $folder
    if (Test-Path $targetDir) {
        Write-Host "Processing folder: $folder..."
        $files = Get-ChildItem -Path $targetDir -Recurse -File
        foreach ($file in $files) {
            # Use raw to avoid line ending issues and keep it as a single string
            $content = Get-Content $file.FullName -Raw
            if ($null -ne $content -and $content.Length -gt 0) {
                $modified = $false
                foreach ($token in $replacements.Keys) {
                    # Case-insensitive replacement
                    if ($content -match $token) {
                        $content = $content -replace $token, $replacements[$token]
                        $modified = $true
                    }
                }
                if ($modified) {
                    Set-Content $file.FullName $content
                }
            }
        }
    }
}

# 4. Copy root files to project root (parent of flutter-agent-kit)
$projectRoot = Split-Path $PSScriptRoot -Parent
$rootFilesSource = Join-Path $PSScriptRoot "root"

if (Test-Path $rootFilesSource) {
    Write-Host "Copying entry points to project root..."
    Copy-Item -Path "$rootFilesSource\*" -Destination $projectRoot -Force
}

# 5. Handle Agent Rules
$agentRulesDir = Join-Path $projectRoot ".agents\rules"
if (-not (Test-Path $agentRulesDir)) {
    New-Item -ItemType Directory -Path $agentRulesDir -Force | Out-Null
}

$agentSource = Join-Path $PSScriptRoot "agent\code-style.md"
if (Test-Path $agentSource) {
    Write-Host "Installing Agent Rules..."
    Copy-Item -Path $agentSource -Destination $agentRulesDir -Force
}

# 6. Install Docs
$docsDest = Join-Path $projectRoot "docs"
if (-not (Test-Path $docsDest)) {
    New-Item -ItemType Directory -Path $docsDest -Force | Out-Null
}

$docsSource = Join-Path $PSScriptRoot "docs"
Write-Host "Installing Documentation..."
Copy-Item -Path "$docsSource\*" -Destination $docsDest -Recurse -Force

Write-Host "Setup Complete! Your project is now ready." -ForegroundColor Green
Write-Host "Next: Open GEMINI.md in your agent." -ForegroundColor Yellow
