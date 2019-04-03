# SophosHAAzureTemplatev3
Deployment template to deploy Sophos XG Active/Active firewall to Azure

Developed by THIncIT

***

Deploying
=========

Notes:

-Configuration sync between the XG nodes can be done by using SFM, Sophos Central or SCFM. 
Please reach out to your sales or channel representative to learn more about these Sophos products.

-An existing virtual network must exist within the tenant you are deploying to.

1) Press the Deploy to Azure button and enter your Azure credentials when prompted.

[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmcs1970%2Fthincit%2Fsophos-xg-aa%2FSophosHAAzureTemplatev3.json)

2) Provide deployment parameters:

	a. Enter existing Resource Group Name for deployment or create new.
	
	b. Select appropriate subnet class for deployment virtual network. (ClassA, ClassB, or ClassC)
	
		ClassA Address Space: 10.255.255.0/24
		
		ClassB Address Space: 172.16.31.0/24
		
		ClassC Address Space: 192.168.255.0/24
	
	
	c. Enter existing virtual network name to create network peer with.
	
	d. Enter existing virtual network address space in CIDR format. (ex: 10.0.0.1/16)
	
	e. Enter existing virtual network resource group name.
	
	f. Enter base deployment name. Base name is Harvest client ID and will be used as prefix for all resources created.
	
	g. Enter admin password to be used for Sophos firewalls and Azure automation account.
	
	h. Enter number of firewall instances to create. Currently this is locked to 2.

	
**If invalid parameters are passed, the deployment will fail.**

Please note: The `adminPassword` has to be minimum 8 characters, **containing at least a lowercase letter, an uppercase letter, a number, and a special character.**

3) Agree to the Terms and Conditions then click Purchase.

4) The deployment will start. Wait until the deployment goes to state "Succeeded".

5) In the Microsoft.Template - Overview blade click Outputs.

6) Document deployment output values

		publicIPDNS
		
		firewall-0-Management-URL
		
		firewall-1-Management-URL
		
		firewall-0-Alias-IP
		
		firewall-1-Alias-IP
		

Next Steps: Add alias IP's to firewalls, complete Network Peering setup on remote virtual network

***

Connect to the VM instances
==========================

[https://firewall-0-Management-URL:4444](https://firewall-0-Management-URL:4444)

[https://firewall-1-Management-URL:4444](https://firewall-1-Management-URL:4444)

***

Azure Resources Created
=======================

**Resource Type / Resource Name**

Availability Set: `clientID`-dmz-as

Automation Account: `clientID`-azAutomation

Storage Account: `clientID`dmzsa(unique string)

DMZ Public IP Address: `clientID`-dmz-public-lb-fe-pip

Management Public IP Addresses: `clientID`-fw0-mgmt-nic-pip, `clientID`-fw1-mgmt-nic-pip

Virtual Network: `clientID`-dmz-vnet

Network Security Group: `clientID`-dmz-nsg

Standard Public Load Balancer: `clientID`-dmz-public-lb

Standard Internal Load Balancer: `clientID`-dmz-private-lb

Network Peering: `clientID`-dmz-vnet-TO-(existingvnet)

Virtual Machines: `clientID`-fm0-vm, `clientID`-fw1-vm

RunBooks: `clientID`-azAutomation/RunbookJob0, `clientID`-azAutomation/RunbookJob1

***

Useful Links
============

* [THIncIT](https://www.thincit.com)

* [Authoring Azure Resource Manager templates](https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/)

* [Sophos XG Firewall: How to implement a full HA (inbound/outbound) on Azure](https://community.sophos.com/kb/en-us/133755)
