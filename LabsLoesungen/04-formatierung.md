```powershell
PS C:\> Get-Service | Sort-Object -Property Status,DisplayName | Format-Table -GroupBy Status | Out-File -FilePath C:\Testfiles\Services.txt
```