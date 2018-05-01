$class = $table.name | Pascal

$var_name = $class | Last | Lower
$var_names = $class | Last | Lower | Pluralize

function Get-ProcedureParameter($column, $var_prefix = "@")
{
    $text = $var_prefix + $column.name + " " + $column.sql_type

    if ($column.cs_type -ieq 'string')
    {
        $text = $text + "($($column.length))"
    }

    return $text
}
