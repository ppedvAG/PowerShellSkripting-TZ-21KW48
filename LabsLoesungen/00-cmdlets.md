### Lösung zu 1
```powershell
Get-Command -Noun "*Computer*"
```
### Lösung zu 2
Hierzu sollte man vorher die Hilfe runterladen
```powershell
Get-Help Set-Service -Examples
```

### Lösung zu 3
```powershell
Get-Alias -Name dir,cd
```
oder alternativ
```powershell
Get-Command -Name dir,cd
```
### Lösung zu 4
Ohne die Angabe von -WhatIf würden alle Textdateien gelöscht die innerhalb der Testfiles Ordnerstruktur liegen.
```powershell
Get-ChildItem -Path C:\Testfiles -Filter *.txt -Recurse | Remove-Item -WhatIf
```