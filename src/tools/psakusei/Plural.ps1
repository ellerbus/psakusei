


function global:Pluralize
{
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$word
    )

    Set-Variable -Name rules -Option Constant -Val @(
        #https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflections.rb
        @{ rule = "^person$"; replace = "people" }
        @{ rule = "^sheep$"; replace = "sheep" }
        @{ rule = "^man$"; replace = "men" }
        @{ rule = "^woman$"; replace = "women" }
        @{ rule = "^child$"; replace = "children" }
        @{ rule = "^(zombie)$"; replace = "`$1s" }
        @{ rule = "(quiz)$"; replace = "`$1zes" }
        @{ rule = "^(oxen)$"; replace = "`$1" }
        @{ rule = "^(ox)$"; replace = "`$1en" }
        @{ rule = "^(m|l)ice$"; replace = "`$1ice" }
        @{ rule = "^(m|l)ouse$"; replace = "`$1ice" }
        @{ rule = "(matr|vert|ind)(?:ix|ex)$"; replace = "`$1ices" }
        @{ rule = "(x|ch|ss|sh)$"; replace = "`$1es" }
        @{ rule = "([^aeiouy]|qu)y$"; replace = "`$1ies" }
        @{ rule = "(hive)$"; replace = "`$1s" }
        @{ rule = "(?:([^f])fe|([lr])f)$"; replace = "`$1$2ves" }
        @{ rule = "sis$"; replace = "ses" }
        @{ rule = "([ti])a$"; replace = "`$1a" }
        @{ rule = "([ti])um$"; replace = "`$1a" }
        @{ rule = "(buffal|tomat)o$"; replace = "`$1oes" }
        @{ rule = "(bu)s$"; replace = "`$1ses" }
        @{ rule = "(alias|status)$"; replace = "`$1es" }
        @{ rule = "(octop|vir)i$"; replace = "`$1i" }
        @{ rule = "(octop|vir)us$"; replace = "`$1i" }
        @{ rule = "^(ax|test)is$"; replace = "`$1es" }
        @{ rule = "s$"; replace = "s" }
        @{ rule = "$"; replace = "s" }
    )

    foreach ($item in $rules) {
        $rule = $item.rule
        $replace = $item.replace

        if ($word -imatch $item.rule)
        {
            return $word -ireplace $item.rule, $item.replace
        }
    }

    return $word    
}