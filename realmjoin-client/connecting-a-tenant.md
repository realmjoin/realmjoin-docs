# Connecting a Tenant

To connect RealmJoin Cliet's backend to an AzureAD tenant, a **Hello Token** is needed. This token can be requested from Glück & Kanja. A RealmJoin administrator group has to be created upfront in AAD with the name **cfg-RealmJoin Admin** and all dedicated RealmJoin administrators should be added to it. The **Connect Wizard** is located under the URL [RealmJoin connect](https://realmjoin-web.azurewebsites.net/global/graph). The token and the tenant name are to be entered and the request submitted.

{% hint style="info" %}
Sometimes if a new tab is used, the RealmJoin portal needs to log the admin user in first. This leads to the page reloading. In this case, open the link [RealmJoin connect](https://realmjoin-web.azurewebsites.net/global/graph) in the **same** browser tab again.
{% endhint %}

![](<../.gitbook/assets/image (18) (1) (1).png>)

A tenant administrator has to give consent to RealmJoin. The Connect Wizard creates the necessary entries in Intune. After completion, it is important to revisit the first tab/browser window and the **Check\&Install** option to be executed.

### RealmJoin Permissions

The following permissions are admitted by the administrator consent and set in Azure via the GraphAPI:

![](<../.gitbook/assets/image (7).png>)

### Default configuration for new tenants <a href="#default-configuration-for-new-tenants" id="default-configuration-for-new-tenants"></a>

After successful connection the following software packages are provided as default in RealmJoin portal:

* Choco Extension RealmJoin Core
* RealmJoin Core Extension
* Generic RealmJoin Win10 Core Settings System
* Generic RealmJoin Win10 Remove Suggested Apps
* Generic RealmJoin Win10 Remove Provisioned Apps
* Generic RealmJoin Win10 Update Start Layout
* Generic Google Chrome
* Generic Mozilla Firefox ESR
* Generic Microsoft Office ProPlus
* Generic Microsoft Teams
* Generic RealmJoin Publish State Computer System Information
