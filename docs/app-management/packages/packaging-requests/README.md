# Packaging Requests

RealmJoin offers a Packaging-as-a-Services (PACKaaS) if application packages are required, that are not already available in the RJ store, or are outdated. This section shall give a comprehensive overview over different scenarios. For more detailed information get in touch with your RealmJoin consultant/partner/support.&#x20;

## Request Types

Three different PACKaaS requests are currently available: new package, update existing package and [organic packages](organic-packages.md).&#x20;

### New Packages

If the application required is not already available in the RealmJoin store, it can be requested to be packaged via the RealmJoin packaging factory. A valid PACKaaS request must contain at least the following:&#x20;

* The binaries. A download URL is not sufficient, but might be provided for reference.&#x20;
* A documentation. All required configuration switches must be provided as command line parameters or registry keys or config files or similar. Screenshots are not sufficient. PACKaaS does not include Scripting-as-a-Service.&#x20;

If the application package does not contain any customer specific information, it will be added as generic package to the public RealmJoin store, and if possible as a maintained package. All other application packages will be created as custom/private packaging. For fees please refer to the subscribed RealmJoin license options.&#x20;

### Package Updates

If an application is required in a newer version than available in the RealmJoin store, the same processes and rules apply as for the _New Packages_ listed above. If the updated binary behaves exactly as the available version, command line parameters can be omitted in the request.

{% hint style="info" %}
Note: Additional switches, new parameters or configuration files for an existing package are considered updates and shall be requested the identical way.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/image (307).png" alt=""><figcaption><p>RealmJoin packaging request form</p></figcaption></figure>



{% hint style="info" %}
Tickets, Files and Setup

Please note that:

* all requests need a file attached to be created successfully. Requests without any file upload are not submitted.
* the request creates a ticket. All communication will be handled in this ticket, and it will only be sent to the account that created it. If this account does not have any active mailbox, the requester will not get any information.&#x20;
* the software requester role can be assigned to any user group in the tenant, therefore, an ADM account may not be required.&#x20;
* organic packages and PACKaaS might be not available right away, please get in touch with support@realmjoin.com if a feature is missing
{% endhint %}

Update and New package requests necessitate the provision of both binaries and documentation detailing the required command line parameters. If an update request does not entail changes from the previous version, the submission of new parameters is not required. All types of requests mandate a file upload, after which the generated ticket will be dispatched to the requesting account. Organic packages, offered at no cost, automatically extract the contents of the provided zip file to the C:\Install directory.

