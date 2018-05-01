$root = $PSScriptRoot | Split-Path -Parent

. "$root\src\tools\psakusei\Singular.ps1"

Describe "Singular" {
    Context "global:Singularize" {
        It "should handle members" {
            $results = "members" | Singularize
            $results | Should Be "member"
        }
        It "should handle people" {
            $results = "people" | Singularize
            $results | Should Be "person"
        }
        It "should handle foxes" {
            $results = "foxes" | Singularize
            $results | Should Be "fox"
        }
        It "should handle data" {
            $results = "data" | Singularize
            $results | Should Be "datum"
        }
        It "should handle sheep" {
            $results = "sheep" | Singularize
            $results | Should Be "sheep"
        }
        It "should handle mops" {
            $results = "mops" | Singularize
            $results | Should Be "mop"
        }
        It "should handle flies" {
            $results = "flies" | Singularize
            $results | Should Be "fly"
        }
    }
}