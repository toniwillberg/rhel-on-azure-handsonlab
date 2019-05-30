Using Red Hat Update Infrastructure with RHEL images
====================================================

When RHEL is provisioned from the Azure marketplace, it comes pre-connected to
Red Hat Update Infrastructure (RHUI). This provides access to Red Hat updates,
which can be in the form of;

* **RHSA (Red Hat Security Advisory):** RHSA advisories contain one or more security fixes, and can also contain bug or enhancements fixes. RHSA advisories outrank both RHBA and RHEA advisories in priority.
* **RHBA (Red Hat Bug Advisory):** RHBA advisories always contain one or more bug fixes, may contain enhancements, but do not contain security fixes. Because RHBA advisories are released for bug fixes, an RHBA outranks a RHEA advisory in priority.
* **RHEA (Red Hat Enhancement Advisory):** RHEA advisories contain one or more enhancements or new features, and they do not contain bug fixes or security fixes. Essentially, a RHEA is released when new features are added and an updated package is shipped.

For a more detailed description, there is a [https://access.redhat.com/articles/2130961](Explanation on the Red Hat Customer Portal)

Red Hat Update Infrastructure is preconfigured by a configuration RPM already
installed on your image. Let's find that RPM now; 

```
user@host: rpm -qa | grep -i rhui
FIXME
```

You can see available packages via RHUI, using standard `yum` commands;

```
user@host: yum repolist
FIXME
```

Official Microsoft documentation about RHUI on Azure: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/update-infrastructure-redhat


Next section
====

[Azure Native Linux Services](azure-linux-services.md)
