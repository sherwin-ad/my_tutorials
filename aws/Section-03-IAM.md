# Section 3: Identity Access Management (IAM)

## Identity Access Management (IAM) Overview

* allows you to manage users and their level of access to the AWS Console.

###  What does IAM gives you?
* Centralized control of your AWS account 
* Shared Access to your AWS account 
* Granular Permissions
* Identity Federation (including Active Directory, Facebook, Linkedin etc)
* Multifactor Autnentication
* Provide temporary access for users/devices and services where necessary
* Allows you to set up your own password rotation policy
* Integrates with many different AWS services
* Supports PCI DDS Compliance

### Critical Terms
* Users - End Users (think people)
* Groups - A collection of users under one set of permissions.
* Roles - You create roles and can then assign them to AWS resources
* Policies - A document that defines one or more permissions

Notes: 
**Access key ID** and **Secret acces key** are user to programmtically access AWS console

### What have we learnt so far?

* IAM is universal. It does not apply  to regions at this time.
* The "root account" is simply the account created when first setup your AWS account. It has complete Admin access.
* New users have no permissions when we first created.
* New users are assigned **Access Key ID** and **Secret Access Keys** when first created.
* These are not the same as a password, and you cannot use the **Access key ID** & **Secret Access Key** to login to the console. You can use this to access AWS via the APIs and Command Line however.
* You only get to view these once. If you lose them, you have to regenerate them. So save them in a secure localtion.
* Always setup Multifactor Authentication on your root account
* You can create and customise you own password rotation policies

### Create A Billing Alarm

#### Enabling Billing Alerts
1. Open the Billing and Cost Management console at 	https://console.aws.amazon.com/billing/
2. In the navigation pane, choose Billing Preferences.
3. Choose Receive Billing Alerts.
4. Choose Save preferences.
	
#### Creating a Billing Alarm
1. Open the CloudWatch console at https://console.aws.amazon.com/cloudwatch/
2. If necessary, change the Region to US East (N. Virginia). Billing metric data is stored in 	         this Region and represents worldwide charges.
3. In the navigation pane, choose Alarms, Create Alarm.
4. Choose Select metric. In the All metrics tab, choose Billing, Total Estimated Charge.
5. Select the check box next to EstimatedCharges, and choose Select metric.
6. Under Conditions, choose Static.
7. For Whenever EstimatedCharges is, choose Greater.
8. For than, enter the monetary amount (for example, 200) that must be exceeded to 		    trigger the alarm.
Note:
The preview graph displays your current charges for the month.
9. Choose Next.
10. Under Notification, select an SNS topic to notify when the alarm is in ALARM state.
To have the alarm send multiple notifications for the same alarm state or for different alarm states, choose Add notification.
11. When finished, choose Next.
12. Enter a name and description for the alarm. The name must contain only ASCII characters. Then choose Next.
13. Under Preview and create, confirm that the information and conditions are what you want, then choose Create alarm.

