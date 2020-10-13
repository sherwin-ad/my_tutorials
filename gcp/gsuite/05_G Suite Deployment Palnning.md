[TOC]



# G Suite Deployment Palnning



## Welcome and Getting Started Guide

**Introduction**

Welcome to Planning for your G Suite deployment. This is the final course in the G Suite Administration series of courses.

In earlier courses, you were introduced to the day to day management tasks of the G Suite administrator.

In this course, you will explore best practices for deploying G Suite. This course is aimed particularly at organizations with more than 250 users who **have not yet** deployed G Suite within their organization but may also be of interest to existing G Suite administrators who were not perhaps involved in the deployment project. 

If you are an administrator from an existing G Suite organization, a business with less than 250 users, or an educational establishment, you are still encouraged to work through the course as topics covered here may benefit you in future projects. You can also read the[ Quick Start Guide for medium-size businesses](https://support.google.com/a/answer/9212645) and[ G Suite for Education Quickstart IT Setup Guide](https://docs.google.com/document/d/1iSAa1EGbR7t3inUBkkANeY8qKMT9ROWZeTh2V8Cmfi8/preview#heading=h.lks5nmglx2g9) for information more specific to your own organization.

**What to expect during this training course?**

This course walks you through how to plan for your deployment. As a theoretical course, it is important to understand that **it is a reading-based** course. There are no hands-on exercises. 

During this course, you will focus primarily on the technical aspects of a G Suite deployment, and you will be introduced to Google’s three phase deployment methodology. The best practices you will learn here have been developed over some time, and when followed correctly, they will ensure a successful G Suite deployment for your users. In addition to technical considerations, you will also learn the importance of Change Management to ensure the successful adoption of G Suite.

*To make this learning more realistic, we’ll follow a hypothetical scenario where you'll be helping your organization, Galaxy Sola, transition it’s users over to G Suite—following Google’s best practices.* 

*You will play the part of Jon, the Technical Project Lead for the deployment. Before joining Galaxy Sola, you had worked on a number of other G Suite deployments, so it is your job to guide Galaxy Sola through the transition as smoothly as possible.* 

*You will offer advice and support in key areas such as handling coexistence with legacy platforms, managing multiple domains, provisioning users, configuring mail delivery, and migrating data.*

Note that some topics that would normally be considered as part of a G Suite deployment are not mentioned here as these are covered in later courses. These topics include: authentication and security, managing services, organizational structure and mobile device management.

By the end of this course, you will understand the key technical considerations that apply to a typical G Suite deployment.

**Help Center resources**

- [Set up G Suite for your organization](https://support.google.com/a/answer/6365252)

Remember to use the Help Center links when they are provided. The Help Center is what we consider our single source of truth!



## Path to a Successful Deployment

**Introduction**

As mentioned in the course introduction, a G Suite deployment for larger organizations is typically managed over three phases. Let’s take a look at these phases and optimum timelines. It is said that there are typically three ‘Go-Lives’ in a G Suite deployment:

- Core IT
- Early Adopters, and
- Global Go-Live

While deployments typically run for between 90 and 120 days in large enterprises, it’s useful to think of it as a three month effort. This can be quite helpful in laying out the deployment lifecycle plan for people working in the organization. The diagram below shows the three stages and key objectives of each.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/timeline.jpg)

Note that larger organizations will need the deployment to be phased out over a longer timescale, whilst other smaller organizations may move more swiftly.

Follow the guidelines here and the resources linked to from this course and you will achieve a successful deployment for your organization.

**Core IT**

In the Core IT phase, you’re working with a small group of IT professionals within the organization, upto 25 individuals, and piloting the deployment with them. This phase doesn’t create any change or disruption to the existing IT systems operating there. The successful provisioning for this group is critical in order to be able to proceed to the next phase. It provides an excellent opportunity to identify forthcoming challenges and issues and resolve them at this early stage.

**Early Adopters**

In the Early Adopters phase, you build on what you have achieved with the Core IT phase. Essentially this is a full deployment, but rolled out to between 5% and 10% of the staff compliment. Now, the G Suite deployment is more visible and you can use this phase to step up the technical rollout and especially the Change Management elements.

This phase should not be viewed as a technical rehearsal. It is rather a rehearsal for the organization. It is a Change Management milestone, where user acceptance is built. During this phase you will also enable Google Guides in your organization. These mentors will play a critical role in communicating acceptance and enthusiasm for new ways of working that are facilitated by the technology, G Suite.

**Global Go-Live**

There should be no surprises in the Global Go-Live phase. It’s primarily concerned with bringing the rest of the organization onto the G Suite system, thus embedding the Go-Live processes into the business. Pro-active communications and easy-to-find support are essential at this phase. During this phase, you will engage the Google Guides to support the workforce during this larger company Go-live.

As with any IT implementation, fast access to training is essential as there’s a critical window to achieve global user acceptance. Many IT projects fail because people were not adequately supported to use them. There are other reasons of course, but it’s seldom because of a fault in the technology.

As Google itself points out, the technology associated with G Suite works, and we know this because it’s working all over the world. Your job is to support your business in deploying G Suite and, most importantly, the processes it makes possible.



## Provisioning


### Introduction to Provisioning

**Introduction**

In this lesson we'll be looking at provisioning in G Suite. In particular, we'll be looking at domain management and how to provision company resources using Google Cloud Directory Sync (GCDS). We'll also look at Google's provisioning best practices.

Provisioning is where everything starts in G Suite. As the technical project lead, you’ll guide Galaxy Sola through the steps to provision important resources, such as registering the primary domain with G Suite and adding company resources like users, groups, calendar resources, and shared contacts.

In this lesson, you'll will learn:

- How to connect your domains to G Suite services
- How to provision your organization's resources in G Suite



### Domains

**Introduction**

In this lesson, we will cover what you will need to know when you deploy G Suite in your organization. You will learn more about domain management in a later course.

**What you need to know**

Like most companies that have an internet presence, Galaxy Sola uses a Domain registrar (hosting service) that stores Domain Name System (DNS) records for their domain(s). These records are used to connect Galaxy Sola to online services like email or websites. 

To sign up and manage Galaxy Sola for G Suite services, you’ll need to know how to:

- Manage domains using the DNS registrar and the G Suite admin console
- Modify DNS records to activate G Suite services for your own domains

**Domain management basics**

Before an organization can use G Suite services, it must have a verified domain.

A **domain** is an easy-to-remember name that is associated with a range of physical IP addresses on the internet. It’s also the unique name that appears after the @ sign in an internet email address or after "www." in common URLs. A domain name is also typically used to identify the company.

A **subdomain** is part of a larger domain. They provide easy-to-remember addresses for web pages or services within their top-level domain. In G Suite, subdomains can be used as a secondary domain or a domain alias. Examples of google.com subdomains are mail.google.com, www.google.com and docs.google.com. Examples of galaxysola.com subdomains might be mail.galaxysola.com and calendar.galaxysola.com.

A **domain registrar** is a company that sells domain names that aren't yet owned and are therefore available to purchase. They typically provide a console from where organizations manage the domain and associated DNS records.

**Common DNS terminology**

When deploying G Suite, you might need to change your domain's DNS records and settings. The table below shows the more common DNS records that require updating as part of a G Suite deployment. For example:

| Record type                    | Usage                                                        |
| :----------------------------- | :----------------------------------------------------------- |
| Mail Exchange (MX) records     | MX records direct a domain's email to the servers that host the domain's user accounts. These records will require updating when you want to start to route all email traffic through Google’s servers. |
| Text (TXT) records             | TXT records hold descriptive text that can be queried by internet servers. For example, you will add a TXT record as part of the domain verification process. |
| Canonical Name (CNAME) records | CNAME records identify resources belonging to a domain, such as www, ftp, mail, and calendar. |

**Deployment scenario**

You are meeting with Tunji, the head of IT, to build a deployment strategy for provisioning your users and company resources.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-1.jpg)

