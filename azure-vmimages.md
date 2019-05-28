Concept of VM images on Azure
=============================

VM images are either published by Microsoft, partners or uploaded by yourself.

List available Red Hat images on Azure Marketplace
--------------------------------------------------
```
$ az vm image list --publisher RedHat --all -o table
```

Available offers
----------------
* RHEL
* rhel-byos
* RHEL-HA
* RHEL-SAP
* RHEL-SAP-HANA
