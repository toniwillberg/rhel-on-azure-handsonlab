About this lab
========
This is a Hands-On-Lab for *Red Hat Enterprise Linux on Azure*.

Attendees will learn basics of Azure and gain essential skills on deploying and managing Linux on Azure.

This lab will also cover more advanced topics such as monitoring and update management, as well as debugging Linux boot problems.

All practical examples in this documentation are implemented using Red Hat Enterprise Linux, but can be adapted to other distributions with small changes.

Target audience
===============
* Linux sysadmins
* Infrastructure architects

Attendee pre-requisites
=======================
* Basic understanding of Linux administration via command line
* No previous Azure experience required
* Bring your own laptop

Notes for instructors
============
* Azure Passes or existing Azure subscriptions required for attendees
* Estimated proctor-to-attendee ratio 1:10


----

Azure Subscription instructions
===
In case you don't have proper paid Azure subscription, you will be provided *Azure Passes* by the lab instructor.

* [Azure Passes activation](azurepass.md)

----

Hands-on labs start here
====

Are you sure your Azure subscription works? If unsure, ask from the instructor!


Mandatory labs
--
These steps have to be done in order of appearance. The option labs depend on these.


* [Azure basics](azure-basics.md)
* [Azure CLI basics](azure-cli-basics.md)
* [Concept of VM images on Azure](azure-vmimages.md)
* [Creating Linux VMs](linuxvm.md)

At the end of these steps you will have these resources created:
* Resource group *"LinuxResourceGroup"* located in *"westeurope"* 
* One Red Hat Enterprise Linux VM named *"myLinuxVM"* with admin username *"azureuser"* and password *"abcdef12345!"*

Optional labs
----
Pick one or more of these in any order. These labs don't depend on each other, but they do depend from the earlier mandatory steps.

* [Resizing Linux VMs and its Disks on Azure](linuxresize.md)
* [Red Hat Update Infrastructure on Azure](azure-rhui.md)
* [Linux Update Management on Azure](linuxupdate.md)
* [Understanding `WALinuxAgent`](understanding-wala.md)
* [Azure Backup](azure-backup.md)
* [Azure Monitor with Linux](azure-monitor.md)
* [Advanced debugging](azure-vm-debugging.md)

Mandatory cleanup
--
If you do not plan to continue to use the resources created in these labs, please clean up by deleting the resources created.



* [Deleting resource groups](cleanup.md)

By cleaning up you also save our money and help us organize these trainings in the future as well. Thank you!

----

Credits
=======

This document has been created by:

* [Toni Willberg](https://github.com/toniwillberg) - Microsoft
* Laura Nicolas - Microsoft
* [James Read](https://github.com/jamesread/) - Red Hat

