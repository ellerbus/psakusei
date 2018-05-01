Write-Host "Packing ..." -ForegroundColor White

Remove-Item -Path ".\nuget\*.nupkg" -Force

.\nuget\nuget.exe pack ".\nuget\psakusei.nuspec" -OutputDirectory ".\nuget\" -BasePath ".\src\" -Verbosity quiet -NoPackageAnalysis

Write-Host "Packed" -ForegroundColor Green
