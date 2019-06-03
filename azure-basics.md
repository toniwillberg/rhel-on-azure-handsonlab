

Azure basics
===========================

Azure is a complete cloud platform that can host your existing workloads, new applications or extend your on-premises deployments by providing multiple services with all the advantage and fficiencies of cloud computing.

Azure Resource Manager overview:
--------------------------------

Services in Azure run on top of the Azure Resource Manager which is the deployment and management service for Azure. This allows you to provide:

- A Management layer that enables you to create, update, and delete resources in your Azure subscription. 
- Give RBAC to your resources. 
- Manage deployments either by using manual or automated methods that include: Azure Portal, CLI, PowerShell, SDKs, REST API or ARM templates.

The following image shows how all the tools interact with the Azure Resource Manager API. The API passes requests to the Resource Manager service, which authenticates and authorizes the requests. Resource Manager then routes the requests to the appropriate service.

Management Scopes in Azure: 
--------------------------------

Azure provides four levels of management scope as it is shown in the picture: management groups, subscriptions, resource groups, and resources. 

![Azure scopes](https://docs.microsoft.com/en-us/azure/azure-resource-manager/media/resource-group-overview/scope-levels.png)

- **Management Group:** management groups are a way to group multiple subscription to manage RBAC, compliance, policies, etc. As shown in the image it is a management group above subscriptions, this way you can set up your governance conditions for your entire organization ("Root Management Group") or by groupings of subscriptions, once you apply conditions to a management group they are inherited by all subcscriptions within. 

     Read More: https://docs.microsoft.com/en-us/azure/governance/management-groups/index

- **Subscriptions:** a subscription is an agreement that as a customer or partner has with Microsoft and that gives them access to provision resources in Azure. Every subscription will have a trust relationship with an Azure AD tenant, so you can authenticate users, services and devices. A subscription can only trust one tenant, but you can have multiple subscriptions in the same Azure tenant, this set up is useful since subscriptions have limits on the amount of resources you can create on them and then you could scale; also allows you to have different billing mechanisms and have everyone be accountable for what they create on Azure. 

- **Resource Groups:** a resource group is a container or a bucket that holds related resources for an Azure solution. Usually resource groups are used to include those resources that you want to manage as a group or that have the same lifecycle. However you can use them in a way that is relevant to you. 

     Read More: https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview 

- **Resources:** a manageable item that is available through Azure. Basically anything you create in Azure is a resouces: VMs, disks, IP address, vNETs, data bases, etc.

All of the management scopes described above allows you to govern your cloud and create settings at each level, including RBAC and policies. For guidance on how enterprises can use Resource Manager to effectively manage subscriptions, read: 

https://docs.microsoft.com/en-us/azure/architecture/cloud-adoption-guide/subscription-governance?toc=%2fazure%2fazure-resource-manager%2ftoc.json

Another advantage of Azure Resource Manage (ARM) and the management scopes is that you can define and deploy your infrastructure through the declarative syntax in Resource Manager templates in JSON format and avoid any manual steps. 
You can read more here: 

https://docs.microsoft.com/en-us/azure/azure-resource-manager/template-best-practices

Azure Portal
--------------------------------

The Azure portal is a web console that allows you to manage your Azure resources via a graphical user interface, for command line management you could use PowerShell, Azure CLI or SDKs. The Azure portal is designed for resiliency and continuous availability. 

Access the portal via web browser: 

```
https://portal.azure.com

```
After you login you will see a portal as the image: 

![Portal](/images/basics/azure-portal-fullscreen-map.png)

Let's explore each element of the portal, navigate through them: 
1. **Page Header:** appears at the top of every portal page and holds global elements. You can use it to return to main menu. 
2. **Global search:** the search bar is used to quickly find resources, a service, or documentation. Search for Virtual Machine and you will see available services, resources you have deployed with that name (in this case none) and related oficial documentation. 

![Search](/images/basics/search.JPG)

3. **Global controls:** these features persist across the portal independently on where you navigate to, they include: Cloud Shell, subscription filter, notifications, portal settings, help and support, and send us feedback. Cloud Shell we will explore during the labs and it is a browser shell experience, subscription filter allows you to only show resources associated with a subscription or a group of them, notifications are shown any time you take an action on the portal you can check the progress of a resource creation for example, in portal settings you can change the language and theme of the portal amongst other things. Change the color scheme of your portal on the settings feature.

4. **Your account:**. View information about your account, switch directories, sign out, or sign in with a different account. 

5. **Sidebar:**  The sidebar is a global element that helps you to navigate between services. The sidebar can be collapsed to give more focus to the working pane. This is used to create new resources or access those that you use the most, you can pin your most used ones. 

6. **Master control:** to create a new resource in the current subscription. Search or browse the Azure Marketplace for the resource type you want to create. It is similar to accesing the Global Search, only that by clicking on "Create Resources" you will only see available services to deploy new resources to your cloud enviroment, and you will not see documentation or previously deployed resources as you would in the search bar. 

7. **Your favorites list:** as mentioned before, you can add or remove services from the All services page. Let's add Kubernetes as a Favorite to your Dashboard. To do that click on "All Services" and select the star next to the Kubernetes Services. 

![AKS](/images/basics/favorite.png)

8. **Left pane:** many services include a left pane menu to help you manage the service. Once you deploy a service such as a VM you can configure it from the Left pane.

9. **Command bar:** The controls on the command bar are contextual to your current focus. Once you deploy a service such as a VM you can operate on them by this command bar starting, stopping them, etc.

10. **Breadcrumb:** You can use the breadcrumb links to move back a level in your workflow.

11. **Working pane:** Displays the details about the resource that is currently in focus.

What's next?
==============

Once this lab is completed, go back to [the agenda](README.md).
