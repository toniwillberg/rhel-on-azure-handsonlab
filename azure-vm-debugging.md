[Advanced debugging](azure-vm-debugging.md)
=======
On the next section we will cover tools you can use to troubleshoot Linux virtual machine (VM) issues in Azure after they are deployed. 

Password Reset 
--------------------------------
If at some point you can't log in to a VM, and you receive a message that indicates that the password that you used is incorrect. You could use VMAgent to reset your password on the Azure portal or CLI and gain access to the VM again. 

We will change the password to the VM  we created earlier (you could also reset SSH keys) the new password will be ghij6789!
```
$ az vm user update -u azureuser -p ghij6789! -n myLinuxVM -g LinuxResourceGroup
```
Login to the VM with the newly reset credentials: 
```
$ ssh azureuser@publicip
```
You could also achieve this from the Azure Portal as shown in the picture: 

![password](/images/troubleshoot/password-reset.jpg)

VM Serial Console and Boot Diagnostics
------------------------------------------
The #1 most popular VM support topic is users unable to SSH or RDP to their VM, these issues can be caused by a lot of diferent things but usually the OS has not booted correctly or a network/SSH misconfiguration. Often easy to resolve if physical access to the computer’s serial port is possible or using the console. 

For this section we need a feature called boot diagnostics  and we need to enable it on the VM to troubleshoot. Boot diagnostics also needs a storage account, we will create that first: 
```
$ az storage account create -n mylinuxaccount -g LinuxResourceGroup -l westeurope --sku Standard_LRS
```
```
$ az vm boot-diagnostics enable --name myLinuxVM --resource-group LinuxResourceGroup --storage https://mylinuxaccount.blob.core.windows.net/
```
NOTE: Storage accounts names need to be unique by region so if it is taken you might need to change it. 
After it has been enabled go to https://portal.azure.com and verify it. Navigate to the VM 

![VM](/images/troubleshoot/VM.jpg)

Since that has been enabled we will make some changes on the VM like any administrator would. 
Let's log in to our VM:
```
$ ssh azureuser@publicip
```
And we will add some rules to our system's firewalld as part of our admin tasks: 
```
$ sudo firewall-cmd --permanent --add-port=100/tcp
$ sudo firewall-cmd --permanent --add-service=https
$ sudo firewall-cmd --permanent --remove-service=ssh
$ sudo firewall-cmd --reload

```
Exit the SSH session and try to connect again. 
```
$ ssh azureuser@publicip
```
You will get a message like: 
```
ssh: connect to host 65.52.136.XX port 22: Resource temporarily unavailable
```
Ups! we are out of the VM let's fix it. If we didn't know what is going on, a good place to start would be the Boot Diagnostics let's explore that. Click on MyLinux VM from the list. On the left pane under the section "Support + troubleshooting" select "Boot Diagnostics". 

![boot](/images/troubleshoot/boot-diagnostics.jpg)

There you can see both a screenshot and a text version of the log:

![boot1](/images/troubleshoot/boot-diagnostics1.JPG)


![boot2](/images/troubleshoot/boot-diagnostics2.JPG)

We know what the problem is, we can fix it by enabling SSH again on the firewall, but we would neeed access to the VM, luckily there is the serial console

![serial](/images/troubleshoot/serial-console.JPG)

Login via Serial Console, authenticate and open the SSH port on the systems firewall and enable SSH.
```
$ sudo firewall-cmd --permanent --add-service=ssh
$ sudo firewall-cmd --reload
```
Try to SSH again and voila! you are in. 

Now please reset the password back to the orignal, makes it easier to remember it:
```
$ az vm user update -u azureuser -p abcdef12345! -n myLinuxVM -g LinuxResourceGroup
```


What's next?
===

Once this lab is completed, go back to [the agenda](README.md).
