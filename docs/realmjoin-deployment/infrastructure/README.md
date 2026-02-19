# Infrastructure Considerations

## Network

### Avoid Proxies

Initial deployment needs direct internet access. No proxy would be ideal, but a transparent proxy should work fine (if truly transparent). If a proxy is unavoidable as a minimum requirement the following services/addresses need to be directly accessible:

For a list of the corresponding IP ranges click the following link:

[Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=56519)

This file contains the compute IP address ranges (including SQL ranges) used by the Microsoft Azure Datacenters. A new xml file will be uploaded every Wednesday (Pacific Time) with the new planned IP address ranges. New IP address ranges will be effective on the following Monday (Pacific Time).\
Download the new xml file and perform the necessary changes on your site before Monday.

[Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2)

This article links a file that contains the compute IP address ranges that you should include in your outbound allow lists to ensure your computers can successfully use Office 365.

{% hint style="info" %}
IP addresses filtering alone is not a complete solution due to dependencies on internet-based services such as Domain Name Services (DNS), Content Delivery Networks (CDNs), Certificate Revocation Lists and other third party or dynamic services. These dependencies include dependencies on other Microsoft services such as the Azure Content Delivery Network and will result in network traces or firewall logs indicating connections to IP addresses owned by third parties or Microsoft but not listed on this page. These unlisted IP addresses, whether from third party or Microsoft owned CDN and DNS services, are dynamically assigned and can change at any time.
{% endhint %}

### BranchCache and Device isolation

BranchCache is a Windows technology designed to **reduce WAN traffic** and **speed up content delivery** inside corporate networks. It does this by allowing Windows clients to share downloaded data with each other, instead of every device pulling the same content repeatedly from the cloud.

{% hint style="info" %}
For RealmJoin, BranchCache is **enabled by default** on CDN and client side.
{% endhint %}

Why not use Delivery Optimization? This mechanism does not support third‑party package sources. It works only with Microsoft‑controlled endpoints (e.g.: Windows Update, Store, M365 Apps or Intune).

So within RealmJoin, we rely on BranchCache because it is a **built‑in Windows peering mechanism** that works for third‑party content:

* **CDN side**: It is enabled by default. If requested, we can disable BranchCache entirely on the CDN side (per tenant), which makes the client‑side configuration irrelevant.
* On the **client side**, the feature is enabled by default as well. By setting `BranchCache.Mode = "Undefined"` (see [User and Group Settings](../../ugd-management/user-and-group-settings/)), this default behaviour can be changed. However, for existing clients, the feature will not be actively disabled once it has been activated before. To disable, run `Disable-BC` on the desired devices.

For BranchCache to be effective, the clients need to be able to communicate directly with each other. So, they should not be separated by different VLANs, subnets or communication blocked via device isolation. We use BranchCache in **Distributed Cache Mode**, where every client maintains a local cache and retrieves cached data from peers. The option **Hosted Cache Mode**, which requires a dedicated Windows Server and is configured on clients via the "Configure Hosted Cache Servers" policy, is **not supported** by RealmJoin.

When a client device downloads software packages for the first time, the files are divided into chunks that are significantly smaller than the original content and cached on the device.  If the same package is afterwards requested from a different client device in the same network, it downloads content information instead of the complete content from the server. The content information is used to locate the desired content on other devices in the network. **Client peer discovery** in "Distributed Cache Mode" works as follows:

* A client sends a multicast query such as "Does anyone have content ID XYZ?"
* Any peer that holds the requested segment responds directly via uni-cast.

Instead of downloading packages from the server, the content in form of the chopped up chunks is transferred to the client device. If the requested software is available on several devices, the load is balanced between them.

For more details see Microsoft Learn: [BranchCache](https://learn.microsoft.com/en-us/windows-server/networking/branchcache/branchcache)

### RealmJoin Connection Endpoints

RealmJoin connects to the following hosts (using HTTPS) that might be considered in your firewall settings:

* `cdn.realmjoin.com`
* `x1.c.lencr.org`
* `client-api.realmjoin.com`
* `client-api-staging.realmjoin.com`
* `realmjoin-backend.azurewebsites.net`
* `realmjoin-backend-staging.azurewebsites.net`
* `nuget.realmjoin.com`
* `enterpriseregistration.windows.net`
* `gkrealmjoin.s3.amazonaws.com`
* `login.microsoftonline.com`
* `graph.microsoft.com`
* `realmjoinstaticcdn.azureedge.net` (Notifier)
