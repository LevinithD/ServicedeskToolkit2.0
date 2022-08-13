$ADComputerNames = "ADComputerName1", "ADComputerName2","ADComputerName3"

foreach($ADComputerName in $ADComputerNames)
{
    Get-ADComputer -Name $ADComputerName -Properties LastLogonDate, OperatingSystem
}
