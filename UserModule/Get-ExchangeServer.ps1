# Function Get-ExchangeServers
# Written by Seth Somervill
# Date 5-24-17

<#
.Synopsis
   Returns all exchange servers in a Domain
.DESCRIPTION
   Get-ExchangeServers will load the Active Directory module, if not already loaded, and find all the Microsoft Exchange Servers in the Domain. 
   If the Active Directory module fails to load the script will stop
.EXAMPLE
    

    PS C:\Windows\system32> Get-ExchangeServers
    
    Name         
    ----         
    EXCHANGESERVER01
    EXCHANGESERVER02

.EXAMPLE
   Another example of how to use this cmdlet
#>
function Get-ExchangeServer
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        
    )

    Begin
    {
        if (!(Get-Module ActiveDirectory)){
            Import-Module ActiveDirectory -ErrorAction Stop
            }
    }
    Process
    {
        $ExchangeServerList = Get-ADGroup -Identity "Exchange Servers" | Get-ADGroupMember | where {$_.objectClass -eq "computer"} | Select Name
        Return $ExchangeServerList
    }
    End
    {
    }
}