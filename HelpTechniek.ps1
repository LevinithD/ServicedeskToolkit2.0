Function Get-Ping
{
    [CmdletBinding()]
    param($ADComputerName)

    Test-NetConnection $ADComputerName

}

Function HelpTechniek
{
    [cmdletBinding()]
    param($ADComputerNames)

    $ADComputerNames = $ADComputerNames.Split(",")

    foreach($ADComputerName in $ADComputerNames)
    {
        $ADComputerName = $ADComputerName.Trim()
        Get-ADComputer -Name $ADComputerName -Properties LastLogonDate, OperatingSystem
        Get-Ping -ADComputerName $ADComputerName
    }
}

$ADComputerNames = Read-Host "Geef de computernamen op, gescheiden door een komma"
