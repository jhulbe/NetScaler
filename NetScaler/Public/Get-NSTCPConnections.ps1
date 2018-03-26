<#
Copyright 2015 Brandon Olin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
#>

function Get-NSTCPConnections {
    <#
    .SYNOPSIS
        Get NetScaler connection table

    .DESCRIPTION
        Get NetScaler connection table

    .EXAMPLE
        Get-NSHostname

        Gets the current NetScaler connection table.

    .EXAMPLE
        
        Get-NSTCPConnections | ?{$_.sourceip -like "10.253.253*"} | ft
        Get-NSTCPConnections | ?{$_.svctype -eq "SSL"} | ft
        
    .PARAMETER Session

    #>
    [cmdletbinding()]
    param(
        $Session = $script:session
    )

    begin {
        _AssertSessionActive
    }

    process {
        $response = _InvokeNSRestApi -Session $Session -Method Get -Type nsconnectiontable -Action Get
        return $response.nsconnectiontable
    }
}