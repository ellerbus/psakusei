param($installPath, $toolsPath, $package, $project)

$module = "psakusei"

if (Get-Module psakusei) {
    Remove-Module $module
}

Import-Module (Join-Path $PSScriptRoot "$module\$module.psd1") -DisableNameChecking

Write-Host "Added $module"
