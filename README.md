psakusei - sakusei (sok-say) is Japanese for create (and yes it's a play on [psake] the PowerShell build tool). psakusei helps you quickly generate boiler plate or starter code using a database first design approach. Having tables within a database, code is then generated
for every layer of the application using approrpriate templates.

## Getting Started

### Installation

```ps1
PM/> Install-Package psakusei
```

During installation psakusei will create a `Templates` folder at the solution root and copy all available templates from psakusei.

### Usage

```ps1
PM\> Invoke-psakusei -ConnectionString "Data Source=.; Database=DBNAME; <creds>" -Template "Database*" -Table "Member" [-Force] [-Project "MyProject"] [-Provider "System.Data.SqlClient"]

# Alias'd for those who don't want to type psakusei
PM\> gencode -ConnectionString "Data Source=.; Database=DBNAME; <creds>" -Template "Database*" -Table "Member" [-Force] [-Project "MyProject"] [-Provider "System.Data.SqlClient"]
```

- `-ConnectionString`: Required - The connection string to the desired database that contains the table

- `-Provider`: Optional - Defaults to System.Data.SqlClient

- `-Template`: Required - The filename of the template in the templates folder (not including the extension .erb, wildcards `*` allowed to run multiple templates)

- `-Table`: Required - The name of the table to generate code with

- `-Project`: Optional - Defaults to current the Project, or specify the name of the project to attach the final code file to

- `-Force`: Optional - Defaults to false, whether or not to forcibly override an existing file during template generation

## Templates

psakusei uses [DatabaseSchemaReader] to read various database engine schemas into a consistant object model and [EPS] as the underlying template engine. The table schema is accessed through the template variable `$table`. For specific details for SQL engines supported, refer to the [DB Schema Wiki]. Alternatively, for EPS template details refer to the [EPS] readme. For all available templates, check out psakusei's [Templates Folder].

### Built-In Template Filters

- `Plural`: Using English based grammar rules converts a word to its plural form as converted from [Ruby Inflection] rules
- `Singular`: Using English based grammar rules converts a word to its singular form as converted from [Ruby Inflection] rules
- `Capitalize`: Converts `myFUNNYName` to `MyFUNNYName`
- `Upper`: Converts `myFUNNYName` to `MYFUNNYNAME`
- `Lower`: Converts `myFUNNYName` to `myfunnyname`
- `Snake`: Converts `myFUNNYName` to `my_funny_name`
- `Spine`: Converts `myFUNNYName` to `my-funny-name`
- `Constant`: Converts `myFUNNYName` to `MY_FUNNY_NAME`
- `Pascal`: Converts `myFUNNYName` to `MyFunnyName`
- `Label`: Converts `myFUNNYName` to `My Funny Name`
- `Camel`: Converts `myFUNNYName` to `myFunnyName`
- `Last`: Converts `myFUNNYName` to `Name`
 





[DatabaseSchemaReader]: https://github.com/martinjw/dbschemareader/
[DB Schema Wiki]: https://github.com/martinjw/dbschemareader/wiki
[EPS]: https://github.com/straightdave/eps
[psake]: https://github.com/psake/psake
[Ruby Inflection]: https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflections.rb
[Templates Folder]: https://github.com/ellerbus/psakusei/tree/master/src/tools/psakusei/Templates