**Domains in G Suite**

G Suite supports multiple domains. There must be a single primary domain but we can also add domain aliases and additional domains as needed. The key thing to remember is that all domains we add to G Suite must be owned by Galaxy Sola, and we must demonstrate that by verifying ownership in the G Suite admin console. 

G Suite supports the following domain types:

Primary Domain

- Just one per G Suite account and is used to register companies with G Suite

Domain Alias

- Adding a domain alias adds an email address alias to every user in the primary domain. For example we could make the primary domain galaxysola.com and add an alias of galaxysola.net. This would allow all of our users to send and receive email using a .com and .net address. There’s no additional costs associated with domain aliases

Additional Domain (Secondary Domain or non-Primary Domain)

- Additional domains are often used when an organization is made up of multiple businesses. Each domain has its own set of users and each user gets a G Suite account, email address, and mailbox for their domain. For example we could choose to break galaxysola.com into separate country level domains: galaxysola.co.uk, galaxysola.com.au, etc.

**Verifying domain ownership**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-2.jpg)

**Help Center resources**

- [What is a domain?](https://support.google.com/a/answer/177483?hl=en)
- [Domain name basics](https://support.google.com/a/answer/2573637)
- [Add multiple domains or domain aliases](https://support.google.com/a/answer/7502379)
- [Add or Change Domains](https://support.google.com/a/answer/6051629)
- [Limitations with multiple domains](https://support.google.com/a/answer/182081)
- [DNS records](https://support.google.com/a/topic/2716885)
- [Verify domain ownership](https://support.google.com/a/topic/9196)



### Users and Other Company Resources

**Introduction**

Provisioning was covered in more detail in a previous course. In this lesson, we will cover what you will need to know when you deploy G Suite in your organization.

**What you need to know**

As a technical project lead, you need to ask:

- Which users do we have in the current platform?
- Which users are moving to G Suite?

You should also be thinking about:

- The need for ongoing directory synchronization
- Other company resources such as groups and calendar resources

**Deployment scenario**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/_provisioning-discuss-3.jpg)

**User provisioning**

There are several ways to provision users in G Suite. The admin console allows users to be added individually or in bulk. 

Alternatively, users can be provisioned with Google Cloud Directory Sync (GCDS). GCDS is useful for organizations like ours that need ongoing synchronization of G Suite with a local directory. GCDS supports any LDAP compliant directory such as AD.

GCDS can synchronize a variety of different object types, including users, groups, and shared contacts from AD to Google. It’s a one way synchronization process that ensures that our Google domain data mirrors our local directory. AD is never modified so cannot be compromised.

It’s particularly useful for onboarding and offboarding users.

GCDS is also efficient as it runs a delta update, only looking for changes that have been made since the last synchronization cycle.

GCDS also includes extensive tests and simulations to ensure correct synchronization.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-4.jpg)

In essence:

1. We install GCDS on a local server, configure it to connect to our local directory and authorize it to connect to our G Suite account
2. Periodically data is extracted as a list from AD. We create the rules in advance that specify precisely how this list is generated
3. GCDS connects to G Suite and generates a corresponding list of objects that we want to synchronize
4. GCDS compares the lists and updates the Google domain to match AD data



![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/gcds.png)

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-5.jpg)

In AD passwords are stored as write-only. They can't be read through any interface, such as LDAP. Therefore, conventional synchronization methods such as GCDS can't access them. The only way to read passwords is to capture them when they are set or changed.

Google has another tool, G Suite Password Sync (GSPS) for this purpose. It’s implemented by installing it onto our domain controllers. Then, whenever a user changes their AD password, GSPS immediately pushes the new password to their managed Google account.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-6.jpg)

**Provisioning groups**

In G Suite, there are three different types of groups:

- Admin Managed Groups

These are groups that are created and managed only by G Suite administrators (also called Distribution Lists) in the admin console. These can be synced from AD to Google using GCDS

- Google Groups for Business (also known as User Managed Groups)

These are groups created and managed by both G Suite administrators and users. These are not synced using GCDS

- Personal Groups (now known as Labels)

These are groups that are created and managed by individual users. Think of these as personal email contact groups. Personal groups are not synced using GCDS but Google does provide a number of options to migrate these groups to G Suite

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-7.jpg)

**Provisioning shared contacts**

GCDS can synchronize our external contacts (people we deal with on a regular basis who are listed in AD but are not employees of Galaxy Sola). In G Suite, these are known as shared contacts. It would be a good idea to keep these contacts synchronized.

**Provisioning organizational units and calendar resources**

GCDS can also synchronize our organizational structure (OUs), and calendar resources, but this is not recommended. 

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-8.jpg)

**Organizational Units (OUs)**

In AD, an OU is a container for users, groups and computers. It represents the lowest level to which an administrator can assign group policies and account permissions. The AD structure frequently mimics the company's internal hierarchy; locations, departments, etc.

In G Suite, OUs are used to manage service settings for different parts of the organization. For example, an administrator can enable/disable G Suite services at the OU level. Mobile device management, compliance rules, retention and security policies are just some of the other settings that can be applied to a G Suite OU.

Generally a G Suite structure will not reflect the AD hierarchy so I would not recommend OU synchronization. Instead, we should take time to consider the appropriate G Suite OU hierarchy for optimal management.

**Calendar resources**

Calendar resource definitions are different in AD and G Suite. Google resources have a structured format that includes information about the resource location, capacity, or equipment. Google Calendar uses this data to give more room and resource details, which helps users choose the best resource for their needs.

G Suite also allows us to define buildings to which resources can be assigned. Rather than use GCDS, my recommendation is that we take this opportunity to add the extra metadata that Google supports and create our buildings and resources directly in the admin console. We can do this manually or through a bulk upload.

In addition, as we will be booking resources in Google Calendar only after we fully deploy G Suite, the AD resources will become redundant so there is no need for us to synchronize them with GCDS.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-9.jpg)

