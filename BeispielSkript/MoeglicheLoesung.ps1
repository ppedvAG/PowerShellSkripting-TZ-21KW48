[cmdletBinding()]
param(
[string]$ordner_name = "Ordner" ,
[int]$ordner_anzahl = 5 ,
[string]$ordner_pfad = "C:\" ,
[string]$datei_name = "Datei" ,
[int]$datei_anzahl = 5,
[switch]$Force
)

$pfad = $ordner_pfad + "TestFiles2"

if(Test-Path -Path $pfad)
{
    if($Force)
    {
        Get-ChildItem -Path $pfad | Remove-Item -Force -Recurse
    }
    else
    {
        #Write-Debug -Message "Nicht terminierender Fehler"
        throw "Terminierender Fehler: Ordner bereits vorhanden"
    }
}
else
{
    New-Item -Path $pfad -ItemType Directory
}



for($j = 1; $j -le $datei_anzahl; $j++)
{
     $filename = $datei_name + ("{0:D3}" -f $j) + ".txt"
     New-Item -ItemType File -Path $pfad -Name $filename
}


For ($i = 1; $i -le $ordner_anzahl; $i++) 
{
    $DirPath = $pfad  + "\" + $ordner_name + ("{0:d3}" -f  $i)
    if (-not (Test-Path $DirPath))
    {
        New-Item -Path $DirPath -ItemType "Directory" -Force
        for($j = 1; $j -le $datei_anzahl; $j++)
        {
            $filename = "O$i" + "-" + $datei_name + ("{0:D3}" -f $j) + ".txt"
            New-Item -ItemType File -Path $DirPath -Name $filename
        }
    }
}