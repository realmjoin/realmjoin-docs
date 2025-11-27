---
description: Checking Azure Key Vault
---

# LAPS account passwords cannot be retrieved

If LAPS account passwords fail to be retrieved, it is most likely because they cannot be found in the Azure Key Vault.

If you are facing this issue, first of all check if your Key Vault is correctly configured for RJ LAPS, especially the permissions as documented here: [keyvault.md](../../../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/keyvault.md "mention")



As an indicator to see if the basic communication between RealmJoin and the KeyVault works, check the Certificates section of the Key Vault in the Azure Portal. Provided you have the right permissions on the KeyVault, you should see a certificate called `realmjoin-master` that has been created by RealmJoin:

<figure><img src="../../../.gitbook/assets/image (315).png" alt=""><figcaption><p>realmjoin-master Certificate</p></figcaption></figure>



If KeyVault permissions are fine, and you can see credentials being populated in the Keys section of the Azure KeyVault, this confirms that the connection between RealmJoin and the KeyVault is working.

However you may still face some devices where a password of a LAPS account may not be accessible. This may be case if the LAPS account on the device has been created when the KeyVault config had not been correctly set up and working. The password will only be written to the KeyVault once. So if at that point of time the KeyVault permission had not been correct or  the device faced networking issues the password may have never been saved to the KeyVault. The only way to fix this issue is to have the LAPS account(s) be recreated. You can use the package **Renew LAPS Accounts** from the RealmJoin store to delete any LAPS account(s) created on the device(s). Afterwards they will be recreated using the configuration provided within the tenant.





