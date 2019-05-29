Linux Update Management on Azure
==========================================
You can use the Update Management solution in Azure Automation to manage operating system updates for your Windows and Linux computers in Azure, in on-premises environments, or in other cloud providers. You can quickly assess the status of available updates on all agent computers and manage the process of installing required updates for servers. Update Management is available at no additional cost (you only pay for log data stored in the Azure Log Analytics service).

You can also schedule updates periodically to keep your environment secure and up to date, some features include: 
- Onboard virtual machines
- Assess the status of available updates
- Schedule installation of required updates
- Review deployment results to verify that updates were applied successfully to all virtual machines for which Update Management is enabled

On this section we will onboard the Linux VM you just created to be manage by the automation account and install the latest updates. 

Manage Updates on Linux VMs
--------------------------------
To create enable update management for a VM you have 2 options, either create an automation account and onboard the VMs from there, or on the specific VM you can enable update management. We'll take the second route. 

Navigate to the VM we created in previous sections. Select the name of the VM "myLinuxVM" and click on it. 

![VM](/images/updates/VM.jpg)

Then on the left hand pane, under the "Operations" section select update management:

![update-management](/images/updates/update-management.jpg)

Configure the update management as follows: 

- Select Enable for this VM
- Location: West Europe
- Log Analytics Workspace: Create default workspace
- Automation Account Subscription: select your subscription
- Automation Account: create default account...

![update-management](/images/updates/update-management-settings.JPG)

Click on Enable, it will take a few minutes to be set up. Once it is done you will see something like: 

![update-management](/images/updates/update-management-done.JPG)

Everything is up to date on this VM since we just deployed it, but we can schedule future or recurrent updates. Click on "Schedule update deployment"

![schedule](/images/updates/schedule.jpg)

Then we need to configure the schedule: 

![settings](/images/updates/settings.JPG)

The parameters are:

- **Name**: will be the name for this schedule lets call it "myLinuxUpdate"
- **Update Classifications**: on update classification we will select all. This  option allows you to classify the type of updates you want to apply for this schedule. 
- **Include/Exclude updates**: are lists of package names that should be specifically added or removed during the update deployment, you could use wildcards. We will leave this option empty since we want all patches to be applied. 
- **Schedule Settings**: indicate when do you want this schedule to run and if it is recurrent or not. We will set the starting point for now and schedule updates for once a month, every last saturday. Hint: use weekdays as monthly occurrences. There will be no expiration.
- **Pre-Scripts + Post-Scripts**: this parameter provides the ability to run custom tasks before and after an update deployment. Some of the more common scenarios include starting VMs before deploying updates, starting and stopping services, or running a backup. For this example we will leave this section empty.
- **Maintenance Windows**:  leave the default value. You can set the window of time that you want the update deployment to occur within. This setting helps ensure that changes are performed within your defined service windows.
- **Reboot Options**: This setting determines how reboots should be handled. Available options are: reboot if required (Default), always reboot, never reboot, only reboot - will not install updates. Leave the default value.

Click on "Create" and you have scheduled automatic updates for your Linux VM. 