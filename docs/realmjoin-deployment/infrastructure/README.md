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

### Avoid VLANs / WLAN and Port-Isolation

For **BranchCache** to be effective the clients need to be able to communicate directly with each other and therefore should not be separated by different VLANs, WLAN-Isolation or Port-Isolation. For mass rollouts, **BranchCache Servers** with pre-populated caches are recommended. BranchCache is limited to a single subnet, if a site has multiple subnets the BranchCache Servers must be placed in the same subnet as the clients to be effective.

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