**Conflict accounts**

Google has a tool in the admin console that can help us identify any users who have an account that uses their Galaxy Sola email address. 

If conflict accounts are found, we can invite the user to transfer the account to Galaxy Sola. Alternatively, we can ask them to rename their personal account to a non-conflicting address so we can provision them in the managed Galaxy Sola G Suite account.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-10.jpg)

**Help Center resources**

- [About Google Cloud Directory Sync](https://support.google.com/a/answer/106368)
- [About G Suite Password Sync](https://support.google.com/a/answer/2611859?hl=en)
- [Add users with existing Google Accounts](https://support.google.com/a/topic/7042002)



### Provisioning Strategy

------

**Developing a provisioning strategy**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-11.jpg)

**Core IT**

Users

- Typically we would add our Core IT users to G Suite manually. We could do this one by one or upload them in bulk as a CSV file import

Shared Contacts

- Google does not recommend provisioning shared contacts at this time. These addresses may not appear in the GAL but Core IT users can still send emails to them

Groups

- We should not provision groups at this time but we need to ensure that our existing distribution lists can receive email from G Suite users. This may require that we enable inbound internet email for our legacy groups

Calendar Resources

- We should not provision any resources at this time. Core IT users should be using Google Calendar as their primary calendar, but they should be asked to book resources in the legacy platform

**Early Adopters**

Users

- At this stage we would provision **ALL** remaining users including users who are in the Global Go-Live phase. We would use GCDS for this purpose and it can also start to synchronize directories from this point. At the same time we should also [add business information](https://support.google.com/a/answer/6191788) to each user’s profile, and place each user into the correct OU in G Suite. The OU defines how mail is delivered during deployment and which services are available to each user

Shared Contacts

- We could wait until the Global Go-Live but as we are already using GCDS at this point, now is also a good time to synchronize our external contacts

Groups

- Provision via GCDS

Calendar Resources

- As for the Core IT phase, we ask G Suite users to continue to book rooms and resources in the legacy platform. If there are resources that are only bookable by Early Adopters, these can be provisioned (using Google’s recommended format) in G Suite and removed from the legacy platform at this time

**Global Go-Live**

Users

- At this point all users have already been provisioned. We will need to switch these users to an OU that ensures continued mail delivery in G Suite and all the services that they require are enabled

Shared Contacts

- Already being provisioned and synchronized using GCDS

Groups

- Already being provisioned and synchronized using GCDS

Calendar Resources

- Provision in G Suite ensuring we apply Google’s recommended structured format

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/provisioning-discuss-12.jpg)

**Help Center resources**

- [Domain Shared Contacts API](https://developers.google.com/admin-sdk/domain-shared-contacts)
- [Group Settings API](https://developers.google.com/admin-sdk/groups-settings/v1/reference/groups)
- [Directory API](https://developers.google.com/admin-sdk/directory/v1/guides/manage-groups)



## Mail Routing

### Introduction to Mail Routing

------

**Introduction**

In this lesson we'll be looking at how to manage mail routing during each phase of a G Suite deployment, how to build a strategy for routing mail from legacy platforms to G Suite, and the best practices for configuring the mail delivery in G Suite.

Mail routing is important because, as the technical project lead, you’ll need to be able to describe to your executive how mail gets delivered to your users at each phase of the G Suite deployment. Note also that mail may be routed differently during the Core IT, Early Adopters, or Global Go-Live phases.

In this section, you'll learn:

- How mail routing occurs
- How to build a mail-routing strategy
- The best practices for configuring mail delivery in G Suite

We’ll also look at some typical mail routing and coexistence scenarios while using best practices to resolve them.



### Mail Delivery during a G Suite Deployment

------

**What you need to know**

As the technical project lead you need to be aware of how messages reach each user’s inbox at each phase of deployment. This includes: 

- Knowing where the MX records are pointing and when to change them
- Explaining how mail is being routed. In particular, you should be able to diagram the mail flow from the current legacy platform to G Suite for each transition phase and Go-Live

**Mail delivery overview**

You manage how your mail is delivered. For example, you may want one of the following scenarios:

- Mail is delivered to your legacy platform, and a subset of your users receives mail in Gmail
- Some users receive mail in Gmail inboxes, and others access mail from your local server
- All users use Gmail exclusively, but messages for unknown users are routed to a special mailbox or to an external server

**Deployment scenario**

You are meeting with Tunji, to discuss a deployment strategy for routing mail from Galaxy Sola’s existing platform to G Suite.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-1.jpg)

**Mail delivery types**

Direct delivery

Here, mail messages are **delivered directly** to the user’s mail platform. This could be the existing legacy platform or G Suite. 

Dual delivery

Incoming messages are first **delivered to the legacy platform**. Copies of these messages are then forwarded by the legacy platform to the user’s Gmail inboxes.

**Note:** It’s also possible to configure dual delivery where Gmail is the primary server, but for our purposes we will assume that messages will be delivered to the legacy platform first.

Split delivery

Incoming messages are **delivered to G Suite and then routed** to either a Gmail inbox or a legacy platform inbox, depending on the user.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-2.jpg)

**Intradomain flow during a G Suite deployment**

The behavior of on-premises servers (e.g. Microsoft Exchange) is called intradomain flow. This is where messages are exchanged between users in the same domain. 

As these messages do not leave the internal network at any time, messages sent from users who are on the legacy platform to users who have moved to G Suite may be kept on the legacy platform and not reach the intended recipients' Gmail inboxes.

This can be addressed by creating a forwarding rule for each user who has moved to G Suite. Intradomain messages are forwarded to a domain alias (or shadow domain, e.g. apps.galaxysola.com) in G Suite. MX records for the shadow domain are configured to point to G Suite.

For example, mail for "*Tom@galaxysola.com*" will be forwarded to "*Tom@apps.galaxysola.com*"

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-3.jpg)

**How does each mail delivery type work?**

Direct delivery

Before we start the deployment, Galaxy Sola’s MX records are pointing to our existing mail platform, where all the users receive their mail.

By the Global Go-Live, MX records are changed to G Suite, where all users will migrate and receive their mail.

Both of these are examples of direct delivery. These are natural states prior to and after the G Suite deployment. Apart from switching the MX records in our DNS registrar's console, no specific configuration is necessary.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/before-after-direct-delivery.png)

Dual delivery

Galaxy Sola’s MX records are pointing to the legacy mail server, so all messages are delivered here first. 

For each user who has migrated to G Suite, we configure a forwarding rule from the legacy platform to their G Suite account using a domain alias whose MX records are pointing to G Suite.

For example, Arthur's mail is forwarded to G Suite, while Carol's is not.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/dual-delivery-schematic1.png)

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-4.jpg)

