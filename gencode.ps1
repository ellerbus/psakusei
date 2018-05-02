Param(
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

#
#   Helper file that can be saved at the solution root
#   This sample uses a localdb sql server file to connect to
#

#   get the solution root path
$root = Split-Path $DTE.Solution.Properties["Path"].Value -Parent

#   get the app_data (from a web project in this case)
$data = Join-Path -Path $root -ChildPath "mysolution.Web\App_Data"

#   the connection strings are stored in a partial config file
#   at App_Data\Configs
$cfg = Join-Path -Path $root -ChildPath "mysolution.Web\App_Data\Configs\connectionStrings.config"

#   pull the desired connection string
#   in this sample "DB.local"
$xml = [xml](Get-Content $cfg)

$connectionString = $xml.SelectSingleNode("//connectionStrings/add[@name='DB.local']/@connectionString").Value

$connectionString = $connectionString -ireplace "\|DataDirectory\|", $data

#
#   FINALLY! generate some code
#
Invoke-psakusei -ConnectionString $connectionString -Template $Template -Table $Table -Force:$Force -Project $Project
