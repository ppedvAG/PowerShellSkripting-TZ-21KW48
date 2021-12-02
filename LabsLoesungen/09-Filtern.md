### Mögliche Lösung zur Übung Filtern
```powershell
Get-Service | Where-Object -FilterScript {$PSItem.Name.Length -gt 15}
```