Step 1: Set up a domain alias

Dual delivery is used during the Core IT phase to forward messages from our existing mail system to the G Suite users at apps.galaxysola.com. This is also needed during the Early Adopters phase as we move those users over to G Suite. 

We start by adding the domain alias apps.galaxysola.com to the G Suite admin console. We do that from the Domains page. Once added we verify it using the TXT record that is created for us by G Suite. As we discussed earlier we will need to login to our DNS registrar’s console and add the new record. We must also ensure that the MX records for the alias are pointing to the Google servers.

Step 2: Configure an inbound gateway

As we deploy more users, we want to ensure that messages that are forwarded from our current mail server are not classified by Google as spam. To do this, we configure the Inbound Gateway setting in G Suite with the IP addresses of our existing mail server.

Step 3: Create forwarding rules

For each user who is switching to G Suite in the Core IT and Early Adopters phases we must also add a forwarding rule that sends any messages received in their current mailbox to their G Suite mailbox.

During Core IT when our MX records are pointing to our existing mail server, all Core IT mail is first routed to here and then forwarded out to G Suite. At the Early Adopters stage we switch our MX records to Google but we must retain the forwarding rules so our G Suite users can continue to receive intradomain mail.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-5.jpg)

Split delivery

We configure split delivery in G Suite during the Early Adopters phase. This is when the MX records have been changed to point to G Suite, so all mail messages are now being routed to G Suite.

Users who have switched to G Suite receive their messages directly in their Gmail inboxes. 

For users who have not yet switched, G Suite routes their messages back to our existing mail server. 

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/split-delivery-schematic1.png)

Split delivery is configured to route messages back to the legacy platform based on the Organizational Unit and default routing policy for users still on the legacy platform. Configuring split delivery in the G Suite admin console is done as follows:

Step 1: Create an Organizational Unit (OU) for all legacy mail users

Add a new OU called “Legacy Users” OU to the G Suite admin console and ensure the remaining legacy platform users (our Global-Go Live users) are in that OU.

As we will provision user’s with GCDS we can place the Global Go-Live users into this OU at the point of provisioning by mapping a custom AD attribute to the OU in G Suite.

Step 2: Create a routing policy

We now add an OU routing policy for the "Legacy users" OU. This is done by:

1. Adding a “Routing setting” or “Route” for the legacy mail server to the G Suite console. This route contains the IP address or hostname of our existing mail server. 
2. Once we have defined the route, we apply the route to the Legacy Users OU. 

Once the route is applied to the Legacy Users OU, all mail messages sent to users not yet migrated to G Suite are sent to the legacy mail platform instead for delivery.

Step 3: Set up a default routing policy

Finally we configure the default routing policy to the legacy platform. This reroutes the mail back to the legacy mail platform as a catch-all for any address (user, group or alias) that is not on G Suite yet.

Strictly speaking, a default route is not necessary to implement a split delivery architecture, however it is recommended as it ensures no messages are lost. For example, in the event that we fail to provision everyone in G Suite correctly.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-6.jpg)

*Help Center resources**

- [Google IP address ranges for outbound SMTP](https://support.google.com/a/answer/60764)
- [Set up email routing](https://support.google.com/a/topic/2921034)
- [Set up an inbound mail gateway](https://support.google.com/a/answer/60730)
- [Configure Default routing](https://support.google.com/a/answer/2368153)



### Mail Routing Strategy

------

**Developing a mail routing strategy**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-7.jpg)

**Before starting deployment**

- This is where we are today. Direct delivery is implemented for all of our users on the legacy platform, where the MX records are pointing

**Core IT**

- MX records remain pointing at the legacy mail server. Users not part of the Core IT group continue to receive mail delivered direct to their inbox as they do today

- Dual delivery is used to forward mail to Core IT users with a domain alias. MX records for the domain alias will point to G Suite

- We will also configure the inbound mail gateway for G Suite so that Google doesn’t classify messages forwarded from our existing platform as spam

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/core-it-mail-routing.jpg)

**AV** = Antivirus, **DLP** = Data Loss Prevention

**Early Adopters**

- MX records for the primary domain are changed to point to G Suite

- Split delivery is implemented at this stage. Mail received by Google destined for users who remain in the legacy platform is routed back to the legacy mail server for delivery. Dual delivery remains in place for users who have moved to G Suite to ensure intradomain mail is received

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/ggl-mail-routing.jpg)

**AV** = Antivirus, **DLP** = Data Loss Prevention

**Global Go Live**

- MX records are already pointing to G Suite

- All users are now on G Suite and receive mail directly

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/mail-routing-discuss-8.jpg)







## Data Migration



### Introduction to Data Migration

**Introduction**

 In this lesson we'll look at data migration and the methodologies used during a phased deployment. We also consider best practices.

Data migration is a major concern for customers because they need to account for different users and what data they’ll need when switching over to Google.

In this section, you'll learn:

- How data migration happens during a G Suite deployment
- What should the data migration strategy be for each phase of the deployment



### Data Migration during a G Suite Deployment

**What you need to know**

The technical project lead needs to be aware of many factors as they develop a migration plan. Questions that need to be answered include:

Whose data are we migrating? 

- Data usage and migration requirements can vary depending upon the user

What kind of data are we migrating? 

- There may be different requirements for mail, calendar, contacts, etc

How are we going to migrate the data?

- Choosing server-side versus client-side and developing a data migration strategy 
- Investigate data migration tools like G Suite Migration for Microsoft Exchange, Outlook or IBM Notes, the admin console's Data Migration Service, and third-party tools

When are we going to migrate the data?

- Do we migrate just enough for the Go-Live and do the bulk historical mail after the Go-Live.
- How do we handle the fact that calendar events and contacts can be changed in the legacy system

