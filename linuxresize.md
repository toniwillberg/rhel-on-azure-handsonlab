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

ssh azureuser@40.68.192.xx
```

Now you should be inside the VM. Next steps are becoming root and checking the partition structure:
```
[azureuser@myLinuxVM ~]$ sudo su -
Last login: Mon Jun  3 11:04:37 UTC 2019 on pts/0

[root@myLinuxVM ~]# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
fd0      2:0    1    4K  0 disk
sda      8:0    0   30G  0 disk
├─sda1   8:1    0  500M  0 part /boot
└─sda2   8:2    0 31.5G  0 part /
sdb      8:16   0    7G  0 disk
└─sdb1   8:17   0    7G  0 part /mnt/resource
```

Our system partition in this example is **sda2** size 30GB and we want to grow it to the maximum capacity of the virtual disk.

Since this example is using partitions and not LVM, we need to resize the partition. With LVM system you'd simply grow the volume.

You can resize a partition on a running system by deleting the partition and re-creating it.

Note: before doing this on a *production system* please make sure you understand what is happening. A small mistake **will** make your disk disappear.

```
[root@myLinuxVM ~]# fdisk /dev/sda

The device presents a logical sector size that is smaller than
the physical sector size. Aligning to a physical sector (or optimal
I/O) size boundary is recommended, or performance may be impacted.
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): d
Partition number (1,2, default 2): 2                                              <make sure to use right number>
Partition 2 is deleted

Command (m for help): n
Partition type:
   p   primary (1 primary, 0 extended, 3 free)
   e   extended
Select (default p): p
Partition number (2-4, default 2): 2
First sector (1026048-104857599, default 1026048):                                <press enter here for default>
Using default value 1026048
Last sector, +sectors or +size{K,M,G} (1026048-104857599, default 104857599):     <press enter here for default>
Using default value 104857599
Partition 2 of type Linux and of size 49.5 GiB is set

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
Syncing disks.


[root@myLinuxVM ~]# partprobe
```

Fdisk is smart enough to automatically resize the partition to the maximum capacity. You could of course use specific value, such as 35GB.

At this point the partition has been resized, but the filesystem is still original size.

Grow filesystem
--

todo

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
