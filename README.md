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

Lab requirements
============
* Azure Passes or existing Azure subscriptions for attendees
* Attendees must bring their own laptop
* Estimated proctor-to-attendee ratio 1:10


Azure Subscription instructions
======

In case you don't have proper paid Azure subscription, you will be provided *Azure Passes* by the lab instructor.

Azure Passes are temporary subscriptions provided to you to be used during this lab. They may be valid for some days or weeks after the lab and can be used to continue your learning journey.

In order to use Azure Passes, you are required to have a personal *Microsoft Account*, you *can't* use the passes with your *company account*. If you don't have a Microsoft Account you should create one now with e.g. your Hotmail or Gmail email address etc.

1. Log *out* from all Microsoft services with your browser. To do this you can go for example to: https://account.microsoft.com/account and log out.
2. Use your *private* Microsoft account on this page to claim the Azure Pass and to create a *new* Azure subscription: https://www.microsoftazurepass.com/
3. Login to https://portal.azure.com with the same private account and go to *Subcsriptions*, you will see the Azure Pass subscription. Available credits will show *zero*, this is expected and normal.
4. Ready to go!

Only proceed when you are sure your subscription works.
-------------

Labs
====

Mandatory labs for everybody
--
These steps have to be done in order of appearance


* [Azure basics](azure-basics.md)
* [Azure CLI basics](azure-cli-basics.md)
* [Concept of VM images on Azure](azure-vmimages.md)
* [Creating Linux VMs](linuxvm.md)

Optional labs
----
Pick one or more of these in any order. These labs don't depend on each other, but they do depend from the earlier mandatory steps.

* [Resizing Linux VMs](linuxresize.md)
* [Linux Update Management on Azure](linuxupdate.md)
* [Understanding Red Hat Update Infrastructure (RHUI)](understanding-rhui.md)
* [Understanding `WALinuxAgent`](understanding-wala.md)
* [Azure Linux native services](azure-linux-services.md)
* [Azure Monitor with Linux](azure-monitor.md)
* [Advanced debugging](azure-vm-debugging.md)

Summary
==

tbd


Credits
=======

This document has been created by:

* Toni Willberg - Microsoft
* Laura Nicolas - Microsoft
* [James Read](https://github.com/jamesread/) - Red Hat