**Deployment scenario**

You are meeting with Tunji to help answer questions around data migration. Tunji, wants to know more about migrating data to G Suite.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-1.jpg)

**Server-side versus client-side**

With data migration, choosing between a server-side or client-side approach determines which tools we will use, who runs the migration, and how data is actually migrated to G Suite. This will depend on factors such as who owns the migration and where the data to be migrated resides in the existing environment.

Server-side migration

- Migrations are managed by IT administrators. There is little or no end-user effort required and migrations happen behind the scenes
- Server-side migrations are preferred if data being migrated is already server-based, or migrations need to be centrally controlled
- Considerations: This approach typically requires the deployment of additional servers to host and run the migration software; however this approach offers more control and reporting over client-side migrations

Client-side migration

- Users install and run the migration software locally
- Client-side migrations are useful if the data is stored locally (ex: local PST files), and where centrally managing migrations isn't important
- Considerations: We may need to stagger migrations so that our networks are protected from performance issues. Also, we will need to train and support our users in the migration process? This approach is more difficult to manage and monitor than a server-side solution

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-2.jpg)

**How much data do you migrate for the Go-Live phase?**

There are three options available to us.

Migrate nothing

We might choose to migrate nothing. In this case the user’s inboxes will only contain new messages after they switch to G Suite. Old messages would need to be accessed from the legacy mail platform but we could make that read only as we wouldn’t want users to continue to send mail from our current system.

In many ways, this is the best option as time is not spent on setting up data migration. Instead we can focus on other deployment efforts. However, this does put an additional burden on our users as they will need to switch between two systems for some time going forward.

Minimal migration

Here we decide how much data we migrate for different sets of users. For example, we might choose to migrate 90 days of historical email along with full calendar and contacts migration for most users. Then for our executive and other selected users we might perform a full mail, calendar and contacts migration.

We should look at our different user profiles and agree what should be migrated for each of them.

The benefit of this approach is time. Full migrations take time and resources. We migrate only what users need for the Go-Live and if required we can come back and migrate older mail later.

Complete migration 

We could choose to migrate everything for everyone. This is not ideal however because too much time spent on data migration can extend the project. 

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-3.jpg)

**Migration tools**

G Suite Migration for Microsoft Exchange (GSMME)

GSMME is a server-side tool that migrates email, calendar, and contact data from Exchange.

The GSMME tool runs on its own machine and connects to the Exchange server. Then it migrates data over to our G Suite domain for the list of users we specify.

We can increase the amount of data migrated by running multiple machines simultaneously.

GSMME can also migrate PST files for us as needed. Instead of pointing the tool to Exchange, we point to a folder structure instead. This could be useful if we choose to migrate PST archives after the Go-Live.

The migration sequence of events are shown here:

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/gsmme-process-flow.jpg)

1. We create a .CSV file containing the email addresses of users to be migrated.
2. GSMME connects to the Exchange server (or other data source) to retrieve user data.
3. Data is sent to GSMME for processing.
4. GSMME converts the data to the format specified by the Google API’s.
5. Data is inserted over Https into the user’s G Suite account.

The diagram below shows how GSSME is typically configured.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/gsmme-architecture.jpg)

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-4.jpg)

**Migration best practices**

1. Colocate migration servers with mail servers for best performance
2. Avoid migrating via a proxy server or firewall. These will impact performance and in some cases migrations can fail
3. Always run a set of test migrations to help estimate actual migration times
4. Scale the number of migration servers to meet the migration estimates
5. Monitor migrations so any failures can be addressed early
6. Migrate archives after the Go-Live not as part of the deployment project
7. Migrate calendars and contacts just before the user's switch to G Suite
8. Locate your migration servers close to the internet connection

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-5.jpg)

**Help Center resources**

The links below include links to Google’s other migration tools.

- [G Suite Migration for Microsoft Exchange](https://support.google.com/a/answer/2790331)
- [G Suite Migration for Microsoft Outlook](https://support.google.com/a/answer/176213)
- [G Suite Migration for IBM Notes](https://support.google.com/a/answer/154630)
- [About the data migration service](https://support.google.com/a/answer/6003169?hl=en)
- [About G Suite Migrate](https://support.google.com/gsuitemigrate/answer/9222862) (Beta)

The [G Suite Marketplace](https://gsuite.google.com/u/0/marketplace/search/migration?hl=en&pann=adm) offers third-party tools to run migration, or you build your own migration tools using Google's [Gmail API](https://developers.google.com/gmail/api/).



### Data Migration Strategy

**Developing a data migration strategy**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-6.jpg)

**Before starting deployment**

- Here we will need to make the decisions around what to migrate for our users. We might choose 90 days of email plus all calendar and contacts for the majority of users and all mail, calendar and contacts for a smaller set of users
- Now is also a good time to start thinking about setting up a migration server so we can run some tests. This not only allows us to estimate migration times but it will also allow us to prove connectivity between our network and G Suite

**Core IT**

- Partial migration of mail
- Full migration of calendar and contacts for these users

**Early Adopters**

- Partial mail data migration
- Full migration of calendar and contacts data
- Start to run some more extensive test migrations in readiness for the Global Go-Live

**Global Go-Live**

- Partial/Full mail data migration depending upon user type
- Full migration of calendar and contacts data

**Post Go-Live**

- Continue migration of historical mail data

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/data-migration-discuss-7.jpg)



## Coexistence



### Introduction to Coexistence

**Introduction**

In this lesson we'll be looking at how to manage G Suite alongside your legacy platform during the G Suite deployment, and the best practices for handling coexistence.

In this section, you'll learn:

- How legacy platforms coexist with G Suite
- What coexistence strategies should be used during each phase of deployment



### Types of Coexistence

**What you need to know**

Coexistence refers to the situation where we have both G Suite and the legacy platform(s) in place at the same time. As Galaxy Sola is a large deployment and will be moving users to G Suite over a number of months in a phased deployment, users will need to coexist on both platforms. As the technical project lead, you need to understand:

- The different types of coexistence
- The options available to mitigate coexistence issues
- Best practices from Google on managing coexistence

**Deployment scenario**

You are meeting with Tunji, to help him understand the challenges users will face during the deployment when some users have moved to G Suite, whilst others remain on the legacy platform.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-1.jpg)

**Types of coexistence**

Short term coexistence

In a small deployment, coexistence timeframes can be very short, but larger deployments like ours can take months to complete, and coexistence across multiple services is sadly unavoidable. 

Even so, with our 90 day plan, this is still considered a short term coexistence period.

Long term coexistence

Google does provide tools to address some coexistence issues such as sharing free/busy information across multiple platforms. However, they do not actually recommend the use of these tools as they can extend the project timelines and any long term coexistence does not offer the best user experience.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-2.jpg)





### Managing Calendar Coexistence

**Managing calendars during deployment**

Tunji wants to know more about how to manage calendars during deployment.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-3.jpg)

Having some users schedule meetings in Google Calendar while others schedule meetings in the legacy platform's calendar presents several coexistence challenges. Here are some examples:

- How does a user on one platform check the availability (free/busy status) of a user on the other platform? 

- How should resources be maintained across both platforms?
- How can a user on one platform view the attendee status of a user on the other platform?

Google provides services and tools that allow users deploying from common legacy platforms to share free/busy information with each other. However, these may not address all coexistence challenges for all organizations.

**The recommended approach for the free/busy challenge**

Using Google's services and tools should be avoided.

- Smaller organizations may be content to live with the lack of free/busy sharing for a short period while they deploy their users to G Suite
- Users who have switched to G Suite already can continue to switch back to the legacy calendar system to check the availability of other users
- Larger organizations may choose to migrate users based on free/busy needs. For example, they may choose to migrate users by location where everyone in one building shares the same resources.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-4.jpg)

