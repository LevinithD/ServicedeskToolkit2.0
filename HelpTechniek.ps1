$ADComputerName = "ADComputerName"

Get-ADComputer -Name $ADComputerName -Properties LastLogonDate, OperatingSystem