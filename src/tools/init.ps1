param($installPath, $toolsPath, $package, $project)

$schemaReference = $project.Object.References["DatabaseSchemaReader"]

Add-Type -Path $schemaReference.Path

$module = "psakusei"

if (Get-Module psakusei) {
    Remove-Module $module
}

Import-Module (Join-Path $PSScriptRoot "$module\$module.psd1") -DisableNameChecking

Write-Host "Added $module"

Set-Alias gencode Invoke-psakusei
