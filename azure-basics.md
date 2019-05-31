

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


