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
