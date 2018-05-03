$root = $PSScriptRoot | Split-Path -Parent

. "$root\src\tools\psakusei\Schema.ps1"

Describe "Schema" {
    Context "CsType" {
        It "should return bool for bit" {
            $results = CsType(@{ DbDataType = "bit" })
            $results | Should Be "bool"
        }
        It "should return bool? for nullable bit" {
            $results = CsType(@{ DbDataType = "bit"; IsNullable = $true })
            $results | Should Be "bool?"
        }
        It "should return int for int" {
            $results = CsType(@{ DbDataType = "int" })
            $results | Should Be "int"
        }
        It "should return int? for nullable int" {
            $results = CsType(@{ DbDataType = "int"; IsNullable = $true })
            $results | Should Be "int?"
        }
        It "should return double for float" {
            $results = CsType(@{ DbDataType = "float" })
            $results | Should Be "double"
        }
        It "should return double? for nullable float" {
            $results = CsType(@{ DbDataType = "float"; IsNullable = $true })
            $results | Should Be "double?"
        }
        It "should return Guid for uniqueidentifier" {
            $results = CsType(@{ DbDataType = "uniqueidentifier" })
            $results | Should Be "Guid"
        }
        It "should return Guid? for nullable uniqueidentifier" {
            $results = CsType(@{ DbDataType = "uniqueidentifier"; IsNullable = $true })
            $results | Should Be "Guid?"
        }
        It "should return DateTime for date" {
            $results = CsType(@{ DbDataType = "date" })
            $results | Should Be "DateTime"
        }
        It "should return DateTime? for nullable date" {
            $results = CsType(@{ DbDataType = "date"; IsNullable = $true })
            $results | Should Be "DateTime?"
        }
        It "should return DateTime for datetime" {
            $results = CsType(@{ DbDataType = "datetime" })
            $results | Should Be "DateTime"
        }
        It "should return DateTime? for nullable datetime" {
            $results = CsType(@{ DbDataType = "datetime"; IsNullable = $true })
            $results | Should Be "DateTime?"
        }
        It "should return string for char" {
            $results = CsType(@{ DbDataType = "char" })
            $results | Should Be "string"
        }
        It "should return string for nullable char" {
            $results = CsType(@{ DbDataType = "char"; IsNullable = $true })
            $results | Should Be "string"
        }
        It "should return string for varchar" {
            $results = CsType(@{ DbDataType = "varchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable varchar" {
            $results = CsType(@{ DbDataType = "varchar"; IsNullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nchar" {
            $results = CsType(@{ DbDataType = "nchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nchar" {
            $results = CsType(@{ DbDataType = "nchar"; IsNullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nvarchar" {
            $results = CsType(@{ DbDataType = "nvarchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nvarchar" {
            $results = CsType(@{ DbDataType = "nvarchar"; IsNullable = $true })
            $results | Should Be "string"
        }
    }
    Context "TsType" {
        It "should return boolean for bit" {
            $results = TsType(@{ DbDataType = "bit" })
            $results | Should Be "boolean"
        }
        It "should return boolean for nullable bit" {
            $results = TsType(@{ DbDataType = "bit"; IsNullable = $true })
            $results | Should Be "boolean"
        }
        It "should return number for int" {
            $results = TsType(@{ DbDataType = "int" })
            $results | Should Be "number"
        }
        It "should return number for nullable int" {
            $results = TsType(@{ DbDataType = "int"; IsNullable = $true })
            $results | Should Be "number"
        }
        It "should return number for float" {
            $results = TsType(@{ DbDataType = "float" })
            $results | Should Be "number"
        }
        It "should return number for nullable float" {
            $results = TsType(@{ DbDataType = "float"; IsNullable = $true })
            $results | Should Be "number"
        }
        It "should return Guid for uniqueidentifier" {
            $results = TsType(@{ DbDataType = "uniqueidentifier" })
            $results | Should Be "any"
        }
        It "should return Guid? for nullable uniqueidentifier" {
            $results = TsType(@{ DbDataType = "uniqueidentifier"; IsNullable = $true })
            $results | Should Be "any"
        }
        It "should return Date for date" {
            $results = TsType(@{ DbDataType = "date" })
            $results | Should Be "Date"
        }
        It "should return Date for nullable date" {
            $results = TsType(@{ DbDataType = "date"; IsNullable = $true })
            $results | Should Be "Date"
        }
        It "should return Date for datetime" {
            $results = TsType(@{ DbDataType = "datetime" })
            $results | Should Be "Date"
        }
        It "should return Date for nullable datetime" {
            $results = TsType(@{ DbDataType = "datetime"; IsNullable = $true })
            $results | Should Be "Date"
        }
        It "should return string for char" {
            $results = TsType(@{ DbDataType = "char" })
            $results | Should Be "string"
        }
        It "should return string for nullable char" {
            $results = TsType(@{ DbDataType = "char"; IsNullable = $true })
            $results | Should Be "string"
        }
        It "should return string for varchar" {
            $results = TsType(@{ DbDataType = "varchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable varchar" {
            $results = TsType(@{ DbDataType = "varchar"; IsNullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nchar" {
            $results = TsType(@{ DbDataType = "nchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nchar" {
            $results = TsType(@{ DbDataType = "nchar"; IsNullable = $true })
            $results | Should Be "string"
        }
        It "should return string for nvarchar" {
            $results = TsType(@{ DbDataType = "nvarchar" })
            $results | Should Be "string"
        }
        It "should return string for nullable nvarchar" {
            $results = TsType(@{ DbDataType = "nvarchar"; IsNullable = $true })
            $results | Should Be "string"
        }
    }
}