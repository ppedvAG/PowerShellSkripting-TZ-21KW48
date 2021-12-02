### Mögliche Lösung zur Übung: Export / Import 1
```powershell
Get-EventLog -LogName System -Newest 10 | Export-Csv -Path C:\Testfiles\events.csv
```
Hinweiß:Get-Eventlog verwendet eine depricatet API, für produktive Abfrage Get-WinEvent verwenden.