The tools are highly complex and time-consuming to configure. We would need to account for planning, installation and testing in our deployment plan even though these tools will only be used for a very short period of time and be discarded at the Global Go-Live. 

We should weigh up the costs in time and effort over the actual benefits offered to our users.

They only solve some of the problems with interoperability between legacy calendar platforms and G Suite. There’s no seamless solution available.

And there is a tendency to become reliant on them. This can extend the project which we should avoid as these tools were never designed for long term coexistence.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-5.jpg)

**Solving calendar resource issues during coexistence**

G Suite uses calendar resources to manage rooms and other reservable equipment. During coexistence, double booking can occur if resources are bookable in both platforms. We want to avoid the potential for double booking. There are a couple of approaches we might consider:

Option #1: Book all calendar resources in the legacy system

We could instruct all users to continue reserving resources in the legacy system. This makes it easier to manage because all resources remain in one place. This should be quite acceptable for our Core IT users.

Option #2: Move over selected calendar resources for our Early Adopters

Our Early Adopters can also continue to book resources in the legacy platform. However, if we can identify resources that are only bookable by our Early Adopters, we can add them to G Suite and prevent bookings from being made in the legacy calendar system.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-6.jpg)

**Watchpoints**

Primary calendars

Users provisioned in G Suite that have not yet started to use G Suite (e.g: Global Go-Live users that are provisioned in G Suite at the Early Adopters phase) should be placed in an OU with the Calendar service disabled. If these users are in an OU with Calendar enabled, the following issues may occur:

- User's on the legacy platform may receive reminders from Google Calendar
- If a legacy user disables notifications in Google Calendar, they will not receive invitations to new meetings sent by other Google users
- The time zone of the calendar in the invite may also be incorrect

Only once a user is migrated to G Suite should they be switched to an OU with Calendar enabled.

Inviting groups to calendar events during deployment

Legacy users who invite distribution lists should expand their lists in order to invite all appropriate users in G Suite. If they do not, the calendar invites will not be forwarded to the users who have migrated to G Suite, such as the Early Adopters.

Updates to an event

When a Google Calendar event owner changes an event, they have the option to send the update via email to all attendees. If all attendees are on G Suite, this is optional as Google Calendar will ensure the event is updated for everyone. However, if any attendee remains on the legacy system the Google organizer must ensure the updates are sent otherwise the attendee will not see the change made on their calendar.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-7.jpg)

**Help Center resources**

- [About Calendar Interop](https://support.google.com/a/answer/7444958)
- [Use IBM Notes with Google Calendar](https://support.google.com/a/topic/7188639)
- [About Google Calendar Resource Sync](https://support.google.com/a/answer/7189010)





### Groups and Shared Contacts

**Managing groups and shared contacts during deployment**

Tunji now wants to understand more about how to manage groups and shared contacts during deployment.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-8.jpg)

**Directory lookup for groups and shared contacts**

During deployment, not all addresses will appear in G Suite’s auto-complete feature and global directory look-up. These are typically groups and users who are external to the organization that is deploying G Suite.

To resolve this, external contacts can be added to the Global Address List (GAL) using G Suite Shared Contacts tools. We have a number of options available:

We could use GCDS for this purpose. Alternatively, there are a number of third party applications in the G Suite Marketplace, or we could even develop our own tool using Google’s Shared Contacts API (this is the same API that is used by GCDS and other tools).

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-9.jpg)

**Best practices for managing groups and shared contacts during deployment**

With coexistence, we will need to manage our groups and external contacts living on both the legacy platform and G Suite.

Groups

During the Core IT phase, we just need to ensure the groups on our existing platform can receive email from the internet. 

We could add our groups as shared contacts in G Suite so the addresses appear in the GAL but we would need to come back and delete these later - so my recommendation would be to avoid that approach.

Once we enter the Early Adopters phase we should add the groups to G Suite using GCDS.

Shared contacts

Shared contacts can be added to G Suite at any phase of the deployment but it makes sense to use GCDS so we should do that when deploying the tool at the Early Adopters phase. 

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-10.jpg)





### Coexistence Strategy

**Developing a coexistence strategy**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-11.jpg)

**Before starting deployment**

- Identify which users must move together to G Suite
- Decide whether free/busy status should be shared between Google Calendar and the legacy system
- Plan for deployment accordingly

**Core IT**

- Users: Provision Core IT users only
- Shared Contacts: Do not provision external contacts at this time
- Groups: Ensure legacy groups can receive email from G Suite
- Calendar resources: Instruct users to continue to book resources in the legacy system

**Early Adopters**

- Users: Provision ALL users; ensure Global-Go-Live users are in the correct OU
- Shared contacts: Provision external contacts as Shared Contacts
- Calendar resources: Continue to book resources in the legacy system or provision only resources that are managed entirely by Early Adopters; those resources must be removed from the legacy platform
- Conduct training on coexistence

**Global Go-Live**

- Calendar Resources: Provision the remaining resources in G Suite
- Conduct user training

**After deployment**

- Focus on user adoption, training and business transformation.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/coexistence-discuss-12.jpg)





## Change Management

### Introduction to Change Management

**Introduction**

So far we have talked about the technical aspects of a G Suite deployment. Sometimes forgotten are other streams that are critical to the success of the project, specifically the People and Process workstreams. 

