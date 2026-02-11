# Allow assigning AzureAD Roles to a user, group or service principal - without using the AzureAD module
# Input should be readble (roles names in JSON), parsed from a file

#Requires -modules Microsoft.Graph.Authentication,Microsoft.Graph.Identity.DirectoryManagement

param(
    # Please give the managed identities AzureAD object id. 
    [Parameter(Mandatory = $true)]
    [string] $objectId,
    [string] $rolesTemplate = "RealmJoinVnext\RjvNextRoles.json",
    [switch] $disconnectAfterExecution = $false,
    [switch] $showErrors = $false
)

## Authenticate as admin (delegated). Use MS Graph PowerShell SDK to leverage existing (well known) clientId/app.
## Will sign you in using your browser and ask for granting permissions if needed.
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory"

## Read the roles template
$targetRoles = Get-Content -Path $rolesTemplate | ConvertFrom-Json
$allRoles = Get-MgDirectoryRole
$allRoleTemplates = Get-MgDirectoryRoleTemplate

## Check if all roles already exist. Create them if needed.
$targetRoles | ForEach-Object {
    $roleDisplayName = $_
    $adminRole = $allRoles | Where-Object { $_.DisplayName -eq $roleDisplayName }
    if (-not $adminRole) {
        "## Role '$roleDisplayName' not found (yet). Activating role from template..." 
        # Find Role Template...
        $roleTemplate = $allRoleTemplates | Where-Object { $_.DisplayName -eq $roleDisplayName }
        if (-not $roleTemplate) {
            throw "RoleTemplate '$roleDisplayName not found!"
        }
        $adminRole = New-MgDirectoryRole -RoleTemplateId $roleTemplate.Id
    }
    else {
        $adminRole = $allRoles | Where-Object { $_.DisplayName -eq $roleDisplayName }
        "## Role '$roleDisplayName' found. ID: $($adminRole.Id)"
    }

    # Add principal to role
    if ($adminRole) {
        "## Adding member '$objectId' to '$roleDisplayName'"
        try {
            New-MgDirectoryRoleMemberByRef -DirectoryRoleId ($adminRole.Id) -OdataId "https://graph.microsoft.com/v1.0/directoryObjects/$objectId" -ErrorAction Stop
        }
        catch {
            "## - Role already assigned or assignment failed. Skipping..."
            if ($showErrors) {
                $_
            }
        }
    }
    else {
        throw "## AdminRole '$roleDisplayName' not found!"
    }
}

if ($disconnectAfterExecution) {
    Disconnect-MgGraph | Out-Null
}