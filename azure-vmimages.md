Concept of VM images on Azure
=============================

VM images are published by Microsoft and it's partners. You can also upload your own images for your own use. In this lab we will focus on using the official images already available in Azure.


**Let the instructor know at this point if you have any problems with these commands!**

You should now run these commands on your Azure CLI shell. 


Image Publishers
-----------------
There are various companies publishing VM images into Azure Marketplace.

To list latest images from all publishers:

```
$ az vm image list -o table
You are viewing an offline list of images, use --all to retrieve an up-to-date list
Offer          Publisher               Sku                 Urn                                                             UrnAlias             Version
-------------  ----------------------  ------------------  --------------------------------------------------------------  -------------------  ---------
CentOS         OpenLogic               7.5                 OpenLogic:CentOS:7.5:latest                                     CentOS               latest
CoreOS         CoreOS                  Stable              CoreOS:CoreOS:Stable:latest                                     CoreOS               latest
Debian         credativ                9                   credativ:Debian:9:latest                                        Debian               latest
openSUSE-Leap  SUSE                    42.3                SUSE:openSUSE-Leap:42.3:latest                                  openSUSE-Leap        latest
RHEL           RedHat                  7-RAW               RedHat:RHEL:7-RAW:latest                                        RHEL                 latest
SLES           SUSE                    15                  SUSE:SLES:15:latest                                             SLES                 latest
UbuntuServer   Canonical               18.04-LTS           Canonical:UbuntuServer:18.04-LTS:latest                         UbuntuLTS            latest
WindowsServer  MicrosoftWindowsServer  2019-Datacenter     MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest     Win2019Datacenter    latest
WindowsServer  MicrosoftWindowsServer  2016-Datacenter     MicrosoftWindowsServer:WindowsServer:2016-Datacenter:latest     Win2016Datacenter    latest
WindowsServer  MicrosoftWindowsServer  2012-R2-Datacenter  MicrosoftWindowsServer:WindowsServer:2012-R2-Datacenter:latest  Win2012R2Datacenter  latest
WindowsServer  MicrosoftWindowsServer  2012-Datacenter     MicrosoftWindowsServer:WindowsServer:2012-Datacenter:latest     Win2012Datacenter    latest
WindowsServer  MicrosoftWindowsServer  2008-R2-SP1         MicrosoftWindowsServer:WindowsServer:2008-R2-SP1:latest         Win2008R2SP1         latest
```

List available Red Hat images on Azure Marketplace
--------------------------------------------------

Red Hat has published big number of RHEL images on Azure. Listing them takes about 30 seconds:

```
$ az vm image list --publisher RedHat --all -o table
Offer                 Publisher    Sku         Urn                                       Version
--------------------  -----------  ----------  ----------------------------------------  ---------------
RHEL                  RedHat       7.3         RedHat:RHEL:7.3:7.3.2017042521            7.3.2017042521
RHEL                  RedHat       7.3         RedHat:RHEL:7.3:7.3.2017051117            7.3.2017051117
RHEL                  RedHat       7.3         RedHat:RHEL:7.3:7.3.2017052619            7.3.2017052619
RHEL                  RedHat       7.3         RedHat:RHEL:7.3:7.3.2017053019            7.3.2017053019
RHEL                  RedHat       7.3         RedHat:RHEL:7.3:7.3.2017062722            7.3.2017062722
...
```

Running the previous command shows there are multiple "Offers" by the same *Publisher*. These offers are typically used to map different images to publisher's products. 

Some offerings are available only in specific Azure locations. To find out which Red Hat products are availailable in Western Europe datacenter run this:
```

$ az vm image list-offers -p redhat -l westeurope -o table
Location    Name
----------  --------------------
westeurope  RHEL
westeurope  rhel-byos
westeurope  RHEL-HA
westeurope  RHEL-SAP
westeurope  RHEL-SAP-APPS
westeurope  RHEL-SAP-HANA
```
You may or may not see additional testing and other offers depending on your subscription type. Those are not meant for normal use.

Red Hat offers mapped to use cases:

* RHEL --> PAYG/Pay-As-You-Go - normal RHEL VM
* rhel-byos --> BYOS/Bring-Your-Own-Subscription - normal RHEL VM
* RHEL-HA --> High Availability packages included
* RHEL-SAP --> certified for SAP applications
* RHEL-SAP-HANA --> certified for SAP Hana

If you would be moving existing RHEL VM's with paid Red Hat Subscriptions from on-prem to Azure, you would need to use the BYOS version. In this lab we will use the normal PAYG RHEL images.

To show details of a specific image:
```

$ az vm image show -l westeurope --urn RedHat:RHEL:7.6:latest
{
  "automaticOsUpgradeProperties": {
    "automaticOsUpgradeSupported": false
  },
  "dataDiskImages": [],
  "id": "/Subscriptions/59b082db-abf2-4a89-9703-5fe6e6adc608/Providers/Microsoft.Compute/Locations/westeurope/Publishers/RedHat/ArtifactTypes/VMImage/Offers/RHEL/Skus/7.6/Versions/7.6.2019052206",
  "location": "westeurope",
  "name": "7.6.2019052206",
  "osDiskImage": {
    "operatingSystem": "Linux",
    "sizeInGb": 32
  },
  "plan": null,
  "tags": null
}
```

The *id* field shows how the images are organized on Azure. Not very useful but still interesting information. :)

In the next session you will use this image to create a VM. --> [Creating Linux VMs and Linux VM extensions](linuxvm.md)
