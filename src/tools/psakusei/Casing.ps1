
function global:Split([string]$text) {
    $rgx = [regex]"(?x)([A-Z][A-Z0-9]+(?![a-z]))|([A-Z][a-z]+)|([a-z]+)|([0-9]+)|(_+)"

    return $rgx.Split($text) | Where-Object { $_ -and $_ -ne "_" }
}

function global:Combine {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline, Position = 1)]
        [String[]]$items,

        [Alias("Sep")]
        [Parameter(Mandatory = $false, ValueFromRemainingArguments)]
        [String]$Separator = ","
    )
    
    begin {
        $is_pipeline = -not $PSBoundParameters.ContainsKey("items")

        $text = ""
    }

    process {
        if ($is_pipeline) {
            $text = $text + $Separator + $_
        }
        else {
            $text = $items -join $Separator
        }
    }

    end {
        return $text.TrimStart($Separator)
    }
}

function global:Capitalize {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )

    if ($text.Length -eq 1) {
        return $text.ToUpper()
    }

    return $text.Substring(0, 1).ToUpper() + $text.Substring(1).ToLower()
}

function global:Upper {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return $text.ToUpper()
}

function global:Lower {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return $text.ToLower()
}

function global:Snake {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return Split($text) | Combine -Separator "_" | Lower
}

function global:Spine {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return Split($text) | Combine -Separator "-" | Lower
}

function global:Constant {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return Split($text) | Combine -Separator "_" | Upper
}

function global:Pascal {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return Split($text) | ForEach-Object { $_ | Capitalize } | Combine -Separator "" 
}

function global:Label {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    return Split($text) | ForEach-Object { $_ | Capitalize } | Combine -Separator " " 
}

function global:Camel {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    $parts = Split($text)
    
    for ($x = 0; $x -lt $parts.Length; $x += 1) {
        if ($x -eq 0) {
            $parts[$x] = $parts[$x] | Lower
        }
        else {
            $parts[$x] = $parts[$x] | Capitalize
        }
    }

    return $parts | Combine -Separator ""
}

function global:Last {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline)]
        [string]$text
    )
    
    $parts = Split($text)

    if ($parts -is [string]) {
        return $parts
    }

    return $parts[$parts.Length - 1]
}