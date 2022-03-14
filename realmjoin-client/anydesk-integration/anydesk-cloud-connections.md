# AnyDesk Cloud Connections

All connections are TCP and encrypted with:

* TLS 1.2
* RSA 2048bit
* AES256
* ECDH
* AEAD

The following graphic shows you a remote session from an **external support** to a user **Y**:

![](<../../.gitbook/assets/image (24) (1).png>)

| Step | Explanation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ---- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| C1   | Outbound connections to AnyDesk Cloud servers on ports 80, 443 or 6568                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| S0   | Optional for sessions - if available direct connection between clients on port 7070                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| S1   | A direct connection is tried to port 7070 towards public IP address of **user Y** known by AnyDesk Cloud (also hole punching is tried at the same time).                                                                                                                                                                                                                                                                                                                                                            |
| S2   | <p>If a direct connection (S1) cannot be established, a session over AnyDesk Cloud servers (S2) is established:</p><ul><li><strong>External support</strong> establishes new connection to the AnyDesk Cloud server where <strong>user Y</strong> is connected.</li><li><p>Data of session (S2) are then transferred:</p><ul><li><strong>External support</strong> over new connection to AnyDesk Cloud server</li><li><strong>User Y</strong> over existing connection to AnyDesk Cloud server</li></ul></li></ul> |
