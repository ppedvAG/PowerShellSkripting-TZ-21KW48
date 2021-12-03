## Freiwillige "Hausaufgaben"
1. Erzeugen Sie mehere AD-Benutzer in einem Rutsch mithilfe eines CSV Files folgende Attribute sollten mindestens vorkommen:
    - GivenName
    - SurName
    - Name
    - SamAccountName
    - Enabled
    - Password
2. Erzeugen Sie eine Schleife welches Dateien anlegt und der Dateiname sollte fortlaufend sein. 
    - z.b: Datei1.txt , Datei2.txt , . . . 
        - optional Fleißaufgabe: Führende Nullen z.B. Datei001.txt , Datei002.txt , . . . 
    - Hint: New-Item
3. Erzeugen Sie die Datei "C:\TestFiles\iftest.txt" wenn sie noch nicht existiert. Die Prüfung sollte mit einem IF erfolgen
    - Hint: Test-Path


## Lösung:
1. 
Einfache Variante aber mit deaktivierten Usern
```powershell
Import-CSV -Path C:\testfiles\MyNewAdUsers1.csv | New-ADUSer
```
Mit aktivierten Usern. Da hier das Passwort in einen SecureString konvertiert wird und der Boolean aus der CSV sauber geparsed wird
```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers2.csv | ForEach-Object {
            New-ADUser -GivenName $_.GivenName `
                       -Surname $_.GivenName `
                       -Name $_.Name `
                       -SamAccountName $_.SamAccountName `
                       -Department $_.Department `
                       -Path $_.Path `
                       -Enabled ([bool]::Parse($_.Enabled)) `
                       -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force)
}
```
2. 3.
```powershell
for($i = 1; $i -le 10; $i++)
{
    $pfad = "C:\testfiles\" + "File" + ("{0:D3}" -f $i) + ".txt"
    if(Test-Path -Path $pfad)
    {
        Write-Verbose -Message "Datei schon vorhanden"
    }
    else
    {
        New-Item -Path $pfad -ItemType File 
    }
}
```
