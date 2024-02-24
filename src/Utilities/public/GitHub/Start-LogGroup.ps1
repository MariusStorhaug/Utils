﻿function Start-LogGroup {
    <#
        .SYNOPSIS
        Starts a new log group.

        .DESCRIPTION
        Starts a new log group.

        .EXAMPLE
        New-LogGroup -Name 'MyGroup'
    #>
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSAvoidUsingWriteHost', '',
        Justification = 'Write-Host is used to group log messages.'
    )]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '', Scope = 'Function',
        Justification = 'This function does not change state. It only logs messages.'
    )]
    param(
        # Name of the log group.
        [Parameter(Mandatory)]
        [string] $Name
    )

    if ($env:GITHUB_ACTIONS) {
        Write-Host "::group::$Name"
    } elseif ( $env:SYSTEM_TEAMFOUNDATIONCOLLECTIONURI ) {
        Write-Host "##[group]$Name"
    } else {
        Write-Host "-------- $Name --------"
    }
}
