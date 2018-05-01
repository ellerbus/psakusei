$module = "psakusei"

if ((Get-Module -ListAvailable -Name $module)) {
    Remove-Module $module
}

Import-Module -Name "..\$module\$module.psm1"

Initialize-psakusei -Path $PSScriptRoot