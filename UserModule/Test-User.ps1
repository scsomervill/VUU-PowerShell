<#
.Synopsis
   Check to see if a username already exists in a Domain
.DESCRIPTION
   Long description
.EXAMPLE
   Test that returns true
   PS C:\Windows\system32> Test-User scsomervill
   True

.EXAMPLE
   Test that returns false
   PS C:\Windows\system32> test-user abcd123
   False
#>
function Test-User
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
        $SamAccountName
    )

    Begin
    {
    }
    Process
    {
        if (dsquery user -samid $SamAccountName) 
            {return $true} else {return $false}
    }
    End
    {
    }
}