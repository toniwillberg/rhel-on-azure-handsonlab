
[Azure Backup](azure-backup.md)
===========================

Please note, this lab takes more than 30 minutes to complete!

---

Azure Backup: 
--------------
Azure Backup is a service that backs up data from on-premises machines, and Azure VMs. For restore you are able to recover at a granular level including: files, folders, machine system state, and app-aware data backup.

To create a Backup of a Linux or Windows VM you first need to create a "Recovery Service Vault": 

```
$ az backup vault create --resource-group LinuxResourceGroup \
    --name LinuxVault \
    --location westeurope
```

Now that we have a vault to keep our backups we can enable Azure backup for our VM "myLinuxVM" to do that:

```
$ az backup protection enable-for-vm \
    --resource-group LinuxResourceGroup \
    --vault-name LinuxVault \
    --vm myLinuxVM \
    --policy-name DefaultPolicy
```

This creates a default policy backup policy for your VM, you can always configure a custom one. To run a backup on-demand now, run the following command: 

```
$ az backup protection backup-now \
    --resource-group LinuxResourceGroup \
    --vault-name LinuxVault \
    --container-name myLinuxVM \
    --item-name myLinuxVM \
    --retain-until 06-06-2020
```
When Azure initiates a backup, the backup extension on the VM takes a point-in-time snapshot. The backup extension is installed on the VM when the first backup is requested. After you trigger the backup you can verify its status by running: 

```
$ az backup job list \
    --resource-group LinuxResourceGroup \
    --vault-name LinuxVault \
    --output table
```

It takes time for the backup to complete. Once finished you can check the recovery points by running, make note of the recovery point you will need it in future steps:

```
$ az backup recoverypoint list \
    --resource-group LinuxResourceGroup \
    --vault-name LinuxVault \
    --container-name myLinuxVM \
    --item-name myLinuxVM \
    --query [0].name \
    --output tsv
```

Azure Site Recovery: 
-------------------
Azure Site recovery provides a DR solution for on-premises machines to Azure and for Azure VMs across regions. You replicate machines from a primary location which can be on Azure or your Data Center to a secondary location. When something happens you manually fail machines over to the secondary location and after everything is recovered you can fail back to the primary site.

Both the Azure Backup and Azure Site Recovery services contribute to a business continuity and disaster recovery (BCDR) strategy in your business. 

What's next?
===============

Once this lab is completed, go back to [the agenda](README.md).
