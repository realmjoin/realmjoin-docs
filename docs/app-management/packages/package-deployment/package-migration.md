---
description: Packages can be migrated to "Managed" if previously deployed as "Basic".
---

# Package Migration

Package migration is only available for RealmJoin packages

## Identifying Packages

Currently only RealmJoin packages can be migrated from Basic to Managed deployment. This can be identified from the Packages table:\


<figure><img src="../../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

## Migration

1. Select a Basic RealmJoin package
2. Under Group Assignments, select More -> Convert to managed app (This process happens immediately).&#x20;
   *   Old groups are nested into the new Managed RealmJoin Groups. Settings made to the Basic groups will be adopted by the Managed groups.\


       <figure><img src="../../../.gitbook/assets/image (20).png" alt=""><figcaption><p>Before Migration</p></figcaption></figure>

       <figure><img src="../../../.gitbook/assets/image (21).png" alt=""><figcaption><p>After Migration</p></figcaption></figure>
   *   Users are added to the most relevant group

       <figure><img src="../../../.gitbook/assets/image (18).png" alt=""><figcaption><p>Before Migration</p></figcaption></figure>

       <figure><img src="../../../.gitbook/assets/image (19).png" alt=""><figcaption><p>After Migration</p></figcaption></figure>
3. (Optional) Pull members from nested groups directly into the RealmJoin managed groups. This setting migrates users directly to the RealmJoin managed group and optionally removes the nested group from the Managed group.
   1. Select relevant group -> More -> "Pull members up".&#x20;
   2. Select the ![](<../../../.gitbook/assets/image (12).png>) on the desired nested group
   3. Choose "Remove Assignment" to remove the nested group or "Keep Assignment" to keep the nested group in the RealmJoin managed group
   4.  Click Execute to begin the operation\


       <figure><img src="../../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>
