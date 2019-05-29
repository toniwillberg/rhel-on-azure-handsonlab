Linux Update Management on Azure
==========================================
You can use the Update Management solution in Azure Automation to manage operating system updates for your Windows and Linux computers in Azure, in on-premises environments, or in other cloud providers. You can quickly assess the status of available updates on all agent computers and manage the process of installing required updates for servers.

You can also schedule updates periodically to keep your environment secure and up to date, some features include: 
-Onboard virtual machines
-Assess the status of available updates
-Schedule installation of required updates
-Review deployment results to verify that updates were applied successfully to all virtual machines for which Update Management is enabled

On this section we will create an automation account, onboard a Linux VM to be manage by the automation account and install the latest updates. 

Create Automation Account
--------------------------------
To create an automation account, using a web browser access https://portal.azure.com/ click on create resource as shown in the picture. 
![WSL](/images/updates/create-resource.jpg)
In the search in the Market Place box type: "Automation" and select the resource. The next step will show up, click on "Create"
![WSL](/images/updates/create-automation-account.JPG)
