function global:SqlType() {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline, Position = 1)]
        $column
    )

    $sql_type = $column.DbDataType

    switch -Wildcard ($column.DbDataType.ToLower()) {
        "*char" { $sql_type = $column.DbDataType + "(" + $column.Length + ")" }
    }

    return $sql_type
}

function global:CsType() {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline, Position = 1)]
        $column
    )

    $cs_type = "__" + $column.DbDataType + "__"

    switch -Wildcard ($column.DbDataType.ToLower()) {
        "bit" { $cs_type = "bool" }
        "int" { $cs_type = "int" }
        "float" { $cs_type = "double" }
        "uniqueidentifier" { $cs_type = "Guid" }
        "date*" { $cs_type = "DateTime" }
        "*char" { $cs_type = "string" }
    }

    if ($column.IsNullable -and $cs_type -ne "string") {
        $cs_type = $cs_type + "?"
    }

    return $cs_type
}

function global:CsValue() {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline, Position = 1)]
        $column
    )

    $cs_value = "?"

    switch -Wildcard ($column.DbDataType.ToLower()) {
        "bit" { $cs_value = "true" }
        "int" { $cs_value = "0" }
        "float" { $cs_value = "0" }
        "uniqueidentifier" { $cs_value = "Guid.NewGuid()" }
        "date*" { $cs_value = "DateTime.Now" }
        "*char" { $cs_value = '"aa"'}
    }

    return $cs_value
}

function global:TsType() {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline, Position = 1)]
        $column
    )

    $ts_type = "__" + $column.DbDataType + "__"

    switch -Wildcard ($column.DbDataType.ToLower()) {
        "bit" { $ts_type = "boolean" }
        "int" { $ts_type = "number" }
        "float" { $ts_type = "number" }
        "uniqueidentifier" { $ts_type = "any" }
        "date*" { $ts_type = "Date" }
        "*char" { $ts_type = "string" }
    }

    return $ts_type
}

function Get-TableObject([hashtable]$ConnectionSettings, [string]$TableName) {
    $args = @(
        $ConnectionSettings.ConnectionString,
        $ConnectionSettings.ProviderName
    )
    $reader = New-Object -TypeName "DatabaseSchemaReader.DatabaseReader" -ArgumentList $args

    $table = $reader.Table($TableName)
    
    return $table
}