A core discipline in these workstreams is Change Management. This is the process of preparing, supporting and leading people, teams and organizations through the change process.

It is important to bring people with you throughout the project: ensuring you have the ‘buy-in’ of the right people, and making sure that everyone who is impacted by the technology change understands the impacts it will have on them and their job.

Whilst this may not be directly your responsibility, you still have an important role to play in this area.

An IT project is also a great opportunity to examine how things are done today, and identify ways in which the new technology can deliver a better way of working.

The goal of this lesson is to introduce you, as the person responsible for the technical aspects of the project to the value and importance of Change Management in the project. For example, consider how the user works today, and any obvious changes that will come with the transition to G Suite, such as implementing 2-Step verification on sign-in, or collaborating on documents in the cloud.

In this lesson, you will learn:

- How different types of people resist and react to change
- The value of Change Management and the role of the change manager
- Why projects can fail



### Natural Resistence to Change

**Introduction**

In general people do not like change. Only a small percentage of people will welcome change. The rest will need help.

It is possible to profile a population in terms of its openness to change. Research on this was done in the 1960’s led by American Professor of Communications Studies Everett Rogers. It is from his work we get the common usage phrase Early Adopter.

Rogers proposed that for any change to embed it needs widespread adoption from the population. Eventually acceptance of the change reaches critical mass and it becomes self-sustaining.

He divided people into five groups and described their traits:

- **Innovators** - people who are highly willing to take risks
- **Early Adopters** - people who have a modest openness to risk, and they take considered choices in relation to innovation and change. They tend to be opinion formers in an organization
- **Early Majority** - people will adjust to a change after a moderate time has elapsed and they have had time to evaluate both the change and the reaction of opinion formers to it
- **Late Majority** - people who look at change sceptically, but are open to influence by the opinions and reactions of their peers
- **Laggards** - people who are resistant to change. They like things exactly as they are

Organizations are made up of people, so you will find these groups in any project you implement.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/resistencep-to-change.jpg)

Innovators and Early Adopters will adopt your change independently but these make up only ~15% of the community. The rest will need help.

In his book Crossing the Chasm, 1991, Geoffrey Moore argues that there is a chasm between the Innovators and Early Adopters and the rest of the population which is difficult for the rest to cross.

That is where the **Change Manager** comes in.

**The Change Curve**

When we are confronted by change we tend to react in a common way, represented by the Change Curve. People react to change in predictable ways. Projects do too.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/change-curve.jpg)

The Change Curve is based on research by Elisabeth Kübler-Ross in the 1960s on the stages of grief. It was recognized that her research was relevant to the workplace and it is commonly applied in organizational change. 

1. The first reaction to change is **Shock**. Despite all the evidence to the contrary, we tend to expect things to stay the same.
2. Next, we **Deny**. This cannot be happening. Why do we have to change? What was wrong with how we did things before?
3. Then we become **Angry and Frustrated**. It is common to look for someone or something to blame: ‘nobody told me about this’, ‘they’re always changing things around here’.
4. When it becomes obvious that the change cannot be resisted, morale is at its lowest. Performance drops and people fixate on small things that annoy them.
5. Eventually we **Accept** that the change is inevitable and we begin to **Experiment** with the new situation.
6. Finally the change is **Integrated** into our working lives and performance improves.

A well-managed Change process flattens the peaks of **Denial** and **Depression**, and shortens the timeline to **Integration**.





### The Value of Change Management

**Introduction**

Many companies still see Change Management as an optional part of a deployment. This is not so, and the research bears it out. Large scale transformation only happens with wide ranging changes and processes.

In the [Raconteur Report](https://raconteur.uberflip.com/i/670675-google-change-managment/0?m4=), leaders were asked to rate their companies’ attitude to change and they were also asked to rate how effective they felt their most recent Change Management program had been, as either:

- Excellent and sophisticated
- Adequate but simple
- Poor or none

The results are summarized below.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/roi.jpg)

The data shows that on average companies that innovate using a Change Management process report a 120% return on investment. This rises to 135% where leaders rate their change management program as excellent and sophisticated. In particular companies with a long culture of adopting change management do better.

This report was commissioned by Google. There are many other reference sources on the value of change management.

According to a 2014 by Prosci, projects with excellent change management in place are six times more likely to achieve their goals. *(Best Practices in Change Management, Prosci, 2014, cited in the Raconteur report.)*





### Why Projects Fail

**Introduction**

What about when things go wrong? Here, we explore some of the reasons why projects can fail. If you can avoid making these mistakes, you are on the road to a successful project.

**Failure reason #1: Incorrectly thinking that it’s all about the technology!**

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/fail-1.jpg)

It is critical to get the technology right, but technical staff often allow it to blind them to the other factors that can make-or-break the solution's implementation. If, for example, the data does not migrate correctly or completely, if the layers of security are making things more complicated rather than less so, or if the move to Google Sheets leaves important macros behind then this is a project that is going to fail.

On the client side, if the project lead has built their career on highly technical projects then it is not surprising if they see a G Suite deployment as a technology project. In fact they may not have a work transformation objective at all, and be limited in their project scope to one of successfully rolling out the tools.

If the project is going to change the way people work by making them more collaborative then you will absolutely have to address the behavioral, culture and structural aspects. The more **successful projects dedicate more than 60% of project time on these People and Process streams**. You cannot make work transformation happen with just a technology replacement.

**Failure reason #2: Lack of senior executive support**

Senior leadership buy-in is the key indicator of successful work transformation. 

Transformation rarely succeeds without the support and drive from the senior team. If you want to embed change you need their support.

Respondents told Raconteur that while people are key to the whole transformation process, executives and senior leaders have the biggest impact throughout a change management process. They perform a number of valuable roles:

- Acquire people
- Source budget
- Create executive alignment: Execs have their own agendas and it is the role of your sponsors to gain everyone’s support
- Create common messaging. When the senior team speaks with one voice it creates a strong sense of direction for everyone
- Remove blockers. Every project will come up against challenges. A strong project sponsor will clear these
- Act as the face of change: Leading by example, through using the tools and behaving collaboratively, will be a powerful incentive for everyone else to do the same

**Failure reason #3: Lack of local champions - Google Guides**

In the Raconteur research it was shown that giving between 5 and 10% the role of champions who move to Google as Early Adopters and provide peer-to-peer support during deployment and beyond is an important technique for embedding change. 

Google Guides can reassure people on the ground that the change is not as daunting as it might seem and that it is going to stick.

**Failure reason #4: Assumption that everything will work out**

