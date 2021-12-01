### 1. Speichern des heutigen Datums in der Variable
```powershell
$Date = Get-Date
```
### 2. Ermitteln des Typs der Variable
```powershell
$Date | Get-Member
```
Der Datentyp der Variable ist: **System.DateTime**
### 3. Welches Datum haben wir in 100 Tagen
```powershell
$Date.AddDays(100)
```
Oder als alternative Loesungen:
```powershell
(Get-Date).AddDays(100)
```

