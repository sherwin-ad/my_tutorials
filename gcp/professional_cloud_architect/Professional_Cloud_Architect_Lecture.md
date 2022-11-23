[TOC]



# Cloud Resource Management

## GCP resource Hierarchy

- Hierarchy of Ownership is via parent/child relationship.

  - It is similar to Traditional File System. 
  - File System like 
    - Each Child will have only One parent
    - Permissions are inherited from Top to Down
    - More permissive Parent Policy always overrules more Restrictive Child Policy.

- The Primary concept that governs it is - IAM

### Google Cloud Resource Hierarchy

#### 1. Organizations (root Node)

Key Roles:

- IAM Access Applied to org resource, applied to all below hierarchy.
- Can Grant Access to Different People
- Organization Admin - Full Power to edit all Permissions.

- Organization Owner - Reserved for G Suite Super Identity.

#### 2. Folders (Optional)

- Additional Grouping between Projects
- IAM Role Applied to Folder will be applied to all Projects inside
- Useful for Grouping by Department
- Note - Removing Projects from Folder will removed folder applied Rules as well.

#### 3. Projects (25 Project Limit for Single Account)

- Core Organizational Component

- Required to Use any GCP Resource

- Basic of Every GCP Service

  

- Unique Project ID (Globally Unique)

- Project Number (Auto Generated)

- Project Name - User Friendly Self Generate Value

#### 4. Inside Resources

- Compute Engines, Network, Storage etc

### Policy Inheritance 

- **Child Node Inherit parent permission**
  Example: 
  Project Viewer Role granted Organizational Node will be apply to all Folders, Projects and Down the line resources.
- **More Permissive Parent Policy will always overrule restrictive child policy.**
  Example: 
  If User ‘X’ have Project Editor Role at Folder level, you can’t remove Compute Admin Role at Project level.



## Labels in GCP

### What are Labels?

- Labels are kind of Sticky Notes which you can apply on Google Resources.
- For Labels, there is no set of Rules. You can use labels as per your need.
- Labels are useful for search resources in cloud.

### How Labels Work?

- Labels are key-value pair.
- Key is unique Identifier and Value can be Duplicate/Empty.
- User is allowed to put **64 Labels/ resource**.
- Examples:
  - Define Cost Center/Location
  - Define Resource Environment/Project
  - Define Service Type/owner
  - Define Resource State ready, inuse, ready for deletion etc

### Labels vs Network Tags

**Labels**

- Can be applied across all GCP resources.

- Can be Applied for Monitoring Purpose.

- Cannot affect the resource Operations.

**Network Tags** 

- Only for Network/VPC Resource.
- Affects resource Operation (Firewall Rule Access, Network Route)

## Quotas

Goto **IAM & Admin** > **Quotas**

### What is resource quota?

- Capping Limit on resources that you create. Resource limit on Project wise.

- It prevent unexpected spikes in resources.

### Types :

1. Resource per Project.
2. API Rate Limit Request.
3. API Resource Quota.

### Why we need Quota?

- Programmatic Error in Resource Creation can lead to massive unwanted cost.
- Protection from Unexpected Spikes in Resource uses.
- Review Sizing Consideration.
  Example: 
  Do you really need 124 vCPU Machine.

### Increasing Quota

- Most Quota is soft capping, and can be increasing on request.
- Quotas can be viewed in Console.
- Best Practice - Pro activity request increase for expected Demand.



## Cloud IAM (Identity Access Management )

- IAM is core fundamental requirement to pass the Exam, plus a day to day performing role of Cloud Architect.
- Technical Definition - “With Cloud IAM you can grant granular access to specific GCP resource and prevent unwanted access to other resources. Cloud IAM lets you adopt the security principle of least
  privilege, so you grant only necessary access to your resources.”

### Who Can do what on which resources?

1. Who = **Member**

2. Can Do What = **Role**

3. On Which Resources = **Resources in GCP**

#### 1. Who = Member = Identity

1. **Person Authenticate with Identity** (email address)
2. **Service Account** 
   - Server/Application access account, not associated with any person.
   - Special Type of Account, Not Attached to User.

#### 2. Can do What = Role = Group of Permissions

- Permission : What operation is allowed on Resource
- Permission Format : service.resource.verb

  - compute.instances.edit
- Permissions are not directly assigned to a Member (Who)
- Permissions are bundled in Roles - Roles further assign to Members
    - Multiple Roles can be assigned to Single Member

**Type of Roles**

1. **Primitive**
   - Broad, original roles available in GCP
   - Applied across entire environment
   - Owner: Modify all resource and manage IAM and Billing
   - Editor: Modify all resource and No access to IAM and Billing
   - Viewer: Only view resource
2. **Predefined**
   - More Granular, specific access not access the entire project
   - Applied to single service
     - Example compute.storageAdmin - Allow Full control of Compute Engine storage resources.
