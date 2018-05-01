$root = $PSScriptRoot | Split-Path -Parent

. "$root\src\tools\psakusei\Schema.ps1"

Describe "Schema" {
    Context "Get-CsType" {
        It "should return bool for bit" {
            $results = Get-CsType(@{ sql_type = "bit" })
            $results | Should Be "bool"
        }
        It "should return bool? for nullable bit" {
            $results = Get-CsType(@{ sql_type = "bit"; is_nullable = $true })
            $results | Should Be "bool?"
        }
        It "should return int for int" {
            $results = Get-CsType(@{ sql_type = "int" })
            $results | Should Be "int"
        }
        It "should return int? for nullable int" {
            $results = Get-CsType(@{ sql_type = "int"; is_nullable = $true })
            $results | Should Be "int?"
        }
        It "should return double for float" {
            $results = Get-CsType(@{ sql_type = "float" })
            $results | Should Be "double"
        }
        It "should return double? for nullable float" {
            $results = Get-CsType(@{ sql_type = "float"; is_nullable = $true })
            $results | Should Be "double?"
        }
        It "should return Guid for uniqueidentifier" {
            $results = Get-CsType(@{ sql_type = "uniqueidentifier" })
            $results | Should Be "Guid"
        }
        It "should return Guid? for nullable uniqueidentifier" {
            $results = Get-CsType(@{ sql_type = "uniqueidentifier"; is_nullable = $true })
            $results | Should Be "Guid?"
        }
        It "should return DateTime for date" {
            $results = Get-CsType(@{ sql_type = "date" })
            $results | Should Be "DateTime"
        }
        It "should return DateTime? for nullable date" {
            $results = Get-CsType(@{ sql_type = "date"; is_nullable = $true })
            $results | Should Be "DateTime?"
        }
        It "should return DateTime for datetime" {
            $results = Get-CsType(@{ sql_type = "datetime" })
            $results | Should Be "DateTime"
        }
        It "should return DateTime? for nullable datetime" {
            $results = Get-CsType(@{ sql_type = "datetime"; is_nullable = $true })
            $results | Should Be "DateTime?"
        }
        It "should return string for char" {
            $results = Get-CsType(@{ sql_type = "char" })
            $results | Should Be "string"
        }
        It "should return string for nullable char" {
            $results = Get-CsType(@{ sql_type = "char"; is_nullable = $true })
            $results | Should Be "string"
        }
        It "should return string for varchar" {
            $results = Get-CsType(@{ sql_type = "varchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable varchar" {
            $results = Get-CsType(@{ sql_type = "varchar"; is_nullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nchar" {
            $results = Get-CsType(@{ sql_type = "nchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nchar" {
            $results = Get-CsType(@{ sql_type = "nchar"; is_nullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nvarchar" {
            $results = Get-CsType(@{ sql_type = "nvarchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nvarchar" {
            $results = Get-CsType(@{ sql_type = "nvarchar"; is_nullable = $true })
            $results | Should Be "string"
        }
    }
    Context "Get-TsType" {
        It "should return boolean for bit" {
            $results = Get-TsType(@{ sql_type = "bit" })
            $results | Should Be "boolean"
        }
        It "should return boolean for nullable bit" {
            $results = Get-TsType(@{ sql_type = "bit"; is_nullable = $true })
            $results | Should Be "boolean"
        }
        It "should return number for int" {
            $results = Get-TsType(@{ sql_type = "int" })
            $results | Should Be "number"
        }
        It "should return number for nullable int" {
            $results = Get-TsType(@{ sql_type = "int"; is_nullable = $true })
            $results | Should Be "number"
        }
        It "should return number for float" {
            $results = Get-TsType(@{ sql_type = "float" })
            $results | Should Be "number"
        }
        It "should return number for nullable float" {
            $results = Get-TsType(@{ sql_type = "float"; is_nullable = $true })
            $results | Should Be "number"
        }
        It "should return Guid for uniqueidentifier" {
            $results = Get-TsType(@{ sql_type = "uniqueidentifier" })
            $results | Should Be "any"
        }
        It "should return Guid? for nullable uniqueidentifier" {
            $results = Get-TsType(@{ sql_type = "uniqueidentifier"; is_nullable = $true })
            $results | Should Be "any"
        }
        It "should return Date for date" {
            $results = Get-TsType(@{ sql_type = "date" })
            $results | Should Be "Date"
        }
        It "should return Date for nullable date" {
            $results = Get-TsType(@{ sql_type = "date"; is_nullable = $true })
            $results | Should Be "Date"
        }
        It "should return Date for datetime" {
            $results = Get-TsType(@{ sql_type = "datetime" })
            $results | Should Be "Date"
        }
        It "should return Date for nullable datetime" {
            $results = Get-TsType(@{ sql_type = "datetime"; is_nullable = $true })
            $results | Should Be "Date"
        }
        It "should return string for char" {
            $results = Get-TsType(@{ sql_type = "char" })
            $results | Should Be "string"
        }
        It "should return string for nullable char" {
            $results = Get-TsType(@{ sql_type = "char"; is_nullable = $true })
            $results | Should Be "string"
        }
        It "should return string for varchar" {
            $results = Get-TsType(@{ sql_type = "varchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable varchar" {
            $results = Get-TsType(@{ sql_type = "varchar"; is_nullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nchar" {
            $results = Get-TsType(@{ sql_type = "nchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nchar" {
            $results = Get-TsType(@{ sql_type = "nchar"; is_nullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nvarchar" {
            $results = Get-TsType(@{ sql_type = "nvarchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nvarchar" {
            $results = Get-TsType(@{ sql_type = "nvarchar"; is_nullable = $true })
            $results | Should Be "string"
        }
    }
}