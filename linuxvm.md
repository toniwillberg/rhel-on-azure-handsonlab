Creating Linux VMs and using Linux VM extensions
==========================================

Azure virtual machine (VM) extensions are small applications that provide post-deployment configuration and automation tasks on Azure VMs, for either Windows or Linux. For example, if a virtual machine requires software installation, anti-virus protection, or to run a script inside of it, a VM extension can be used. In this case we will use it for update management.

In this case we will use the VM extensions to install and configure an Apache server after the VM has been created. 

To read more about extensions on Linux: https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/features-linux 
To manage updates with Azure Automation: https://docs.microsoft.com/en-us/azure/automation/automation-update-management 

List available Extensions
--------------------------------
There are multiple extensions available, let's verify what is available. Note: you must be logged in to your azure subscription. 
```
$ az vm extension image list --location westeurope 
```
For it to be more visible run: 
```
$ az vm extension image list --location westeurope --output table
```
Create a Linux VM 
--------------------------------------------------
We will create a new Linux VM with a Custom script as a VM extension. In this case we will run the script: 

See detailed instructions from here:
https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux 

First we will create a resource group where the VM will reside: 
```
$ az group create --name LinuxResourceGroup --location westeurope
```
Now, we can deploy a *RHEL* VM on the previous resource group. Security note: in production environment you *should always* use *SSH keys* instead of passwords!

This will install RHEL 7 if no specific version is given.
```
$ az vm create \
    --resource-group LinuxResourceGroup \
    --name myLinuxVM \
    --image RHEL \
    --admin-username azureuser \
    --admin-password abcdef12345! 
```
Hint: if you would like to install RHEL 8, you could use "--image RedHat:RHEL:8:latest". For this lab, use the default RHEL 7 as we haven't tested everything on RHEL 8 yet.
 
Note the output of the command and make note of *YOUR VM's public IP address*, here is an example (make sure to use your own)
```
{
  "fqdns": "",
  "id": "/subscriptions/5af250db-aef1-46f9-8296-7a373a4b2801/resourceGroups/LinuxResourceGroup/providers/Microsoft.Compute/virtualMachines/myLinuxVM",
  "location": "westeurope",
  "macAddress": "00-0D-3A-3A-6C-7A",
  "powerState": "VM running",
  "privateIpAddress": "10.0.0.X",
  "publicIpAddress": "52.174.110.X", <-- HERE
  "resourceGroup": "LinuxResourceGroup",
  "zones": ""
}
```

Now let's connect to the VM using the credentials provided in the creation command:
```
$ ssh azureuser@publicIpAddress
```
Check that nothing is running on the VM and that no Apache server has been installed (you need to provide the azureuser password to run sudo command):
```
$ sudo yum info httpd
Available Packages
Name        : httpd
Arch        : x86_64
Version     : 2.4.6
Release     : 89.el7_6
Size        : 1.2 M
Repo        : rhui-rhel-7-server-rhui-rpms/7Server/x86_64
Summary     : Apache HTTP Server
URL         : http://httpd.apache.org/
License     : ASL 2.0
Description : The Apache HTTP Server is a powerful, efficient, and extensible
            : web server.
$ sudo systemctl status httpd
Unit httpd.service could not be found.
```
Use a VM extension to install Apache
--------------------------------------------------
As you can see from the output httpd is not running and it is not installed. Now, after the creation of the VM let's set a CustomScriptExtension to be run on that VM, in this case we will run a custom script to install apache. 
```
$ az vm extension set \
  --resource-group LinuxResourceGroup \
  --vm-name myLinuxVM \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --protected-settings '{"fileUris": ["https://raw.githubusercontent.com/toniwillberg/azure-redhat/master/scripts/apache-install.sh"],"commandToExecute": "./apache-install.sh"}'
```
Connect again to the VM and verify if now you have apache installed and running: 
Now let's connect to the VM using the credentials provided in the creation command:
```
$ ssh azureuser@publicIpAddress
```
Check that Apache is running on the VM and that it has been installed (you need to provide he azureuser password to run sudo command):
```
$ sudo yum info httpd
Installed Packages
Name        : httpd
Arch        : x86_64
Version     : 2.4.6
Release     : 89.el7_6
Size        : 3.7 M
Repo        : installed
From repo   : rhui-rhel-7-server-rhui-rpms
Summary     : Apache HTTP Server
URL         : http://httpd.apache.org/
License     : ASL 2.0
Description : The Apache HTTP Server is a powerful, efficient, and extensible
            : web server.
```
```
$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2019-05-28 15:13:48 UTC; 1min 23s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 5964 (httpd)
   Status: "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec"
   CGroup: /system.slice/httpd.service
           ├─5964 /usr/sbin/httpd -DFOREGROUND
           ├─5965 /usr/sbin/httpd -DFOREGROUND
           ├─5966 /usr/sbin/httpd -DFOREGROUND
           ├─5967 /usr/sbin/httpd -DFOREGROUND
           ├─5968 /usr/sbin/httpd -DFOREGROUND
           └─5969 /usr/sbin/httpd -DFOREGROUND
May 28 15:13:48 my systemd[1]: Starting The Apache HTTP Server...
May 28 15:13:48 my httpd[5964]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 10.0.0.X. S...s messageMay 28 15:13:48 my systemd[1]: Started The Apache HTTP Server.
Hint: Some lines were ellipsized, use -l to show in full.
```
At this point you have an apache installed let's open port 80 on the Network Security Group so it can be accessed from a web browser:
```
$ az vm open-port --port 80 --resource-group LinuxResourceGroup --name myLinuxVM
```
At this point you have an apache fully functional, test it with a web browser. 

What's next?
===

Once this lab is completed, go back to [the agenda](README.md).
