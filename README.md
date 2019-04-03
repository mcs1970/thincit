# SophosHAAzureTemplatev3
Deployment template to deploy Sophos XG Active/Active firewall to Azure

Developed by Kevin Williams @ THIncIT

***

Deploying
=========

Notes:

-Configuration sync between the XG nodes can be done by using SFM, Sophos Central or SCFM. 
Please reach out to your sales or channel representative to learn more about these Sophos products.

-An existing virtual network must exist within the tenant you are deploying to.

1) Click the **Deploy to Azure** button below and enter your Azure credentials when prompted.

[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmcs1970%2Fthincit%2Fsophos-xg-aa%2FSophosHAAzureTemplatev3.json)

2) Provide deployment parameters:

	a. Enter existing Resource Group Name for deployment or create new.
	
	b. Select appropriate subnet class for deployment virtual network. (ClassA, ClassB, or ClassC)
	
		ClassA Address Space: 10.255.255.0/24 
		ClassB Address Space: 172.16.31.0/24 
		ClassC Address Space: 192.168.255.0/24 
	
	
	c. Enter existing virtual network name to create network peer with.
	
	d. Enter existing virtual network address space in CIDR format. (ex: 10.0.0.0/16)
	
	e. Enter existing virtual network resource group name.
	
	f. Enter base deployment name. Base name is Harvest client ID and will be used as prefix for all resources created.
	
	g. Enter admin password to be used for Sophos firewalls and Azure automation account. **Must be 8 characters and contain at least a lowercase letter, an uppercase letter, a number, and a special character.**
	
	h. Enter number of firewall instances to create. Currently this is locked to 2.

3) Agree to the **Terms and Conditions** then click **Purchase.**

4) The deployment will start. Wait until the deployment goes to state "Succeeded".

5) In the **Microsoft.Template - Overview** blade click **Outputs.**

6) Document deployment output values.

		output 1:publicIPDNS
		output 2:firewall-0-Management-URL
		output 3:firewall-1-Management-URL
		output 4:firewall-0-Alias-IP
		output 5:firewall-1-Alias-IP
		

Next Steps: Add alias IP's to firewalls, complete Network Peering setup on remote virtual network, update Network Security Groups to apply to subnets instead of network interface cards, move public load balancer SSH port from rule 103 to rule 101.

***

Connect to the VM instances
==========================

[https://firewall-0-Management-URL:4444](https://firewall-0-Management-URL:4444)

[https://firewall-1-Management-URL:4444](https://firewall-1-Management-URL:4444)

***

Azure Resources Created
=======================

**Resource Type / Resource Name**

 Availability Set: `clientID-dmz-as`

 Automation Account: `clientIDazAutomation`

 Storage Account: `clientIDdmzsa(unique string)`

 DMZ Public IP Address: `clientID-dmz-public-lb-fe-pip`

 Management Public IP Addresses: `clientID-fw0-mgmt-nic-pip`, `clientID-fw1-mgmt-nic-pip`

 Virtual Network: `clientID-dmz-vnet`

 Network Security Group: `clientID-dmz-nsg`

 Standard Public Load Balancer: `clientID-dmz-public-lb`

 Standard Internal Load Balancer: `clientID-dmz-private-lb`

 Network Peering: `clientID-dmz-vnet-TO-(existingvnet)`
 
 Virtual Machines: `clientID-fw0-vm`, `clientID-fw1-vm`
 
 RunBooks: `clientID-azAutomation/RunbookJob0`, `clientID-azAutomation/RunbookJob1`

***

Useful Links
============

* [THIncIT](https://www.thincit.com)

* [Authoring Azure Resource Manager templates](https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/)

* [Sophos XG Firewall: How to implement a full HA (inbound/outbound) on Azure](https://community.sophos.com/kb/en-us/133755)
