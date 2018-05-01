$root = $PSScriptRoot | Split-Path -Parent

. "$root\src\tools\psakusei\Casing.ps1"
. "$root\src\tools\psakusei\Plural.ps1"

Describe "Plural" {
    Context "global:Pluralize" {
        It "should handle member" {
            $results = "member" | Pluralize
            $results | Should Be "members"
        }
        It "should handle person" {
            $results = "person" | Pluralize
            $results | Should Be "people"
        }
        It "should handle fox" {
            $results = "fox" | Pluralize
            $results | Should Be "foxes"
        }
        It "should handle datum" {
            $results = "datum" | Pluralize
            $results | Should Be "data"
        }
        It "should handle sheep" {
            $results = "sheep" | Pluralize
            $results | Should Be "sheep"
        }
        It "should handle mop" {
            $results = "mop" | Pluralize
            $results | Should Be "mops"
        }
        It "should handle fly" {
            $results = "fly" | Pluralize
            $results | Should Be "flies"
        }
    }
}