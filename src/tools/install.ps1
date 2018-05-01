param($installPath, $toolsPath, $package, $project)

$module = "psakusei"

if (Get-Module psakusei) {
    Remove-Module $module
}

Import-Module (Join-Path $PSScriptRoot "$module\$module.psd1") -DisableNameChecking

$solutionPath = Get-SolutionPathFrom $project

Write-Host "Initializing $module - $solutionPath"

Initialize-psakusei -SolutionPath $solutionPath

Write-Host "Initialized $module"
