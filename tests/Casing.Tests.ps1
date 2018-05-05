$root = $PSScriptRoot | Split-Path -Parent

. "$root\src\tools\psakusei\Casing.ps1"

Describe "Casing" {
    Context "global:Slit" {
        It "should split" {
            $items = Split("Some_FUNNYName")
            $items | Should Be @("Some", "FUNNY", "Name")
        }
    }
    Context "global:Combine" {
        It "should combine using pipeline" {
            $results = @("Some", "FUNNY", "Name") | Combine
            $results | Should Be "Some,FUNNY,Name"
        }
        It "should combine using parameter" {
            $items = @("Some", "FUNNY", "Name")
            $results = Combine $items
            $results | Should Be "Some,FUNNY,Name"
        }
        It "should combine using pipeline w/Split" {
            $results = Split("Some_FUNNYName") | Combine
            $results | Should Be "Some,FUNNY,Name"
        }
        It "should combine using custom separator" {
            $results = Split("Some_FUNNYName") | Combine -Separator ":"
            $results | Should Be "Some:FUNNY:Name"
        }
        It "should combine using custom separator alias" {
            $results = Split("Some_FUNNYName") | Combine -Sep ":"
            $results | Should Be "Some:FUNNY:Name"
        }
    }
    Context "global:Capitalize" {
        It "should capitalize" {
            $items = "FUNNY" | Capitalize
            $items | Should Be "Funny"
        }
        It "should capitalize with on letter" {
            $items = "f" | Capitalize
            $items | Should Be "F"
        }
    }
    Context "global:Upper" {
        It "should uppercase" {
            $items = "funny" | Upper
            $items | Should Be "FUNNY"
        }
    }
    Context "global:Lower" {
        It "should lowercase" {
            $items = "FUNNY" | Lower
            $items | Should Be "funny"
        }
    }
    Context "global:Constant" {
        It "should constant case" {
            $items = "Some_FUNNYName" | Constant
            $items | Should Be "SOME_FUNNY_NAME"
        }
        It "should constant case one" {
            $items = "one" | Constant
            $items | Should Be "ONE"
        }
    }
    Context "global:Snake" {
        It "should snake case" {
            $items = "Some_FUNNYName" | Snake
            $items | Should Be "some_funny_name"
        }
        It "should snake case one" {
            $items = "one" | Snake
            $items | Should Be "one"
        }
    }
    Context "global:Spine" {
        It "should spine-case" {
            $items = "Some_FUNNYName" | Spine
            $items | Should Be "some-funny-name"
        }
        It "should spine-case one" {
            $items = "one" | Spine
            $items | Should Be "one"
        }
    }
    Context "global:Pascal" {
        It "should pascal case" {
            $items = "Some_FUNNYName" | Pascal
            $items | Should Be "SomeFunnyName"
        }
        It "should pascal case one" {
            $items = "one" | Pascal
            $items | Should Be "one"
        }
    }
    Context "global:Label" {
        It "should label case" {
            $items = "Some_FUNNYName" | Label
            $items | Should Be "Some Funny Name"
        }
        It "should label case one" {
            $items = "one" | Label
            $items | Should Be "One"
        }
    }
    Context "global:Camel" {
        It "should camel case" {
            $items = "Some_FUNNYName" | Camel
            $items | Should Be "someFunnyName"
        }
        It "should camel case (member_id)" {
            $items = "member_id" | Camel
            $items | Should Be "memberId"
        }
        It "should camel case one" {
            $items = "one" | Camel
            $items | Should Be "one"
        }
    }
    Context "global:Last" {
        It "should get last word" {
            $items = "Some_FUNNYName" | Last
            $items | Should Be "Name"
        }
        It "should get last word" {
            $items = "Member" | Last
            $items | Should Be "Member"
        }
        It "should camel case one" {
            $items = "one" | Last
            $items | Should Be "one"
        }
    }
}