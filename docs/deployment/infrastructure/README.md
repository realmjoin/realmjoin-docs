---
type: Deployment Guide
description: >-
  RealmJoin infrastructure and network requirements: connection endpoints,
  Azure Front Door, proxy guidance, and BranchCache-based peer-to-peer content
  delivery.
---

# Infrastructure Considerations

## Network

RealmJoin is a cloud-native service and is designed for **direct, unrestricted outbound internet access**. This is the supported configuration. If your security policy requires outbound filtering, follow the rules below — they contain everything needed to configure a firewall for RealmJoin:

* **Direction**: Outbound only. All connections are initiated by the client; no inbound rules are required.
* **Protocol**: HTTPS (TCP 443) exclusively.
* **Filtering**: By **hostname (FQDN)** only — see the endpoint list below. **IP-based filtering is not supported.**

### RealmJoin Connection Endpoints

Allow outbound HTTPS (TCP 443) to the following hosts in your firewall and proxy configuration:

| Host                                | Purpose                                          |
| ----------------------------------- | ------------------------------------------------ |
| `client-api.realmjoin.com`          | RealmJoin client backend API                     |
| `client-api-staging.realmjoin.com`  | RealmJoin client backend API (staging)           |
| `cdn.realmjoin.com`                 | Software package content delivery                |
| `nuget.realmjoin.com`               | RealmJoin package feed (NuGet)                   |
| `gkrealmjoin.s3.amazonaws.com`      | RealmJoin client download                        |
| `realmjoinstaticcdn.azureedge.net`  | RealmJoin Notifier                               |
| `login.microsoftonline.com`         | Microsoft Entra ID authentication                |
| `graph.microsoft.com`               | Microsoft Graph API                              |
| `enterpriseregistration.windows.net`| Microsoft Entra device registration              |
| `x1.c.lencr.org`                    | Certificate validation (Let's Encrypt)           |

{% hint style="warning" %}
Always allow these endpoints **by hostname (FQDN), never by IP address**. RealmJoin services are published via Azure Front Door, which has no fixed IP ranges — see [Azure Front Door](#azure-front-door) below. **We cannot provide IP addresses or IP ranges for RealmJoin, and IP-based filtering is not supported.**
{% endhint %}

### Azure Front Door

RealmJoin services — including the package CDN — are delivered through [Azure Front Door](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview), Microsoft's global edge and CDN platform. This has direct consequences for network filtering:

* **There are no fixed IP ranges.** Azure Front Door uses a Microsoft-managed, global anycast IP pool. Microsoft can add, remove, or reassign these IP addresses at any time without notice. For this reason, no IP list for RealmJoin exists or can be provided — any such list would be immediately outdated.
* **IP-based allowlisting is not supported** and will break without warning when Microsoft changes the Front Door infrastructure. The same applies to DNS-level interception or rewriting of these hostnames.
* **FQDN-based filtering** of the hostnames listed above is the only supported way to restrict RealmJoin traffic.

### Avoid Proxies

* Initial deployment requires **direct internet access**.
* **No proxy** is ideal; a **transparent proxy** works fine (if truly transparent).
* If a proxy is unavoidable, the [RealmJoin connection endpoints](#realmjoin-connection-endpoints) must be directly accessible as a minimum requirement.

In addition, the Microsoft services RealmJoin depends on must be reachable. Microsoft publishes the corresponding address ranges:

* [Azure IP Ranges and Service Tags – Public Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=56519) — compute IP address ranges (including SQL ranges) used by the Microsoft Azure datacenters. A new file is uploaded every Wednesday (Pacific Time) with the planned IP address ranges, effective the following Monday (Pacific Time). Download the new file and apply the necessary changes on your site before Monday.
* [Office 365 URLs and IP address ranges](https://support.office.com/en-us/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2) — address ranges to include in your outbound allow lists so clients can successfully use Office 365.

{% hint style="info" %}
IP address filtering alone is not a complete solution due to dependencies on internet-based services such as Domain Name Services (DNS), Content Delivery Networks (CDNs), Certificate Revocation Lists and other third party or dynamic services. These dependencies include dependencies on other Microsoft services such as the Azure Content Delivery Network and will result in network traces or firewall logs indicating connections to IP addresses owned by third parties or Microsoft but not listed on this page. These unlisted IP addresses, whether from third party or Microsoft owned CDN and DNS services, are dynamically assigned and can change at any time.
{% endhint %}

### BranchCache and Device Isolation

BranchCache is a built-in Windows peering technology that **reduces WAN traffic** and **speeds up content delivery** by letting clients share downloaded content with each other instead of every device pulling the same content from the cloud.

{% hint style="info" %}
For RealmJoin, BranchCache is **enabled by default** on CDN and client side.
{% endhint %}

**Why BranchCache instead of Delivery Optimization?** Delivery Optimization does not support third-party package sources — it works only with Microsoft-controlled endpoints (Windows Update, Store, M365 Apps, Intune). BranchCache works for third-party content such as RealmJoin packages.

**Configuration:**

* **CDN side**: Enabled by default. On request, we can disable BranchCache entirely on the CDN side (per tenant), which makes the client-side configuration irrelevant.
* **Client side**: Enabled by default. Set `BranchCache.Mode = "Undefined"` (see [User and Group Settings](../../ugd-management/user-and-group-settings/)) to change this default. Note: on existing clients, the feature is not actively disabled once it has been activated before — run `Disable-BC` on the desired devices to disable it.

**Network requirements:**

* Clients must be able to **communicate directly with each other** — do not separate them into different VLANs or subnets, and do not block peer traffic via device isolation.
* RealmJoin uses **Distributed Cache Mode** only: every client maintains a local cache and retrieves cached data from peers.
* **Hosted Cache Mode** (dedicated Windows Server, configured via the "Configure Hosted Cache Servers" policy) is **not supported** by RealmJoin.

**How it works:**

1. When a client downloads a software package for the first time, the files are divided into chunks significantly smaller than the original content and cached on the device.
2. When another client in the same network requests the same package, it downloads only **content information** instead of the complete content from the server.
3. The client uses the content information for **peer discovery**: it sends a multicast query ("Does anyone have content ID XYZ?"), and any peer holding the requested segment responds directly via unicast.
4. The content is transferred from peers as chunks. If the requested software is available on several devices, the load is balanced between them.

For more details see Microsoft Learn: [BranchCache](https://learn.microsoft.com/en-us/windows-server/networking/branchcache/branchcache)
