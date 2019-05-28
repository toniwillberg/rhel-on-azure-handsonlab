# azure-redhat

This is a Hands-On-Lab for *Red Hat Enterprise Linux on Azure*.

Lab goal
========
Attendees will learn basics of deploying and managing Linux on Azure:
* Azure basics
* Azure CLI basics
* Concept of VM images on Azure
* Creating Linux VMs and Linux VM extensions
* Azure Linux native services
* Azure Monitor with Linux


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


# Claiming Azure Passes

In case you don't have proper paid Azure subscription, you will be provided *Azure Passes* by the lab instructor.

To claim Azure Pass
-------------------
In order to use Azure Passes, you are required to have a personal *Microsoft Account*, you *can't* use the passes with your *company account*. If you don't have a Microsoft Account you should create one now with e.g. your Hotmail or Gmail email address etc.

1. Log *out* from all Microsoft services with your browser. To do this you can go for example to: https://account.microsoft.com/account and log out.
2. Use your *private* Microsoft account on this page to claim the Azure Pass and to create a *new* Azure subscription: https://www.microsoftazurepass.com/
3. Login to https://portal.azure.com with the same private account and go to *Subcsriptions*, you will see the Azure Pass subscription. Available credits will show *zero*, this is expected and normal.
4. Ready to go!

When you have Azure Subscription
--------------------------------

Only proceed when you are sure the subscription works.






Azure basics
===========================

Azure Resource Manager overview:

![Azure scopes](https://docs.microsoft.com/en-us/azure/azure-resource-manager/media/resource-group-overview/scope-levels.png)

https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview



Azure CLI basics
===========================

You can use Azure CLI on your laptop running any OS or via Azure Cloud Shell.

Install Azure CLI on your laptop
--------------------------------

See detailed instructions from here:
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

![WSL](/images/wsl1.jpg)
Use Azure CLI on Cloud Shell
----------------------------

![Cloud Shell](/images/cloudshell1.jpg)

Usage
-----
```
$az login
```
A browser window is opened and you are prompted to login to your *private Microsoft Account* which contains the correct subscription for this lab.

```
$az account list -o table
 Name                                  CloudName    SubscriptionId                        State    IsDefault
 ------------------------------------  -----------  ------------------------------------  -------  -----------
 Toni MSFT Internal 1                  AzureCloud   59b082db-abf2-4a89-zzzz-xxxxxxxxxxxx  Enabled  True
 Toni MSFT Internal 2                  AzureCloud   dd008aee-f251-4f34-zzzz-yyyyyyyyyyyy  Enabled  False

$ az account set -s 59b082db-abf2-4a89-9703-xxxxxxxxxxx
```

At this point your Azure CLI is fully functional.



Concept of VM images on Azure
=============================

VM images are either published by Microsoft, partners or uploaded by yourself.

Creating Linux VMs and Linux VM extensions
==========================================

Red Hat Enterprise Linux updates
================================

RHUI is used for marketplace images...



Azure Linux native services
===========================

Azure Monitor with Linux
========================


Relevant documentation
----------------------
* https://docs.microsoft.com/en-us/azure/azure-monitor/platform/data-sources-syslog
* https://docs.microsoft.com/en-us/azure/azure-monitor/platform/data-sources-linux-applications

