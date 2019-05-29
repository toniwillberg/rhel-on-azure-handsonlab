
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


Next section
===
[Concepts of VM images](azure-vmimages.md)