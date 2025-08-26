# Implementing Privileged Identity Management (PIM) with RealmJoin Portal

### Overview

This guide walks you through implementing Microsoft Entra ID Privileged Identity Management (PIM) for Groups with RealmJoin Portal administrative access. PIM provides just-in-time administrative access, reducing security risks by requiring users to activate their privileged roles when needed.

By implementing PIM with RealmJoin, administrators must explicitly activate their admin privileges for a defined time period, creating an audit trail and reducing the attack surface of persistent administrative access.

### Prerequisites

* Microsoft Entra ID P2 licensing for users requiring PIM access
* Global Administrator or Privileged Role Administrator permissions
* Access to RealmJoin Portal configuration
* Understanding of Microsoft Entra ID Groups and role assignments

### Implementation Steps

#### Step 1: Create Role-Assignable Groups

Create two security groups in Microsoft Entra ID. While the "role-assignable" attribute is no longer a strict prerequisite, it remains recommended for optimal PIM functionality.

**Group 1: Eligibility Group**

* **Name**: `sec - PIM-Eligibility - RealmJoin Portal - Admins`
* **Purpose**: Contains users eligible for RealmJoin admin access
* **Type**: Security Group
* **Role-assignable**: Recommended (Yes)

**Group 2: Active Admin Group**

* **Name**: `sec - PIM-Enabled - RealmJoin Portal - Admins`
* **Purpose**: The target group that provides actual RealmJoin admin permissions
* **Type**: Security Group
* **Role-assignable**: Recommended (Yes)

#### Step 2: Configure PIM for Groups

**Enable PIM for Groups**

1. Navigate to **Microsoft Entra ID** > **Privileged Identity Management**
2. Select **Groups** from the left navigation pane
3. Choose **Discover groups** to identify groups eligible for PIM management
4. Select your newly created groups to bring them under PIM control

For detailed configuration steps, refer to the official Microsoft documentation:

* [Privileged Identity Management (PIM) for Groups Overview](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/concept-pim-for-groups)
* [Bring groups into Privileged Identity Management](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-discover-groups)

**Configure Group Settings**

1. Set activation duration (recommended: 1-8 hours)
2. Configure approval requirements if needed
3. Define activation requirements (MFA, business justification)
4. Set maximum activation duration policies

#### Step 3: Assign Eligibility

Configure user eligibility for the PIM-enabled group:

1. In PIM, navigate to **Groups** > **Assignments**
2. Select the `sec - PIM-Enabled - RealmJoin Portal - Admins` group
3. Choose **Add assignments**
4. Select **Eligible** assignment type
5. Choose users or the eligibility group (`sec - PIM-Eligibility - RealmJoin Portal - Admins`)
6. Set assignment duration and schedule as required

For comprehensive assignment guidance, see: [Assign eligibility for a group in Privileged Identity Management](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/groups-assign-member-owner)

### Configuration Logic

#### User Management Workflow

1. **Add Users to Eligibility Group**: Add user accounts to `sec - PIM-Eligibility - RealmJoin Portal - Admins`
   * This group serves as the source of users who can request admin access
   * Users in this group can activate membership in the PIM-enabled group
2. **Configure RealmJoin Portal**: Set `sec - PIM-Enabled - RealmJoin Portal - Admins` as the administrative group in RealmJoin Portal settings
   * Only active members of this group will have admin permissions
   * Users must activate their membership through PIM to gain access

#### Access Activation Process

When users need RealmJoin admin access:

1. User navigates to **My Access** portal or PIM interface
2. Requests activation of membership in `sec - PIM-Enabled - RealmJoin Portal - Admins`
3. Provides business justification (if required)
4. Completes MFA challenge (if configured)
5. Receives time-limited admin access to RealmJoin Portal
6. Access automatically expires after the defined duration

### Security Benefits

* **Just-in-Time Access**: Admin privileges are granted only when needed
* **Audit Trail**: All activation requests and approvals are logged
* **Reduced Attack Surface**: Fewer persistent admin accounts
* **Compliance**: Supports regulatory requirements for privileged access management
* **Controlled Duration**: Admin access automatically expires
* **Approval Workflows**: Optional approval processes for sensitive roles

### Best Practices

* **Regular Access Reviews**: Periodically review group memberships and PIM assignments
* **Appropriate Duration**: Set activation periods based on typical admin task duration
* **MFA Enforcement**: Always require multi-factor authentication for activation
* **Business Justification**: Require users to provide reasons for access requests
* **Monitoring**: Regularly review PIM audit logs for unusual activation patterns
* **Documentation**: Maintain clear procedures for emergency access scenarios

### Troubleshooting

#### Common Issues

* **Users cannot see activation option**: Verify PIM licensing and group assignments
* **Activation fails**: Check MFA setup and approval workflow configuration
* **RealmJoin access denied**: Confirm the correct group is configured in RealmJoin Portal settings

#### Verification Steps

1. Test the activation process with a pilot user
2. Verify RealmJoin Portal recognizes the PIM-enabled group
3. Confirm audit logging is working correctly
4. Test emergency access procedures

### Additional Resources

* [Microsoft Entra ID Governance Documentation](https://learn.microsoft.com/en-us/entra/id-governance/)
* [PIM Best Practices](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-deployment-plan)
* [RealmJoin Portal Documentation](https://docs.realmjoin.com/)