Just as there are a group of people who as Early Adopters can support the change, there will be others who resist the change.

We saw earlier that people are resistant to change. This is natural, they are invested in the way they have done things before and not yet committed to the change that is coming. We also learned that there is a spectrum in how people react to change.

Expecting resistance and managing it is part of the change management process.

**Failure reason #5: Thinking that the transformation roadmap follows the migration roadmap!**

It is a mistake to think that the path that users will take to change their habits and ways of working will be the same as the migration path.

Migration can be done overnight; Transformation takes time.

Building a migration roadmap is about managing constraints whereas building a transformation roadmap is about managing opportunities.





### The Change Manager

**Introduction**

Now we know what Change Management is, why it is important, and where projects go wrong, let's look at what the Change Manager actually does.

It’s important to understand that Change Manager is a role not a job title. You may not have people in your organization with the job title 'Change Manager' but you most definitely have people with that role.

You may also find that although there is no one with the job title of 'Change Manager' that there is a change team in the project, made up of people with different roles.

**People workstream**

The People workstream is about all the activities that are necessary to bring everyone on the journey with you. These are activities such as engaging stakeholders, conducting ongoing training and communications, and promoting successes in the organization.

The Change Manager is involved throughout the entire project cycle and beyond. From the pre-sales phase where:

- Stakeholders are engaged
- The project is scoped
- The support model is defined
- Communication and training models are defined:
- Communication involves making sure employees understand the motivation for adopting G Suite and how it will affect their day-to-day jobs. Also included are internal marketing and project communications to keep employees enthusiastic about and invested in the transformation.
- Training is crucial to ensuring that knowledge, skills, and behaviours are documented. Training may be delivered in the form of documentation, classroom training, video conference, or other methods.

In the deployment phase, the Change Manager continues to play an important role as they:

- Execute on the support model, training and communication plans

Post deployment, the Change Manager can look to ongoing work transformation. They can establish a dedicated Google team that provides ongoing support and training. They also look at adoption progress for G Suite, promote success stories and support users through self-help.

Your roles align

At the same time as you are planning the technical deployment and analyzing technical infrastructure the Change Manager is analyzing the organization and engaging sponsors to promote the project internally.

They will also be planning communications and training for the roll out.

The Change Manager is also looking for business processes that can be improved as a result of the change to more collaborative working.

During the actual deployment, while you are at your most busy going through the three phases of Core IT, Early Adopters, and full Go Live, the Change Manager is deeply focused on business impacts, looking for business processes that can be improved, and concentrating on sponsors, Google Guides, and planning around Go Live activities.

This is your busiest time yet it is important to provide support to the Change Managers during the three phase roll outs.

**Process workstream**

The Process stream is about providing a structure for the organization to engage with innovation and change.

For a successful transformation of how work gets done the Change Manager looks for business processes that can be improved with increased collaboration and G Suite and then redesigns those processes with the appropriate training and communications.

Process stream activities tend to lead the technology implementation. There is no point starting to consider process change once the technology has been embedded and people have begun to solidify their work processes once more.

In our three phase roll out model, the Early Adopters phase is the best moment to involve Google Guides in identifying processes that might benefit from the new collaborative approach.

Transformation Lab

The Transformation Lab is the core tool for helping organizations re-evaluate the way they work. These labs involve brainstorming existing business processes, prioritizing to find the ones that can be most improved, and building prototype solutions using G Suite. The magic here is that the business users will see first hand the benefit of collaboration by building the solution in teams during the lab.

As the technical project lead and G Suite Administrator, you too can add real value here:

- You have formed strong working relationships with people and teams and may have spotted opportunities for business process transformations.
- The labs process is a great opportunity to share this knowledge and insights with the change team.
- Think long-term: the project is not over once G Suite is live. Help your users transition to long-term business process transformation
- Identify and share process opportunities as/if they arise 
- Support transformation labs by helping to build more complex prototypes 
- Provide technical expertise to help build out G Suite solutions 
- Seek out or support other long-term technical service opportunities for your organization

The labs are also important across the entire project lifecycle:

- The earlier stages are a critical time for documenting ways in which users are currently using email, calendar and productivity tools, process issues or needs, high impacted users
- Now is also the time to begin preparing logistics 
- During the deployment: Hold a lab with Google Guides, continue gathering use cases and prototypes, and socialize the prototypes or identified solutions
- Post deployment: Continue to hold labs, gather use cases and really drive home success stories. Celebrate those who are making a difference with the tools

 Another way of thinking about it is as a pyramid.

![img](/home/sherwinowen/Videos/gcp/gsuite_administration/images/process-pyramid.jpg)

At its base are **simple organization processes** that can be changed with minimal effort. Typically this will happen within teams, where everyone is brought into the change, and the Change Manager does not have to win the support of other stakeholders.

Once the deployment team is skilled at the process it can look upwards at **cross functional processes** which may involve other teams, departments and locations. This adds a degree of complexity, in terms of the number of stakeholders and implications and risks in implementing any change. Typically you will be looking for easier to implement high business value changes here.

Only once this process has become second nature to the business should the team attempt high value high risk projects such as **advanced workflows** or new **business models**.





## Recap

**Congratulations** on successfully completing the Planning for your G Suite Deployment course. Let's summarize what you have learned.

**What have you learned**

As you embark upon your transition to G Suite, you should now understand the basic concepts that underpin Google's three phased deployment methodology. You should be able to apply the recommendations and best practices learned here to your own particular organizational needs.

In the **Provisioning** lesson, you looked at:

- Using DNS records to verify domain ownership
- Different types of domains supported by G Suite
- Synchronizing your local directory and provisioning objects in G Suite using GCDS
- Developing a strategy for provisioning company resources at each phase of deployment

You then went onto look at **Mail Routing** where you learned about:

- The different types of mail delivery methods used during each phase of G Suite deployment.
- How to configure mail settings in G Suite and your legacy platform for mail delivery.

In **Data Migration**, we discussed:

- The differences between server-side or client-side migrations
- The use of GSMME tool as a solution for Galaxy Sola
- How much data to migrate and how to develop a migration strategy during deployment

and in the **Coexistence** lesson, you learned about:

- Coexistence types
- The challenges facing users during a deployment and in particular around calendar coexistence

Finally you were introduced to the importance of **Change Management** for your deployment. You discovered that:

- People have a natural resistance to change. Less than 20% of people in a typical organization will adapt to change easily
- You must not think about a G Suite deployment solely as a technical project. You must also consider the people and the processes to ensure its success
- Change management is not an optional part of the project. It is integral to the success of the project