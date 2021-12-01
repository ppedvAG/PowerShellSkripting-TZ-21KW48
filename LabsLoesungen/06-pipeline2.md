### Mögliche Lösung Hauptaufgabe
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -Sum
```

---

### Mögliche Lösung Fleißaufgaben 1
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -Sum | Format-Table -Property @{n="MB";e={$PSItem.Sum /1MB;formatstring=N2}}
```

### Mögliche Lösung Fleißaufgaben 2
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -Sum | Select-Object -Property @{n="MB";e={"{0:N2}"-f ($PSItem.Sum /1MB)}}
```

### Mögliche Lösung Fleißaufgaben 3
```powershell
"{0:N2}" -f ((Get-Process -Name svchost | Measure-Object -Property PM -Sum).Sum /1MB)
```