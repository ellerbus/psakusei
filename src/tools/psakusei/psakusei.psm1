$ErrorActionPreference = "Stop"

. "$PSScriptRoot\Casing.ps1"
. "$PSScriptRoot\Singular.ps1"
. "$PSScriptRoot\Plural.ps1"
. "$PSScriptRoot\Schema.ps1"

<#
.SYNOPSIS
    Initializes a solution by copying existing templates into a folder
    at the solution level called "Templates"

.DESCRIPTION
    Initializes a solution by copying existing templates into a folder
    at the solution level called "Templates"

.PARAMETER SolutionPath
    Full path to the current solution (including solution-name.sln)
#>
function Initialize-psakusei {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        $SolutionPath
    )

    $Path = Split-Path $SolutionPath -Parent

    $TemplatesPath = (Join-Path -Path $Path -ChildPath "Templates")

    if (-not(Test-Path -Path $TemplatesPath -PathType Container)) {
        $folder = $DTE.Solution.AddSolutionFolder("Templates")
        
        Write-Host "Copying psakusei 'Templates' ..."

        New-Item -ItemType Directory -Force -Path $TemplatesPath | Out-Null
    
        Get-ChildItem "$PSScriptRoot\Templates\" -File | ForEach-Object {
            Write-Host "... Copying $($_.Name)"
            Copy-Item -Path $_.FullName -Destination "$TemplatesPath\$($_.Name)" -Force
        
        }
    
        Get-ChildItem "$TemplatesPath" -File | ForEach-Object {
            Write-Host "... Adding $($_.Name)"
            $folder.ProjectItems.AddFromFile($_.FullName)
        }

        Write-Host "Copied psakusei 'Templates'"
    }
}


<#
.SYNOPSIS
    Invokes the DatabaseSchemaReader and ERB template engine to generate
    desired source code and add to current or selected project

.DESCRIPTION
    Invokes the DatabaseSchemaReader and ERB template engine to generate
    desired source code and add to current or selected project

.PARAMETER ConnectionString
    Required - The connection string to the desired database that contains the table

.PARAMETER Provider
    Optional - Defaults to System.Data.SqlClient

.PARAMETER Template
    Required - The name of the template in the templates folder (not including
    the extension .erb wildcards allowed)

.PARAMETER Table
    Required - The name of the table to generate against

.PARAMETER Project
    Optional - Defaults to current Project, or specify the name of the project
    to attach the final code file to

.PARAMETER Force
    Optional - Defaults to false, whether or not to forcibly override an existing
    file during template generation

#>
function Invoke-psakusei {
    # Invoke psakusei - and execute desired templates
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]
        $ConnectionString,
        [string]
        $Provider = "System.Data.SqlClient",        
        [Parameter(Mandatory = $true)]
        [string]
        $Template,        
        [Parameter(Mandatory = $true)]
        [string]
        $Table,        
        [string]
        $Project,        
        [switch]
        $Force = $false
    )

    $dteProject = GetProject $Project

    Add-RequiredReferences $dteProject

    $solutionPath = Get-SolutionPathFrom $dteProject

    $solutionPath = Split-Path $solutionPath -Parent

    $templatesPath = (Join-Path -Path $solutionPath -ChildPath "Templates")

    $connection = @{
        ConnectionString = $ConnectionString
        ProviderName     = $Provider
    }

    $tableObject = Get-TableObject -ConnectionSettings $connection -TableName $Table

    Get-ChildItem -Path $templatesPath -Filter "$Template.erb" -Recurse | ForEach-Object {
        Write-Host "Generating Template $($_.FullName) ..." -ForegroundColor Blue

        $contents = Get-Content -Path $_.FullName -Raw
        
        $bindings = @{
            Table  = $tableObject
            Config = @{
                Templates   = $templatesPath
                Namespace   = Get-ProjectNamespace $dteProject
                ProjectPath = $dteProject.Properties["LocalPath"].Value
                OutFile     = ""
            }
        }
        
        $results = Invoke-EpsTemplate -Template $contents -Binding $bindings

        $fullpath = Join-Path -Path $bindings.Config.ProjectPath -ChildPath $bindings.Config.OutFile

        $path = Split-Path -Path $fullpath -Parent

        if (-not (Test-Path -Path $path -PathType Container)) {
            New-Item -Path $path -ItemType Container -Force | Out-Null
        }

        if (-not $Force -and (Test-Path -Path $fullpath -PathType Leaf)) {
            throw "Generated Template already exists use -Force to overwrite it"
        }

        if ($bindings.Config.OutFile) {
            Set-Content -Path $fullpath -Value $results -Force:$Force
            
            Write-Host "Generated Template $($fullpath) ..." -ForegroundColor Blue

            $dteProject.ProjectItems.AddFromFile($fullpath) | Out-Null

            $DTE.ItemOperations.OpenFile($fullpath) | Out-Null

            ShowConsole
        }
        else {
            throw "Missing `$bindings.Config.OutFile was not specified"
        }
    }
}
<#
.SYNOPSIS
    Updates the templates in the "Templates" folder. By calling this function
    it will OVERWRITE ALL .erb template files

.DESCRIPTION
    Updates the templates in the "Templates" folder

.PARAMETER SolutionPath
    Full path to the current solution (including solution-name.sln)
#>
function Update-psakusei {
    [CmdletBinding()]
    Param()

    $project = GetProject

    $solutionPath = Get-SolutionPathFrom $project

    $Path = Split-Path $SolutionPath -Parent

    $templatesPath = (Join-Path -Path $Path -ChildPath "Templates")

    $folder = $DTE.Solution.AddSolutionFolder("Templates")
    
    Write-Host "Copying psakusei 'Templates' ..."

    New-Item -ItemType Directory -Force -Path $templatesPath | Out-Null

    Get-ChildItem "$PSScriptRoot\Templates\" -File | ForEach-Object {
        Write-Host "... Copying $($_.Name)"
        Copy-Item -Path $_.FullName -Destination "$templatesPath\$($_.Name)" -Force
    }

    Get-ChildItem "$TemplatesPath" -File | ForEach-Object {
        Write-Host "... Adding $($_.Name)"
        $folder.ProjectItems.AddFromFile($_.FullName)
    }

    Write-Host "Copied psakusei 'Templates'"
}

function Get-SolutionPathFrom($project) {
    return $project.Object.DTE.Solution.Properties["Path"].Value
}

function Get-ProjectNamespace($project) {
    return $project.Properties["DefaultNamespace"].Value
}

function GetProject($projectName) {
    if (!$projectName) {
        return Get-Project
    }
    return Get-Project $projectName
}

function ShowConsole {
    $componentModel = Get-VSComponentModel
    $powerConsoleWindow = $componentModel.GetService([NuGetConsole.IPowerConsoleWindow])
    $powerConsoleWindow.Show()
}

function Add-RequiredReferences() {
    Param([Parameter(Mandatory = $true)]$project)
    
    $schemaReference = $project.Object.References["DatabaseSchemaReader"]

    Add-Type -Path $schemaReference.Path
}