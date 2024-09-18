---
description: Step by step guide to use RealmJoin Portal in a new tenant
---

# Onboarding

## Self-onboard RealmJoin Portal

### App Permissions

First we start to connect the **RealmJoin Portal**

1. Visit [https://portal.realmjoin.com](https://portal.realmjoin.com) and sign in as Global Admin of your Entra ID Tenant

<figure><img src="../../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

2. The App will request basic permissions needed to interact with RealmJoin Portal. These permissions are required for any user interacting with RealmJoin Portal - e.g. to use self-services.

<figure><img src="../../.gitbook/assets/image (16).png" alt=""><figcaption></figcaption></figure>

3. Click 'Accept' and continue
4. After successful login it will try to interact with Entra ID for the first time and will ask you to Connect RealmJoin Portal to Entra ID

<figure><img src="../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

5. Click 'Connect Now'
6. Several Permission can be granted, start with the **RealmJoin Portal app** and click 'Activate'

<figure><img src="../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

7. Authenticate and grant the basic permission for the RealmJoin Portal app

<figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

8. A Feature page will now be shown where granular control over the permission is given.

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

9. Click on 'Grant all' to grant all required permissions for the RealmJoin Portal

<figure><img src="../../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

10. Copy the shown script via 'Copy to clipboard' to the clipboard and open a PowerShell 7 ([Download](https://github.com/PowerShell/PowerShell/releases)). Copy the clipboard text to the PowerShell and Run the script.\
    \
    **PowerShell 7 is needed as the Module 'Microsoft.Graph' used in the script works only flawlessly in PowerShell 7!**

<figure><img src="../../.gitbook/assets/image (21).png" alt=""><figcaption></figcaption></figure>

11. You will be asked for authentication with your Global Administrator account

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption></figcaption></figure>

12. If the tenant has never seen any 'Microsoft Graph Command Line Tools' you will see the following consent dialog which you need to 'Accept', otherwise this is skiped.

<figure><img src="../../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

13. After two successful Authentications you will see a simple message in the browser indicating successful authentication

<figure><img src="../../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

14. The script will run and show the following similar output:

<figure><img src="../../.gitbook/assets/image (25).png" alt=""><figcaption></figcaption></figure>

15. All permissions are now set, navigate to the Browser and click 'I have executed the script'

<figure><img src="../../.gitbook/assets/image (26).png" alt=""><figcaption></figcaption></figure>

16. A small dialog will show successful permission verification

<figure><img src="../../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>

👌 RealmJoin Portal is now successful connected!

## Additional Permissions

Depending on the feature set you are going to use there are several additional permissions which can be granted.

* **RealmJoin Client App**
* **Security Features**
* **Optional Permissions**



### RealmJoin Client App

Activating permissions for the RealmJoin Client app will unlock an array of features exclusive to the [RealmJoin Agent](../realmjoin-agent/realmjoin-client/).

Let's connect the **RealmJoin Client app** to get the RealmJoin Agent working.

1. On the Feature page click on RealmJoin Client app 'Activate'

<figure><img src="../../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>

2. Accept the Consent dialog and the RealmJoin Client app is ready

<figure><img src="../../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

3. The RealmJoin Client app will now show a button with 'Reactivate'. This indicates everything is ready.

<figure><img src="../../.gitbook/assets/image (30).png" alt=""><figcaption></figcaption></figure>



### Security Features

Now connect the optional **Security features** (an existing Microsoft Defender for Endpoint subscription is needed for this)

1. Click on Security features 'Activate'

<figure><img src="../../.gitbook/assets/image (31).png" alt=""><figcaption></figcaption></figure>

2. 'Accept' the Consent dialog and the Security features are ready

<figure><img src="../../.gitbook/assets/image (32).png" alt=""><figcaption></figcaption></figure>

3. The feature page should now list also the Security features with 'Reactivate' which also indicates everything is ready.

<figure><img src="../../.gitbook/assets/image (33).png" alt=""><figcaption></figcaption></figure>

4. You might not see all detailed permissions listed under **RealmJoin client app** and **Security features** as the tokens behind this are not yet issued. This is not an error and normal in the beginning.



### Optional Features

There are several optional permissions which can be granted individually. The same way as we have already done it for the RealmJoin Portal app. As an example here the step-by-step walkthrough for Intune LAPS. The procedure is identical for all other Optional permissions.

1. Click on the 'Grant' link next to the Optional Permission

<figure><img src="../../.gitbook/assets/image (34).png" alt=""><figcaption></figcaption></figure>

2. Copy the script to the clipboard by clicking 'Copy to clipboard'. As you can see highlighted in the picture below the script will only set the DeviceLocalCredential.Read.All permission.&#x20;

<figure><img src="../../.gitbook/assets/image (35).png" alt=""><figcaption></figcaption></figure>

3. Open the PowerShell again and copy the script into the terminal

<figure><img src="../../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

4. Authenticate with your Global Admin

<figure><img src="../../.gitbook/assets/image (37).png" alt=""><figcaption></figcaption></figure>

5. After two successful Authentications the script should be executed successful

<figure><img src="../../.gitbook/assets/image (38).png" alt=""><figcaption></figcaption></figure>

6. Click on 'I have executed the script' to complete the process

<figure><img src="../../.gitbook/assets/image (39).png" alt=""><figcaption></figcaption></figure>

7. The successful permission verification should be indicated with a small dialog

<figure><img src="../../.gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>

8. On the feature page you can see the optional Intune LAPS permission is now granted. Repeat this for all other optional permission to get full functionality of RealmJoin.

<figure><img src="../../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

### Permission Revocation

To Revoke a permission simply click on the 'Revoke' link next to the permission and execute the upcoming script again. Instead of granting permission the script template will now remove the permission. With this approach a granular control of the permissions for RealmJoin is given.



## Next steps

If you want to use [runbooks](../automation/runbooks/) to automate daily operations, please continue by connecting to [Azure Automation](../automation/connecting-azure-automation/).
