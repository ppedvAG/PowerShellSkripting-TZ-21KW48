<#
.Synopsis
   Abfrage von Security Events
.DESCRIPTION
   Mit diesem Skript können Anmelde und Abmeldebezogene Events abgefragt werden.
.PARAMETER EventId
   Mit diesem Parameter wird festgelegt ob es sich um 
   AnmeldeEvents: 4624
   AbmeldeEvents: 4634
   oder fehlgeschlagene Anmeldungen: 4625
   handelt.
.EXAMPLE
   GetLogonEvents.ps1 -Newest 6 -EventId 4634

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   21054 Dez 03 09:49  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21050 Dez 03 09:49  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21047 Dez 03 09:49  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21046 Dez 03 09:49  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21043 Dez 03 09:49  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21040 Dez 03 09:49  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
.EXAMPLE
   GetLogonEvents.ps1 -Newest 6 -EventId 4634 -Verbose
   AUSFÜHRLICH: Der User hat folgende Werte angegeben: localhost | 6 | 4634

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   21074 Dez 03 09:53  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21071 Dez 03 09:52  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21068 Dez 03 09:51  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21065 Dez 03 09:51  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21062 Dez 03 09:51  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
   21059 Dez 03 09:50  SuccessA... Microsoft-Windows...         4634 Ein Konto wurd...
#>
[cmdletBinding()]
param(
[ValidateSet(4624,4625,4634)]
[Parameter(Mandatory=$true)] #Mandatory = $true setzt diesen Parameter als Pflichtparameter
[int]$EventId ,

[ValidateScript({Test-NetConnection -Computername $PSItem -CommonTCPPort WinRm})]
[string]$ComputerName = "localhost" ,

[ValidateRange(1,10)]
[int]$Newest = 5
)
$Newest = 11
#Diese ZusatzInfo wird nur ausgegeben wenn das Skript mit -Verbose gestartet wird.
Write-Verbose -Message "Der User hat folgende Werte angegeben: $ComputerName | $Newest | $EventId"

Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventID -eq $EventId | Select-Object -First $Newest

