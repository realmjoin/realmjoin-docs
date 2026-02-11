#Requires -Modules Microsoft.Graph.Identity.SignIns,Microsoft.Graph.Authentication

param(
    $permissionsTemplate = ".\WorkplaceTerraform\WorkspaceTFPermission.json",
    # Default: Azure CLI
    $entAppAppId = "04b07795-8ddb-461a-bbee-02f9e1bf7b46"
)

# Module and Sign in
import-module Microsoft.Graph.Identity.SignIns
Connect-MgGraph -Scopes "DelegatedPermissionGrant.ReadWrite.All,Application.ReadWrite.All" 

# Read from file
$permissions = Get-Content -Path $permissionsTemplate | ConvertFrom-Json

# Get the Service Principal and all grants
$spn = Get-MgServicePrincipal -Filter "AppId eq '$entAppAppId'"
$grants = Get-MgServicePrincipalOauth2PermissionGrant -ServicePrincipalId $spn.Id

# Loop through all permissions from the file and create/update grants
foreach ($permission in $permissions) {
    $grant = $null
    $resourceSpn = Get-MgServicePrincipal -Filter "AppId eq '$($permission.Id)'" 
    if ($resourceSpn) {
        $grant = $grants | Where-Object { ($resourceSpn.id -eq $_.ResourceId) -and ($_.ConsentType -eq "AllPrincipals") }
    }
    else {
        $resourceSpn = New-MgServicePrincipal -AppId $permission.Id
    }
    $scopeString = ""; foreach ($scope in $permission.Oauth2PermissionGrant) { $scopeString += "$scope " }

    if ($grant) {
        $body = @{
            ResourceId = $resourceSpn.Id
            Scope      = $scopeString
        }
        Invoke-MgGraphRequest -Method PATCH -Uri "https://graph.microsoft.com/v1.0/oauth2PermissionGrants/$($grant.Id)" -Body $body
    }
    else {
        $body = @{
            ClientId    = $spn.Id
            ConsentType = "AllPrincipals"
            ResourceId  = $resourceSpn.Id
            Scope       = $scopeString
        }
        Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/v1.0/oauth2PermissionGrants" -Body $body
    }
}