BeforeAll 
{   
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

Describe "Help-Techniek" 
{
    It "Returns Name, LastLogonDate, OperatingSystem"
    {
        Help-Techniek -ADComputerName "ADComputerName1" | Should-Be 'Name, LastLogonDate, OperatingSystem'
    }
}