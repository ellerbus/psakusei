## Usage

```ps
PowerShell\> .\CodeGen.ps1 -Template Database.* -Table dbo.Member
```

```ps
$parameters.ConnectionSettings = @{
    ConnectionString = "Server=(localdb)\mssqllocaldb; AttachDbFilename=$db; Database=SAMPLE; Integerated Security=true;"
    ProviderName     = "System.Data.SqlClient"
}
```