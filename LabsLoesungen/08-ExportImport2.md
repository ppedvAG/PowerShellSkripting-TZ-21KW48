### Mögliche Lösungen zu Export Import 22

#### Mögliche Lösung 1
```powershell
 $Inhalt = Get-Content -Path C:\Testfiles\MyServices.txt
 Get-Service -Name $Inhalt
```

#### Möglihce Lösung 2
```powershell
Get-Content -Path C:\Testfiles\MyServices.txt | Get-Service
```