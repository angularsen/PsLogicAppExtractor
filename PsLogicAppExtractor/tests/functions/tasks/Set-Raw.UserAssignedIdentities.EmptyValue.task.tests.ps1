﻿Describe 'Testing Set-Raw.UserAssignedIdentities.EmptyValue' {

    BeforeAll {
        # Import-Module C:\GIT\GITHUB\PsLogicAppExtractor.Workspace\PsLogicAppExtractor\PsLogicAppExtractor -Force

        ."$PSScriptRoot\..\..\..\internal\classes\PsLogicAppExtractor.class.ps1"
        #."$PSScriptRoot\..\..\Set-TaskWorkDirectoryPester.ps1"
        
        $parms = @{}
        $parms.buildFile = "$PSScriptRoot\all.psakefile.ps1"
        $parms.nologo = $true
        
        Set-PSFConfig -FullName PsLogicAppExtractor.Execution.TaskCounter -Value 0

        $logicAppName = "LA-TEST-Exporter"
        $WorkPath = "$([System.IO.Path]::GetTempPath())PsLogicAppExtractor\$([System.Guid]::NewGuid().Guid)"
        New-Item -Path $WorkPath -ItemType Directory -Force -ErrorAction Ignore > $null

        Set-PSFConfig -FullName PsLogicAppExtractor.Execution.WorkPath -Value $WorkPath
        Set-PSFConfig -FullName PsLogicAppExtractor.Execution.TaskInputNext -Value "$PSScriptRoot\_Raw.LogicApp.UserAssignedIdentities.json"
        Set-PSFConfig -FullName PsLogicAppExtractor.Pester.FileName -Value "$logicAppName.json"
        
        Invoke-psake @parms -taskList "Set-Raw.UserAssignedIdentities.EmptyValue"

        $resPath = Get-ExtractOutput -Path $WorkPath
        $lgObj = [LogicApp]$(Get-Content -Path $resPath -Raw | ConvertFrom-Json)
    }

    It "Should create an output file" {
        $resPath | Should -Exist
    }

    It "Should be a valid LogicApp class" {
        "$($lgObj.GetType())" | Should -BeExactly "LogicApp"
    }

    It "Should have the correct Logic App name" {
        $lgObj.name | Should -BeExactly "LA-TEST-Exporter"
    }

    It "Should be of the type 'Microsoft.Logic/workflows'" {
        $lgObj.type | Should -BeExactly "Microsoft.Logic/workflows"
    }
    
    It "Should have an identity property" {
        $lgObj.identity | Should -Not -Be $null
    }

    It "Should be 'UserAssigned' in the identity.type property" {
        $lgObj.identity.type | Should -BeExactly "UserAssigned"
    }

    It "Should have an identity.userAssignedIdentities property" {
        $lgObj.identity.userAssignedIdentities | Should -Not -Be $null
    }

    It "Should have an identity.userAssignedIdentities.'subscriptions...' property" {
        $lgObj.identity.userAssignedIdentities.'subscriptions/b466443d-6eac-4513-a7f0-3579502929f00/resourceGroups/rgTest/providers/Microsoft.ManagedIdentity/userAssignedIdentities/Test-ManagedIdentity' | Should -Be $null
    }
    
    # AfterAll {
    #     Write-Host "$resPath"
    # }
}