﻿function ConvertTo-Base64 {
    <#
        .SYNOPSIS
        Converts a string to a base64 encoded string.

        .DESCRIPTION
        Converts a string to a base64 encoded string.

        .EXAMPLE
        ConvertTo-Base64 -String 'ThisIsANiceString'
        VGhpc0lzQU5pY2VTdHJpbmc=

        Converts the string 'ThisIsANiceString' to a base64 encoded string.
    #>
    [OutputType([string])]
    [CmdletBinding()]
    param (
        # The string to convert to base64
        [Parameter(Mandatory)]
        [string] $String
    )

    [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($String))
}
