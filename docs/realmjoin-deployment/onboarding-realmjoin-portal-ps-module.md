# Onboarding RealmJoin with PowerShell Module

This guide explains how to onboard your tenant to RealmJoin using the PowerShell module. The module automates the configuration of Microsoft Entra ID service principals, Microsoft Graph permissions, and RealmJoin features for your organization.

## Prerequisites

Before you begin, ensure you have:

- **PowerShell 5.1** or later (PowerShell 7+ recommended)
- **Microsoft Graph permissions**: `Organization.Read.All`, `Application.ReadWrite.All`, `AppRoleAssignment.ReadWrite.All`
- **Administrator access** to your Microsoft 365 tenant

## Installation

### 1. Install the Module

```powershell
Install-Module -Name RealmJoin -Force
Get-Module -Name RealmJoin -ListAvailable
```


### 2. (Optional) Import the Module

After installation, the module is automatically imported in most PowerShell environments. If you need to import it manually, use:

```powershell
Import-Module RealmJoin
```

The module will automatically install required Microsoft Graph modules if needed.

## Onboarding Steps

### Quick Setup (Recommended)

To configure your tenant with the recommended default features, run:

```powershell
New-RJTenant 6>&1
```

This command will:
- Connect to Microsoft Graph
- Create Microsoft Entra ID service principals for RealmJoin applications
- Assign required Microsoft Graph permissions
- Configure default RealmJoin features (Portal, LAPS, Autopilot, Device Actions, Health Scripts)
- Clean up any legacy applications from previous configurations. This doesn't apply for the new tenants.

### Interactive Setup

For a guided, menu-driven experience:

```powershell
Show-RJInteractiveSetup 6>&1
```

This wizard allows you to select features, choose permission modes, and preview changes before applying them.

### Custom Configuration

You can customize the onboarding process as needed:

```powershell
# Minimal setup (only mandatory features)
New-RJTenant -Features @() 6>&1

# Full feature set
New-RJTenant -All 6>&1

# Read-only permissions
New-RJTenant -ReadOnly 6>&1

# Custom feature selection
New-RJTenant -Features @('RealmJoinPortal', 'IntuneLAPS', 'Autopilot') 6>&1
```

## Authentication

When you run a setup command, the module will prompt you to authenticate with Microsoft Graph. Sign in with an account that has the required permissions.

## Updating Configuration

To modify an existing RealmJoin configuration:

```powershell
# Add new features
Update-RJTenant -AddFeatures @('SecurityFeatures') 6>&1

# Remove features
Update-RJTenant -RemoveFeatures @('ShowSignin') 6>&1

# Switch to read-only permissions
Update-RJTenant -ReadOnly 6>&1

# Preview changes
Update-RJTenant -AddFeatures @('SecurityFeatures') -WhatIf 6>&1
```

## Troubleshooting

**Module not found**
```powershell
Install-Module -Name RealmJoin -Force 6>&1
```

**Insufficient permissions**
- Ensure your account has the required Graph permissions: `Organization.Read.All`, `Application.ReadWrite.All`, `AppRoleAssignment.ReadWrite.All`


## Getting Help

```powershell
Get-Help New-RJTenant -Full
Get-Help Update-RJTenant -Examples
Get-Help Show-RJInteractiveSetup -Detailed
```