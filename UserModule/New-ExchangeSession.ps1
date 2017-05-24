<#
.Synopsis
   Create a new exchange session
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function New-ExchangeSession
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $ExchangeServer
    )

    Begin
    {
    }
    Process
    {
        $ExchSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionURI http://$ExchangeServer/powershell -Authentication Kerberos -Name ExchangeSession
    }
    End
    {
    }
}