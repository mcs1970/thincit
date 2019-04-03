# SophosHAAzureTemplatev3
Deployment template to deploy Sophos XG Active/Active firewall to Azure

Deploying
=========

Notes: 
-Configuration sync between the XG nodes can be done by using SFM, Sophos Central or SCFM. 
Please reach out to your sales or channel representative to learn more about these Sophos products.
-An existing virtual network must exist within the tenant you are deploying to.

1) Press the deployment button and enter your Azure credentials when prompted.

[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmcs1970%2Fthincit%2Fsophos-xg-aa%2FSophosHAAzureTemplatev3.json)

2) Provide deployment parameters.
	a. Enter existing Resource Group Name for deployment or create new. 
	b. Select appropriate subnet class for deployment virtual network. (ClassA, ClassB, or ClassC)
	c. Enter existing virtual network name to create network peer with.
	d. Enter existing virtual network address space in CIDR format. (ex: 10.0.0.1/16)
	e. Enter existing virtual network resource group name.
	f. Enter base deployment name. Base name is Harvest client ID and will be used as prefix for all resources created.
	g. Enter admin password to be used for Sophos firewalls and Azure automation account
	h. Enter number of firewall instances to create. Currently this is locked to 2.


**If invalid parameters are passed, the deployment will fail.**

Please note:
* The `adminPassword` has to be minimum 8 characters, **containing at least a lowercase letter, an uppercase letter, a number, and a special character.**

3) Agree to the Terms and Conditions, then click Purchase.

4) The deployment will start.

5) Wait until the deployment goes to state "Succeeded".

6) 

***

Connect to the VM instances
==========================

[https://full-dns-name:4444](https://full-dns-name:4444)

***

Useful Links
============

* [Authoring Azure Resource Manager templates](https://azure.microsoft.com/en-us/documentation/articles/resource-group-authoring-templates/)
