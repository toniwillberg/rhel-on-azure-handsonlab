Linux Update Management on Azure
==========================================
You can use the Update Management solution in Azure Automation to manage operating system updates for your Windows and Linux computers in Azure, in on-premises environments, or in other cloud providers. You can quickly assess the status of available updates on all agent computers and manage the process of installing required updates for servers.

You can also schedule updates periodically to keep your environment secure and up to date, some features include: 
- Onboard virtual machines
- Assess the status of available updates
- Schedule installation of required updates
- Review deployment results to verify that updates were applied successfully to all virtual machines for which Update Management is enabled

On this section we will onboard the Linux VM you just created to be manage by the automation account and install the latest updates. 

Manage Updates on Linux VMs
--------------------------------
To create enable update management for a VM you have 2 options, either create an automation account and onboard the VMs from there, or on the specific VM you can enable update management. 