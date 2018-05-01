Param(
    [Parameter(Mandatory = $true, HelpMessage = "The name of the template to use without the .erb extension (wildcard * allowed)")]
    $Template,
    [Parameter(Mandatory = $true, HelpMessage = "The name of the table to use")]
    $Table
)

$parameters = Get-Parameters

#   User Input parameters from command line
$parameters.Template = $Template
$parameters.Table = $Table

#   Path to folder that contains all the templates
$parameters.TemplateFolder = "$PSScriptRoot\Templates"

#   How will psakusei connect to the desired database
#   
#   $parameters.ConnectionSettings = @{
#       ConnectionString = "?" hard-code the connection string
#       ProviderName     = "System.Data.SqlClient"
#   }
#
#   -- or optionally point at a .NET config file for a connectionString setting
#
#   $parameters.ConnectionSettings = Get-ConnectionSettings -ConfigFile "$PSScriptRoot\WebProject\web.config" -Name "MYDB"

$parameters.Bindings.Config.Namespace = ""

Invoke-psakusei @parameters
