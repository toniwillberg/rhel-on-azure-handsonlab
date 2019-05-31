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
  "myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4bXXXXX",
  "Standard_DS1_v2"
]```

Output 32 is the OS disk size gigabytes and "Standard_DS1_v2" is the VM type/size. The disk name is unique and will differ from this example.

To modify the VM disk size the VM needs to be deallocated. In Azure deallocation stops also the billing for the VM, just stopping the VM - from OS or from Azure size - doesn't stop billing. Please note that the storage costs for deallocated VMs are naturally still charged.

```
 az vm deallocate  -g LinuxResourceGroup -n myLinuxVM
```

Increase disk size
--
```

 az disk update -g LinuxResourceGroup -n myLinuxVM_OsDisk_1_ee1ebe3806ef4a5bac5b18e8c4b5dbe9 --size-gb 40
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
