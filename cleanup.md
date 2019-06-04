Deleting resource groups
==
If you do not plan to continue to use the resources created in these labs, please clean up by deleting the resource group we used. This will stop all costs regarding *this* resource group.

```
$ az group delete -n LinuxResourceGroup
Are you sure you want to perform this operation? (y/n): y
```

To list all resource groups you might have created use *az group list* command:

```
$ az group list -o table
Name                            Location     Status
------------------------------  -----------  ---------
cloud-shell-storage-westeurope  westeurope   Succeeded
rg-int-demo                     westeurope   Succeeded
```

Please delete other groups, if any, as well if you *do not* plan to continue using them later.

What's next?
===

Once this lab is completed, go back to [the agenda](README.md).

