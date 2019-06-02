Resizing Linux VM on Azure
==

Sometimes you run out of CPU power or disk space on your VM. Azure allows you to scale the VMs up and down quite easily, but there are some tasks in the Linux OS to be done to ensure the VM survives the changes.

Find out the current OS disk size
--

At this point the VM must be running. If it's now, start it.

```
az vm show -g LinuxResourceGroup  -n myLinuxVM  --query "[storageProfile.osDisk.diskSizeGb, storageProfile.osDisk.name, hardwareProfile.vmSize]"
[
  null,
  "myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4b5dbe9",
  "Standard_DS1_v2"
]
```

Output 32 is the OS disk size gigabytes and "Standard_DS1_v2" is the VM type/size. The disk name is unique and your's will differ from this example.

Disk size is only shown if the VM is started.

To show the disk information regardless of the VM status you need to use the *az disk show* command. Use the disk name you got from the previous command!

```
az disk show -g LinuxResourceGroup -n myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4b5dbe9 -o table
Name                                                 ResourceGroup           Location     Zones    Sku          OsType    SizeGb    ProvisioningState
---------------------------------------------------  ---------------         ----------   -------  -----------  --------  --------  -------------------
myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4b5dbe9  LinuxResourceGroup      westeurope            Premium_LRS    Linux     50        Succeeded
```

To modify the VM disk size the VM needs to be stopped and deallocated. 

In Azure deallocation stops also the billing for the VM, just stopping the VM - from OS or from Azure size - doesn't stop billing. Please note that the storage costs for deallocated VMs are naturally still charged.

```
 az vm deallocate  -g LinuxResourceGroup -n myLinuxVM
```

Increase disk size
--
First we will grow the disk on Azure and start it again:
```

az disk update -g LinuxResourceGroup -n myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4b5dbe9 --size-gb 40
 
az disk show -g LinuxResourceGroup -n myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4b5dbe9 --query "diskSizeGb"
40

az vm start -g LinuxResourceGroup -n myLinuxVM
```

Next step is to login to the Linux VM and grow the filesystem size. 

You probably forgot the IP already, so lets start with that. If you are using Azure Cloud Shell you will use the private IP, otherwise use the public IP.

```
az vm list-ip-addresses -g LinuxResourceGroup -n myLinuxVM -o table
VirtualMachine    PublicIPAddresses    PrivateIPAddresses
----------------  -------------------  --------------------
myLinuxVM         40.68.192.XX         10.0.1.XX

ssh 40.68.192.xx
```



Scale up
---
```
az vm resize --resource-group LinuxResourceGroup --name myLinuxVM --size Standard_DS3_v2

```

This will change the VM size, including number of vCPUs, cores and maximum disk size. Your VM will restart and the temporary disks will be emptied.



Scale down
---



Official documentation
--
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/change-vm-size

What's next?
===

Once this lab is completed, go back to [the agenda](README.md).
