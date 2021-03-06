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
```

- `-ConnectionString`: Required - The connection string to the desired database that contains the table

- `-Provider`: Optional - Defaults to System.Data.SqlClient

- `-Template`: Required - The filename of the template in the templates folder (not including the extension .erb, wildcards `*` allowed to run multiple templates)

- `-Table`: Required - The name of the table to generate code with (case senstive by the way)

- `-Project`: Optional - Defaults to current the Project, or specify the name of the project to attach the final code file to

- `-Force`: Optional - Defaults to false, whether or not to forcibly overwrite an existing file during template generation

### Helper

To simplify entering connection strings over and over, check out the [gencode] sample script. This file can be copied to the solution root folder, modified to your liking, and called from the Package Manager Console as follows: `.\gencode.ps1 -Project -Template -Table`. The sample provided uses a SQL Server LocalDB to demonstrate path setups (in case SQLite was preferred).

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
[gencode]: https://github.com/ellerbus/psakusei/blob/master/gencode.ps1