3. **Custom**
   - Even more granular than Predefined Roles
   - Hand Made Group of Permissions

#### 3. On Which Resources = Resources in GCP

- All of the component of GCP
- Including Organization, Folder, Projects and resources inside.
  - Compute Engine, App Engine, ML APIs, Data Services, Network etc.

### Cloud Identity Sync with Active Directory

#### Why it all required?

- Business are not using G Suite to to manage the user Accounts.

- Separate maintenance of User Account is not a good idea.

- Need of Single Source of identity to Manage Both GCP and Non GCP Identities.

#### How it works?

- Cloud Identity maps Active Directory Accounts to Cloud Identity Accounts
  - Mapping is called **Federation**
- Active Directory is “Single Source of truth”.
- Sync AD → CI , Not applicable CI → AD
- All users and password management done in AD like-
  - Create/Modify/Delete in AD
  
  - CI Automatically creates Google account from AD Accounts

  - Provides single sign-on capability to GCP
  

#### How to Sync?

- Google Cloud Directory Sync (GCDS)
  - Google Sync Tools run on AD Server
- Active Directory Federation Service (ADFS)
- Microsoft Tool

![image-20221121180058124](images/image-20221121180058124.png)



### Cloud IAM Policies

- Access control for Google Cloud resources is managed by Cloud IAM policies. A Cloud IAM policy is directly attached to a resource.

- The policy manages access to the resource itself as well as any child resources through policy inheritance.

- A policy is a collection of bindings, audit configuration, and metadata.

  - Binding - specifies how access should be granted on resources with context specific conditions.
    - Fields of Binding 
      - A Member
      - A Role
      - A Condition - Conditions are typically used to control whether access is granted based on the context for a request.
    
  - Audit Config - how access attempts should be audited.
  
  - Metadata - includes additional information about the policy, such as an etag and version to facilitate policy management.
    - etag - used for concurrency control, and ensures that policies are updated consistently.
    - Version - specifies the schema version for a given policy.

- Uses of etag - etag is used to avoid the race conditions on IAM Policies.
  
- When multiple systems try to write to the same Cloud IAM policy at the same time, there is a risk that those systems might overwrite each other's changes.
  
- This risk exists because updating a Cloud IAM policy involves multiple operations:
  
  - Reading the existing policy

  - Modifying the policy

  - Writing the entire policy

- To help prevent this issue, Cloud IAM supports concurrency control  through the use of an etag field in the policy. The value of this field changes each time a policy is updated.

- **Policy Example**

```
{
"bindings": [
  {
   "members": [
   "group:prod-dev@example.com",
   "serviceAccount:prod-dev-example@appspot.gserviceaccount.com"
   ],
   "role": "roles/appengine.Deployer",
   "condition": {
      "title": “Expires_July_1_2025",
      "description": "Expires on July 1, 2025",
      "expression":
         "request.time < timestamp('2025-07-01T00:00:00.000Z')"
    }
   }
  ],
  "etag": "BwWKmjvelug=",
  "version": 3
}
```

- Every Google Cloud resource that supports a Cloud IAM policy at its level in the resource hierarchy can have a maximum of one policy.
- Each Cloud IAM policy can contain up to 1,500 members. Up to 250 of these members can be Google groups.
- Any policy changes will take effect within 60 seconds.
- Policy Hierarchy works on water-fall model. All child will have the policy applied on parent resources.



### Cloud IAM : Service Accounts

#### What is Service Account?

- Special Type of Account, Not Attached to User.
- Service account represent by email address-
  - 1234-compute@developer.gserviceaccount.com
- Allow authentication between Application and GCP Services.
- By Default, GCE instances use Service account to access GCP services.

#### Types of Service Account.

1. Google Managed

   - Represent different google services and automatically generate IAM Roles.
2. User Managed
   - Created for/by you. Based on Enable APIs in Project
   - [project-number]-compute@developer.gserviceaccount.com
   - [project-id]@appspot.gserviceaccount.com
   - Service Account can also be assigned to Person Email(Member)

- Service Account keys
- Service Account access managed by account keys.
  - Assume it like a account password
- Default Service account keys are managed by google and can’t be accessed and edited.
- Custom service account can use (custom) user managed Keys-
    - Google Maintain Public Copy but Private key is user Managed.
    - If user lose private key, Google cannot retrieve it.
    - Can Also Used Google Managed Keys.

### Cloud IAM Best Prctices

- Efficient architecture is always needed to avoid huge Maintenance cost.
- Cloud Identity and Access Management (Cloud IAM) policies can be set at different levels of the resource hierarchy.
- Resources in GCP inherit the policies of the parent resource. The effective policy for a resource is the union of the policy set at that resource and the policy inherited from its parent.
- User is open to set Policies at any Level Organisation Level, Folder Level, Project Level or Resource Level.

