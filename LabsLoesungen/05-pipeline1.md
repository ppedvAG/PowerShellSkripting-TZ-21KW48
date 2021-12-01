### 1. Lösung
```powershell
Get-ADUser -Filter * | Format-Wide Surname -AutoSize
```
### 2. Lösung
```powershell
Get-ADUser -Filter * | Sort-Object -Property GivenName
```
### 3. Lösung
```powershell
Get-ADGroup -Filter * | Measure-Object
```
### 4. Lösung
```powershell
Get-AdUser -Filter *  | Select-Object -Last 3
```