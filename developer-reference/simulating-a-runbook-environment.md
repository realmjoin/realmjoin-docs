---
description: >-
  To develop new runbooks, you might need to enable RealmJoin.RunbookHelper  to
  authenticate as if you were running inside a Runbook.
---

# Simulating a Runbook environment

## Overview

### Create an Application Registration

We create an Azure Application Registration to simulate the application-style signin to AzureAD.&#x20;

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption><p>Create an App Registration</p></figcaption></figure>

### Grant Permissions

We will grant the same permissions as the managed identity would have. We will use the same [AppRoleGranter Toolkit](https://github.com/hcoberdalhoff/approle-and-directoryrole-granter) for this purpose.

Replace `{AppRegObjectId}` with the object ID of your application registration.

```powershell
git clone https://github.com/hcoberdalhoff/approle-and-directoryrole-granter.git
cd "approle-and-directoryrole-granter\RealmJoinVnext"
. .\AllInOne.ps1 -appRegObjectId "{AppRegObjectId}"
```

### Create and Upload a Dev-Certificate

See [here ](https://github.com/realmjoin/RealmJoin.RunbookHelper/blob/main/DevCertificates.ps1)for a sample on how to create a RunbookHelper Dev-Certificate. Replace `{Variables}` accordingly.&#x20;

The `{AppID}` refers to the Application Regsitrations App / Client ID.

If you don't have a specific subscription ID, just use a default subscription from your tenant. (It doesn't matter in most cases.)

```powershell
New-SelfSignedCertificate -Subject 'CN=AzureRunAsConnection, OU={AppID}, DC={TenantID}, O={SubscriptionID}' `
    -CertStoreLocation "cert:\CurrentUser\My" -NotAfter (Get-Date).AddYears(10) -KeySpec Signature | `
    Export-Certificate -FilePath "AzureRunAsConnection.cer"
```

You will get a file `AzureRunAsConnection.cer` that you upload to the Application Registration secrets.

<figure><img src="../.gitbook/assets/image (1).png" alt=""><figcaption><p>Certificate upload</p></figcaption></figure>

### Usage

Just use `Connect-RjRbGraph` to authenticate to the app.&#x20;

Make sure to remove older Dev-Certificates if present, to avoid conflicts/login failures.
