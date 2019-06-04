Using Red Hat Update Infrastructure with RHEL images
====================================================

When Red Hat Enterprise Linux is provisioned from the Azure marketplace using the *PAYG (Pay as you go)* image, it comes pre-connected to
Red Hat Update Infrastructure (RHUI) operated by Microsoft. The *BYOS (Bring your own subsrciption)* images can not be used with Azure RHUI.

The RHUI in Azure is only accessible by RHEL VMs running on Azure - you can not connect to it from 3rd party networks.

In typical end-customer use cases you usually have RHEL connected to Red Hat CDN (previously RHN) for updates. Many managed service providers use Red Hat Satellite to provide updates. RHUI is used typically by public cloud providers.

RHUI functionality
--

RHUI provides access to Red Hat updates, which can be in the form of;

* **RHSA (Red Hat Security Advisory):** RHSA advisories contain one or more security fixes, and can also contain bug or enhancements fixes. RHSA advisories outrank both RHBA and RHEA advisories in priority.
* **RHBA (Red Hat Bug Advisory):** RHBA advisories always contain one or more bug fixes, may contain enhancements, but do not contain security fixes. Because RHBA advisories are released for bug fixes, an RHBA outranks a RHEA advisory in priority.
* **RHEA (Red Hat Enhancement Advisory):** RHEA advisories contain one or more enhancements or new features, and they do not contain bug fixes or security fixes. Essentially, a RHEA is released when new features are added and an updated package is shipped.

For a more detailed description, see this document: https://access.redhat.com/articles/2130961

RHUI does not provide active management features you can find from Red Hat Satellite. However, you can use Azure Update Management service to manage your RHELs.

Hands-on
--

At this point you should login to your RHEL VM using ssh.
```
ssh azureuser@publicip
```

Azure's Red Hat Update Infrastructure is preconfigured by a configuration RPM already
installed on your RHEL image:
```
$ rpm -ql rhui-azure-rhel7
/etc/cron.daily/rhui-update-client
/etc/pki/rhui/key.pem
/etc/pki/rhui/product/content.crt
/etc/pki/rpm-gpg/RPM-GPG-KEY-microsoft-azure-release
/etc/yum.repos.d/rh-cloud.repo
```

To list all repositories configured you can use *yum repolist* as you would do on any hosting platform. With the *-v* option you can easily find out the RHUI servers used:
```
$ yum repolist -v
...
Repo-baseurl : https://rhui-1.microsoft.com/pulp/repos//content/dist/rhel/rhui/server/7/7Server/x86_64/rhscl/1/source/SRPMS,
             : https://rhui-2.microsoft.com/pulp/repos//content/dist/rhel/rhui/server/7/7Server/x86_64/rhscl/1/source/SRPMS,
             : https://rhui-3.microsoft.com/pulp/repos//content/dist/rhel/rhui/server/7/7Server/x86_64/rhscl/1/source/SRPMS...
```

Microsoft Azure has 3 RHUI servers with static names. IP addresses should be static, but each Azure location has it's own IP.

```
$ host rhui-1.microsoft.com
rhui-1.microsoft.com is an alias for rh-cds.trafficmanager.net.
rh-cds.trafficmanager.net is an alias for westeurope-cds.westeurope.cloudapp.azure.com.
westeurope-cds.westeurope.cloudapp.azure.com has address 52.174.163.213
```
Traffic to the RHUI servers is routed trough *Azure Traffic Manager* which provides load balancing and high-availability to the update services. If you plan to deploy firewalls on Azure, remember to allow traffic to RHUI from RHEL VMs!


To showcase installing a package lets go with *Emacs* because we don't know how to exit vi. :)
```
$ sudo yum install emacs

```




Official Microsoft documentation about RHUI on Azure
---
* https://docs.microsoft.com/en-us/azure/virtual-machines/linux/update-infrastructure-redhat

What's next?
===

Once this lab is completed, go back to [the agenda](README.md).
