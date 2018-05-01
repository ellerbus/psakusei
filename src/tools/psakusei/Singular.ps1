


function global:Singularize
{
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$word
    )

    Set-Variable -Name rules -Option Constant -Val @(
        #https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflections.rb
        @{ rule = "^people$"; replace = "person" }
        @{ rule = "^men$"; replace = "man" }
        @{ rule = "^women$"; replace = "woman" }
        @{ rule = "^(child)ren$"; replace = "`$1" }
        @{ rule = "^(zombie)s$"; replace = "`$1" }
        @{ rule = "(database)s$"; replace = "`$1" }
        @{ rule = "(quiz)zes$"; replace = "`$1" }
        @{ rule = "(matr)ices$"; replace = "`$1ix" }
        @{ rule = "(vert|ind)ices$"; replace = "`$1ex" }
        @{ rule = "^(ox)en"; replace = "`$1" }
        @{ rule = "(alias|status)(es)?$"; replace = "`$1" }
        @{ rule = "(octop|vir)(us|i)$"; replace = "`$1us" }
        @{ rule = "^(a)x[ie]s$"; replace = "`$1xis" }
        @{ rule = "(cris|test)(is|es)$"; replace = "`$1is" }
        @{ rule = "(shoe)s$"; replace = "`$1" }
        @{ rule = "(o)es$"; replace = "`$1" }
        @{ rule = "(bus)(es)?$"; replace = "`$1" }
        @{ rule = "^(m|l)ice$"; replace = "`$1ouse" }
        @{ rule = "(x|ch|ss|sh)es$"; replace = "`$1" }
        @{ rule = "(m)ovies$"; replace = "`$1ovie" }
        @{ rule = "(s)eries$"; replace = "`$1eries" }
        @{ rule = "([^aeiouy]|qu)ies$"; replace = "`$1y" }
        @{ rule = "([lr])ves$"; replace = "`$1f" }
        @{ rule = "(tive)s$"; replace = "`$1" }
        @{ rule = "(hive)s$"; replace = "`$1" }
        @{ rule = "([^f])ves$"; replace = "`$1fe" }
        @{ rule = "(^analy)(sis|ses)$"; replace = "`$1sis" }
        @{ rule = "((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$"; replace = "`$1sis" }
        @{ rule = "([ti])a$"; replace = "`$1um" }
        @{ rule = "(n)ews$"; replace = "`$1ews" }
        @{ rule = "(ss)$"; replace = "`$1" }
        @{ rule = "s$"; replace = "" }
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