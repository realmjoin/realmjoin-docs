# KeyVault

Cloud applications and services use cryptographic keys and secrets to help keep information secure. Azure Key Vault safeguards these keys and secrets. When you use Key Vault, you can encrypt authentication keys, storage account keys, data encryption keys, .pfx files, and passwords by using keys that are protected by hardware security modules.

## Create KeyVault

The following table shows you the steps for Azure KeyVault Creation:

| Task                                                                                                                                                                     | Image                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------- |
| 1. Open [Azure Portal](https://portal.azure.com)                                                                                                                         |                                                     |
| 2. Start with **Create a resource**                                                                                                                                      | ![](<../../.gitbook/assets/image (12) (1) (1).png>) |
| 3. Type in **Key Vault** in the search field                                                                                                                             | ![](<../../.gitbook/assets/image (16) (1) (2).png>) |
| 4. On the detail page click **Create**                                                                                                                                   |                                                     |
| <p>5. Fill out the required fields.<br><br>Please make sure to use a distinct naming scheme for the keyvault URL.<br><br>For example: <em>rj-[tenant]-[service]</em></p> | ![](<../../.gitbook/assets/image (8) (2).png>)      |
| 6. Click **Review + Create**                                                                                                                                             |                                                     |
| 7. Review your settings and configurations and click **Create**                                                                                                          |                                                     |
| 8. Wait for the successful deployment                                                                                                                                    |                                                     |
| 9. Click **Go to resource**                                                                                                                                              |                                                     |
| 10. Navigate to **Access policies**                                                                                                                                      | ![](<../../.gitbook/assets/image (19) (1).png>)     |
| 11. Click **Add Access Policies**                                                                                                                                        |                                                     |
| 12. Select **Key, Secret & Certificate Management** as template and add RealmJoin as **Select principal**                                                                | ![](<../../.gitbook/assets/image (10) (1) (2).png>) |
| 13. Click **Key permissions**                                                                                                                                            |                                                     |
| 14. For **Cryptographic Operations** add Decrypt, Encrypt, Unwrap Key, Wrap Key, Verify and Sign                                                                         | ![](<../../.gitbook/assets/image (17) (1) (1).png>) |
| 15. Click **Save** and then **OK**                                                                                                                                       |                                                     |
| 16. Finally, go to **Overview** and share the **DNS Name** with the [Glück & Kanja support](mailto:product.support@glueckkanja.com)                                      | ![](<../../.gitbook/assets/image (14) (1).png>)     |

## KeyVault Storage of Secrets

RealmJoin will not store the secret in any proprietary storage but instead create an **Azure KeyVault Secret** to store it in a secure and auditable way. The KeyVault API is documented here:

[https://docs.microsoft.com/en-us/rest/api/keyvault/secrets/set-secret/set-secret](https://docs.microsoft.com/en-us/rest/api/keyvault/secrets/set-secret/set-secret)

The entry in KeyVault will be added with the Azure device ID as a key and the plain GUID as the secret value. See the following example screenshot\*\*:\*\*

![](<../../.gitbook/assets/image (15) (1).png>)

![](<../../.gitbook/assets/image (20) (1) (2).png>)
