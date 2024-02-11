﻿Describe 'New-SemVer' {
    It "Setting Major to 1" {
        $semver = New-SemVer -Major 1 -Minor 2 -Patch 3
        $semver.Major | Should -Be 1
    }
    It "Setting Minor to 2" {
        $semver = New-SemVer -Major 1 -Minor 2 -Patch 3
        $semver.Minor | Should -Be 2
    }
    It "Setting Patch to 3" {
        $semver = New-SemVer -Major 1 -Minor 2 -Patch 3
        $semver.Patch | Should -Be 3
    }
    It "Setting Prerelease to 'alpha'" {
        $semver = New-SemVer -Major 1 -Minor 2 -Patch 3 -Prerelease 'alpha'
        $semver.Prerelease | Should -Be 'alpha'
    }
    It "Setting BuildMetadata to '654646554'" {
        $semver = New-SemVer -Major 1 -Minor 2 -Patch 3 -Build '654646554'
        $semver.BuildMetadata | Should -Be '654646554'
    }
    It "Passing 'null' returns a '0.0.0' version." {
        $semver = New-SemVer
        $semver.Major | Should -Be 0
        $semver.Minor | Should -Be 0
        $semver.Patch | Should -Be 0
        $semver.Prerelease | Should -BeNullOrEmpty
        $semver.BuildMetadata | Should -BeNullOrEmpty
    }
    It "Passing '' returns a '0.0.0' version." {
        $semver = '' | New-SemVer
        $semver.Major | Should -Be 0
        $semver.Minor | Should -Be 0
        $semver.Patch | Should -Be 0
        $semver.Prerelease | Should -BeNullOrEmpty
        $semver.BuildMetadata | Should -BeNullOrEmpty
    }
}

Describe 'ConvertTo-SemVer' {
    It "Converts '1.2.3' to SemVer using parameters." {
        $semver = ConvertTo-SemVer -Version '1.2.3'
        $semver.Major | Should -Be 1
        $semver.Minor | Should -Be 2
        $semver.Patch | Should -Be 3
    }
    It "Converts '1.2.3' to SemVer using pipeline." {
        $semver = '1.2.3' | ConvertTo-SemVer
        $semver.Major | Should -Be 1
        $semver.Minor | Should -Be 2
        $semver.Patch | Should -Be 3
    }
    It "Converts '1.2.3-alpha.1+1' to SemVer using parameters." {
        $semver = ConvertTo-SemVer -Version '1.2.3-alpha.1+1'
        $semver.Major | Should -Be 1
        $semver.Minor | Should -Be 2
        $semver.Patch | Should -Be 3
        $semver.Prerelease | Should -Be 'alpha.1'
        $semver.BuildMetadata | Should -Be '1'
    }
    It "Converts null to '0.0.0'." {
        $semver = $null | ConvertTo-SemVer
        $semver.Major | Should -Be 0
        $semver.Minor | Should -Be 0
        $semver.Patch | Should -Be 0
        $semver.Prerelease | Should -BeNullOrEmpty
        $semver.BuildMetadata | Should -BeNullOrEmpty
    }
    It "Converts '' to '0.0.0'." {
        $semver = '' | ConvertTo-SemVer
        $semver.Major | Should -Be 0
        $semver.Minor | Should -Be 0
        $semver.Patch | Should -Be 0
        $semver.Prerelease | Should -BeNullOrEmpty
        $semver.BuildMetadata | Should -BeNullOrEmpty
    }
}