**Best Practices**

- Organization and folder level structures are recommended for Big Firms, start-up can use the flat structure.
- Set policies at the organization level and at the project level rather than at the resource level.
- Grant roles to a Google group instead of to individual users when possible.
- Use the security principle of least privilege to grant Cloud IAM roles; that is, only give the least amount of access necessary to your resources.
- If user need to grant a role to a user or group that spans across multiple projects, set that role at the folder level instead of setting it at the project level.
- Audit the ownership and the membership of the Google groups used in policies.

### Cloud Billing

**Setting Up and Monitoring is essential Architect Skill.**

- Grant IAM Roles to users to Create, Manage and use Billing Accounts.

- Monitor Cost and SetUp Project Budget and Alert

- Manage Billing Data for Retention and Analysis.

**Billing and Cloud IAM**

- Assign Mostly at organization level or within Billing Account.
- Billing Roles are Defined in Cloud IAM.

**Billing + Cloud IAM**

- Billing Account Creator

  - Create new Organization Level Billing Account
- Billing Account Administrator
    - Manage Billing Accounts
    - Configure Billing Expost
    - Link/Unlink Projects
    - Manage Billing User Roles
- Billing Account User
  - Link Project with Billing Account
- Billing Account Viewer
- View Billing Information (Finance Team)

**View and Manage Billing Data.**

- How much you are paying, and for what?
- View Billing Data in Web Console.
  - View Treds, Current resource Billing
- Export Billing Data to Cloud Storage and Big Query
    - Forwards Export to finance Department/ Auditor
- SetUp Project Budget and Alert
  - Doesn’t stop billing resource uses, Just send Alert.



## GCP : Operations Overview

### Stack Driver 

**What is Stack Driver?**

- Tool used for Monitoring, Logging, and Tracking for application Operations.
- Native Monitoring for GCP & AWS.
- Dynamically Discover all GCP resources.
  - Install StackDriver Client on VMs.

**StackDriver/Operations Benefits**

- Multi Cloud Monitoring GCP & AWS.
- Identify behaviour and proactively fix the issues.
- Centralized Logging Mechanism.
- More Relevant and Accurate Alerts.
- Find and Fix Problems Faster.

###  Logging
- Central Collection for all activity logs.

**Logging Operations**

- GCP provider single repository for all Logging Data from multiple source.
- Store, search & analyze logs.
- Can collect Platform, System and Application logs.
- Realtime and Batch Monitoring.
- Export logs to other source for long term storage/analysis.

**Concept and Terminology**

- Associated by project.
  - Logs viewer only shows logs for one project.

- Log Entry - record status and events.

- Named collection of log entries.

- Dynamic log retention period.

  
  

**Log Types**

- Who did what, where and when.
- Audit logs-
  - Admin Activity, System Activity, Data Access
- Agent Logs
- Agent Installed on VMs
- Record VM system and third party app logs

Admin Activity / System Event Logs

- Administrative Actions and API Calls

  - User ‘X’ created a Instance

- System Event Logs
- Like Live Migration Event

**Data Access Logs**

- Logs API Call that Create, Modify or Read user data
- Default off, can become Huge
- Chargeable after defined Limit.

**Agent Logs**

- Agent Installed on Support VM’s

- Logs data from Third Party applications.

- Chargeable after the Limit.

**Pricing**

- First 50GB/Project/Month Free - $0.5/GB
- Admin and System Event Logs Exempt

**Retention**

- Admin Activity - 400 Days

- Data Access - 30 Days

- System Events -  400 Days

- Access Transparency - 400 Days

- All Other Logs - 30 Days

**Exporting Logs (Imp Topic)**

- After Retention, Logs are delete and can’t recover.
- Export Logs for long term retention.
- Long Term Storage(Cloud Storage), Big Data Analysis(Big Query),
- System to Other Source(Pub/Sub)

**Exporting Logs basics** 

- Require a Project and Destination Service
- Filter - Filter Logs Type to Export
- Destination - Cloud Storage, Big Query, Pub/Sub
- Filter and Destination configure using Sink - Direct What logs to copy to which location
- Only new logs will be exported after sync creation

**IAM Roles**

- Logging Admin - Have Full control. Ability to add others to logging IAM
- Logs Viewer - Can View Logs
- Logs Writer - Grant Service Account Ability to create Logs.
- Log Config Writer - Create Metrics and Export Sinks

### Monitoring 
- Monitor Metric, HealthChecks, Dashboard and Alerts.

### Error Reporting
- Identify and Understand Applications Errors.

### Trace
- Find Latency Bottleneck in applications.

### Debugger
- Find/Fix code error in production.

### Profiler 
- Collect CPU/Memory Data, Optimize Performance.