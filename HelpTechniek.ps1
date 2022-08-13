Function HelpTechniek
{
    [cmdletBinding()]
    param($ADComputerNames)

    $ADComputerNames = $ADComputerNames.Split(",")

    foreach($ADComputerName in $ADComputerNames)
    {
        $ADComputerName = $ADComputerName.Trim()
        Get-ADComputer -Name $ADComputerName -Properties LastLogonDate, OperatingSystem
        Test-NetConnection $ADComputerName
    }
}

$ADComputerNames = Read-Host "Geef de computernamen op, gescheiden door een komma"
