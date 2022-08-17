Function Get-MacAddress
{
    [CmdletBinding()]
    Param($ADComputerName)

    Get-CimInstance win32_networkadapterconfiguration -ComputerName $H$ADComputerName | Select-Object description, macaddress 
}
Function Get-Ping
{
    [CmdletBinding()]
    param($ADComputerName)

    Test-NetConnection $ADComputerName

}

Function Help-Techniek
{
    [cmdletBinding()]
    param($ADComputerNames)

    $ADComputerNames = $ADComputerNames.Split(",")

    foreach($ADComputerName in $ADComputerNames)
    {
        $ADComputerName = $ADComputerName.Trim()
        Get-ADComputer -Name $ADComputerName -Properties LastLogonDate, OperatingSystem
        Get-Ping -ADComputerName $ADComputerName
        Get-MacAddress -ADComputerName $ADComputerName
    }
}

$ADComputerNames = Read-Host "Geef de computernamen op, gescheiden door een komma"
Help-Techniek -ADComputerNames $ADComputerNames