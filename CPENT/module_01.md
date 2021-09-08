[TOC]



# CPENT (Certified Penetration Testing Professional)



# Module 01 Introduction to Penetration Testing and Methodologies

## What is Penetration Testing?

1. Penetration testing is a type of security testing that evaluates an o**rganization’s ability** to protect its
   infrastructure such as network, applications, systems, and users against external as well as internal threats.

2. It is an effective way of determining the efficacy of the organization’s security policies, controls, and
   technologies.

3. It involves the active evaluation of the security of the organization’s infrastructure by **simulating an attack** similar to those performed by real attackers.

4. During a penetration test, security measures are actively analyzed for **design weaknesses, technical flaws**, and **vulnerabilities**.

5. The test results are documented and delivered in a **comprehensive report** to executive management and technical audiences.

## Benefits of Conducting a Penetration Test

1. Proactively **identifies threats** and determines the **probability of an attack** on information assets
2. Assures the organization that it is operating within an **acceptable limi**t of information security risks
3. Helps in determining the feasibility of a set of attack vectors and **potential business impact** of a successful attack
4. Provides a comprehensive approach for preparation steps that can be taken to **prevent an upcoming exploitation**
5. Ensures the effective implementation of security controls and a better **return on investment** (ROI)
   on IT security
6. Achieves **compliance** with regulations and industry standards (ISO/IEC 27001:2013, PCI-DSS, HIPPA, FISMA, etc.)
7. Focuses on high-severity vulnerabilities and emphasizes **application-level security issues** for development teams and management
8. Evaluates the efficiency of **network security devices** such as firewalls, routers, and web servers

## Penetration Testing Service Delivery Models: Conventional vs. Next Generation

### In-house Penetration Testing

- Organizations havea dedicated penetration testing team in place.
- This team is continuously engaged in in-house pen testing assignments.

### Outsourced Penetration Testing Service

- Theseare the “at a point in time” penetration testing services provided by third-party penetration testing consultancies.
- Organizations outsource their penetration testing assignments to these third-party penetration testing
  consultancies to evaluate the security of their organization.

### Penetration Testing as a Service (PTaaS)

- It is a cloud service that provides penetration testing along with the resources needed to conduct at-a-point-in-time and continuous penetration tests.

### Crowdsourced Penetration Testing Services

- Itis an open-ended pen testing assignment in which pen testers worldwide attempt to determine the
  vulnerabilities in a target environment.



## ROI for Penetration Testing

1. Penetration testing helps companies in identifying, understanding, and addressing any vulnerabilities;
   this saves them a lot of money, resulting in a good ROI.
2. Demonstration of ROI is a critical process for the successful “sale” of a pen test.
3. ROI for a pen test is demonstrated with the help of a business case scenario, which includes the
   expenditure and involved profits.
4. Companies spend resources on a pen test only if they have proper knowledge of its benefits.

**ROI = (Expected Returns - Cost of Investment)/Cost of Investment**



## Comparison of Security Audit, Vulnerability Assessment, and Penetration Testing

**Security Audit**

- A security audit checks whether an organization follows  set of standard **security policies and procedures**.

**Vulnerability Assessment**

- A vulnerability assessment focuses on **discovering the vulnerabilities in an information system** but provides no indication of whether the vulnerabilities can be exploited or of the amount of damage that
  may result from the successful exploitation of the vulnerabilities.

**Penetration Testing**

- Penetration testing is a methodological approach to security assessment that **encompasses a security audit** and vulnerability assessment, and it and demonstrates whether the vulnerabilitiesin a system can be successfully exploited by attackers.




1. Penetration Testing should not be simply ticking check boxes to meet security requirements.
2. Vulnerability scanning should be part of pen testing program but is not a substitute.
3. Penetration testing focuses on achieving goals not finding vulnerabilities.



## Types of Penetration Assessment: Goal-oriented vs. Compliance-oriented vs. Red-team-oriented

### Goal-oriented/Objective-oriented Penetration Testing

- This type of assessments is driven by goals. The objectives of the penetration test are defined, rather than defining the scope of target
- The goal of penetration assessment is defined before it begins.
- The job of the pen tester to check whether he/she can achieve the goal and to determine the different ways to achieve the goal.

**Examples**

- Gain remote access to an internal network

- Gain access to credit-card information
- Gain domain administrator access
- Create a denial of service (DoS) condition againsta website
- Deface a website



### Compliance-oriented Penetration Testing

- This type of assessments is driven by compliance requirements. It is testing against adherence to compliance requirements. It entails conducting an assessment against compliance requirements of cyber security standards, frameworks, laws, acts, etc.
- For example, an organization may ask to perform a security assessment against PCI-DSS requirements.



### Red-team-based Penetration Testing

- Red-team-based penetration testing is an adversarial goal-based assessment in which he pen tester must mimic the behavior of a real attacker and target the environment.
- This type of assessment has no specific driver.
- For example, an organization may ask to conduct a security assessment for evaluating
  its overall security. It may include assessing people, networks, applications, physical
  security, etc.

## 3 Types of Penetration Testing

### 1. Black-box Penetration Testing

- Black-box testing assumes that the pen tester has no previous knowledge of the infrastructure to be tested.
- The tester has limited information about the target company.
- The penetration test must be conducted after extensive information gathering and research.
- This test simulates the process of real hacking and gathers publicly available information
  such as domain and IP addresses.
- A considerable amount of time allocated for the project is spent on discovering the nature
  of the infrastructure and how it connects and interrelates.
- It is time-consuming and expensive.

#### Black-box testing is further classified as follows:

##### Blind Testing

- Simulates the methodologies of a real hacker
- Limited or no information provided to the penetration testing team
- Time consuming and expensive process

##### Double-blind Testing

- Few people in the organization aware of the penetration testing being conducted
- Involves testing an organization's security monitoring, incident identification, and response procedures

### 2. White-box Penetration Testing

- The tester is given complete information on the infrastructure to be tested.
- This test simulates the process of a company’s employees.
- It helps in revealing bugs and vulnerabilities more quickly.
- It provides assurance on complete testing coverage as the tester knows what exactly to test.

#### White-box testing is further classified as follows:

##### Announced Testing

- Attempts to compromise systems on a client network with the full cooperation and knowledge of IT staff personnel
- Examines the existing security infrastructure for possible vulnerabilities
- Involves the client organization’s security staff and the penetration testing team

##### Unannounced Testing

- Attempts to compromise systems on the client network without the knowledge of the IT security
  of IT staff personnel
- Only the upper management is aware of these tests
- Examines the security infrastructure and responsiveness of IT staff

The following are some of the information that could be provided through this type of test:

- Company infrastructure
- Network type
- Current security implementations
- IP Address/Firewall/IDS/IPS details
- Company policies do's and dont's

### 3. Gray-box Penetration Testing

- This test is a combination of black-box and white-box penetration testing

- In gray-box test, the tester usualy has limited information

- Security assessment and testing are internally performed

- It tests applications for all vulnerabilites that a hacker might find and exploit

- It performed mostly when a penetration tester starts a black-box test on well protected systems and finds that a little prior knowledge is required to conduct a thorough review.

## The following are some of the factors that affect the cost of a penetration test:

### 1. Complexity

The most important factor is the company’s infrastructure; the cost depends on the size of the environment and number of network devices involved. More complex environments need more work for the tester to find every possible vulnerability.


### 2. Methodology

Penetration testers use different methodologies to test a network. Some use their own test, while others may use expensive tools, which can increase the cost. However, it is a good idea to use expensive tools because they reduce the time to test and may produce higher-quality results as compared to custom tests.

### 3. Experience

The cost depends on the experience of the tester. Because there may be fake penetration testers working at low cost, it is advisable to choose a tester with a certification such as Global Information Assurance Certification (GIAC), Certified Ethical Hacker (CEH), Certified Information Systems Security Professional (CISSP), or Offensive Security Certified Professional (OSCP).

### 4. Onsite

In some cases, penetration testing can be performed offsite; however, if the environment
is very complex, an onsite visit is required for testing. For social engineering and physical
security, an onsite visit is mandatory.



## Selection of Appropriate Testing Type

- The specific type of test should be selected based on the demand, goal, time, and resources available.
- A black-box test is performed toward comprising the security of an organization by mimicking the actions of a real-world attacker.
- However, white-box or gray-box testing can be useful when considering their advantages in terms of the time and resources available to the tester.
- Careful test planning and understanding of testing constraints are required when limited time and resources are available for conducting the test.



## Methods of Penetration Testing

### Automated Penetration Testing

- is performed with the help of various commercial or open-source penetration testing/security assessment tools.

### Manual Penetration Testing

- is performed by an individuals who are experts in penetration testing

#### Types of manual penetration testing

##### Focused

- This type is used to test only specific vulnerabilities and risks. The test is performed only by human experts whow examine specific applications within the given domain.

##### Comprehensive

- In this type, all systems that are connected to a shared network are tested to identify a wide range of risks and vulnerabilities.

####  Steps involved in manual penetration testing

##### 1. Data collection

Data can be collected either manually or by using tools freely available online. Information that can be gathered with the help of tools include database versions, software, table names, hardware, and third-party plugins.

##### 2. Vulnerability assessment

After gathering the information, the tester identifies weakness and accordingly takes preventive steps.

##### 3. Actual exploit

Now, the tester launches an attack on the target system. This is a very difficult step that requires an expert tester to execute. 

##### 5. Report preparation

Finally, the tester prepares a final report that describes the overall pros and cons of the system. The report is analyzed to take corrective steps to secure the target system.

## Common Areas of Penetration Testing

### 1. Network Penetration Testing

- Helps identify security issues in network design and implementation
- Common network security issues:
  - Use of insecure protocols
  - Unused open ports and services
  - Unpatched operating system (OS) and software
  - Misconfiguration in firewalls, intrusion detection system (IDS), servers, workstations, network services, etc.

### 2. Web Application Penetration Testing

- Helps detect security issues in web applications due to insecure design and development practices
- Common web application security issues:
  - Injection vulnerabilities
  - Broken authentication and authorization
  - Broken session management
  - Weak cryptography
  - Improper error handling

### 3. Social Engineering Penetration Testing

- Helps identify employees who do not properly authenticate, follow, validate, and handle processes and technology
- Common behavioral issues in employees that can pose serious security risks to the organization:
  - Clicking on malicious emails
  - Becoming a victim of phishing emails and phone calls
  - Revealing sensitive information to strangers
  - Allowing unauthorized entry to strangers
  - Connecting a USB device to workstations

#### Following are some effective social engineering techniques:

##### Phishing

The tester simply sends an email that tricks users into clicking on something. The tester records that activity or installs a program. For a successful phishing campaign, the tester must remember to check grammar and spelling and try to make the mail appear genuine, believable, and short. The best tool for phishing attacks is the open-source Social-Engineer Toolkit (SET).

##### Pretexting

In this technique, the hacker calls the target person and asks for information while pretending to be an authentic user that needs assistance. By performing this technique, the penetration tester can target nontechnical users who may disclose sensitive data.

##### Media dropping

This technique involves the dropping of a USB flash drive near a parking lot or entrance area where people can easily see it. This drive contains some interesting music or movie files that the victim can easily download; when it is opened, however, it launches a client-side attack. To implement such a technique in penetration testing, the tester must develop custom attacks and programs in a USB drive or purchase USB
drives that are prebuilt for this purpose.

##### Tailgating 

In this technique, an unauthorized person can enter the company’s premises by fooling the staff or simply walking in. To prove the success of this test, the tester must obtain sensitive data or install a device quickly; they can even take photographs of exposed files or documents left on desks or printers.

### 4. Wireless Network Penetration Testing

- Helps identify misconfigurations in wireless network infrastructure
- Common security issues in wireless network infrastructure:
  - Unauthorized/rogue/open access points
  - Insecure wireless encryption standards
  - Weak encryption passphrases
  - Unsupported wireless technology

### 5. Mobile Device Penetration Testing

- Helps detect security issues associated with mobile devices and their use
- Common security issues with mobile devices:
  - No implementation or improper implementation of the bring your own device
    (BYOD) policy
  - Use of unauthorized mobile devices 
  - Use of rooted or jailbroken mobile devices
  - Weak security implementation on mobile devices
  - Connection with insecure Wi-Fi networks

### 6. Cloud Penetration Testing

- Helps identify security issues in cloud infrastructure
- In addition to conventional security issues, cloud services have the following cloud-specific security issues
  - Insufficient protection to data at rest
  - Network connectivity and bandwidth problems as per minimum requirement
  - Poor user access management
  - Insecure interfaces and application programming interfaces (APIs)
  - No privacy for users’ actions in the cloud
  - Security threats from inside the organization

## Penetration Testing Process

### 1. Defining the Scope

- Extent of testing
- What will be tested
- Where testing will be performed from
- Who will perform testing

### 2. Performing the Penetration Test

- Involves gathering all information significant to security vulnerabilities
- Involves testing the targeted environment such as network configuration, topology, hardware, and software

### 3. Reporting and Delivering Results

-  Listing vulnerabilities
-  Categorizing risks as high, medium, or low
-  Recommending repairs if vulnerabilities are found

## Penetration Testing Phases

### 1. Pre-Attack Phase

- Research (Information Gathering)

**Activities:**

- Active Reconnaissance
  - port scanning, service scanning, OS scanning
- Passive Reconnaissance
  - retrieving network registration information from whois databases, social engineering

### 2. Attack Phase

- Testing/Explotation

**Activities:**

- Perimeter testing: measures the firewall's ability to handle fragmentation. It proviides an understanding of how internet connected networks are vulnerable to hacking.
- Web application testing: It provides a security assessment of various kinds of applications.
- Wireless testing: Wireless testing activity involves checking all wireless routers, access points, and gateways for vulnerabilities.
- Application security assessment: Application security assessment has a methodology similar to that of external penetration testing,
- Network security assessment: Network security assessment identifies risks and vulnerabilities that may harm network and security policies. It also provides information needed to make network security decisions.
- Wireless/remote access security assessment: Wireless/remote access security assessment identifies the security risks of wireless devices. Some of the wireless technologies with security risks are 802.11 wireless networking, broadband Internet access, and so on. Hence, precautions must be taken so that the architecture, design, and deployment of such solutions are secure.
- Database penetration testing: Database penetration testing identifies security issues in databases. The database penetration tester tests the database layer by layer and documents the security weaknesses in every layer. As the database is the most critical asset of an organization, each component is valuable for the success of the entire system. This type of penetration test is conducted to find security breaches in the whole system and to assist in the implementation of the required safeguards.
- File integrity checking: File integrity checking focuses on the size, version, and ‘modifications in files. It checks the login details of the users who modify existing files. Further, it adopts integrity checking techniques.
- Log management penetration testing: Log management penetration testing focuses fon the security issues in log files. Organizations use log data for strengthening information security with the help of advanced audits and data correlation. It is also used for troubleshooting and meeting compliance initiatives. This type of penetration test scans for log files and checks whether the logs are encrypted,
- Telephony security assessment: Telephony security assessment checks the security Issues of voice technologies used in organizations. In telephony security assessment, penetration testers exploit private branch exchanges (PBXs) to check mailbox deployment and security, routing of calls at the target’s expense, unauthorized modem use, voice over IP integration, and associated risks.
- Data leakage penetration testing: Data leakage is one of the most debilitating problems that occur within an organization. An organization needs to perform data leakage penetration testing to protect its confidential data from malicious users.
- Social engineering: Social engineering is an intrusion process associated with human interactions and deception that involves the breach of simple and basic security procedures. This process exploits the weaknesses and amicability of people. The eavesdropping technique plays a vital role in the process of social engineering.
  

### 3. Post-Attack Phase

- Documentation and Reporting

**Activities**

- Reversing all file and setting manipulations performed during the test
- Reversing all changes to privileges and user settings
- Mapping of the network state
- Documenting and capturing all logs registered during the test

## Penetration Testing Methodologies

### Proprietary methodologies

There are many organizations that work on penetration testing and offer services and
certifications. Network security organizations have their own methodologies that are to
be kept confidential. The following are some proprietary methodologies:

- **EC-Council’s Licensed Penetration Tester (LPT)**

- **IBM**

- **ISS**

- **McAfee Foundstone**

### Open-source and public methodologies

A wide range of methodologies are publicly available. They can be used by anybody and
are intended for public use only.

- **Open Source Security Testing Methodology Manual**

The Open Source Security Testing Methodology Manual was compiled by Pete Herzog. It is a standard set for penetration testing to achieve security metrics. It is considered the de-facto highest level of testing, and it ensures high consistency and remarkable accuracy.

- **Information Systems Security Assessment Framework**

The Information Systems Security Assessment Framework evaluates an organization’s information security processes and policies.

- **National Institute of Standards and Technology**

The National Institute of Standards and Technology (NIST) is a federal technology agency that works with the industry to develop and apply technology, measurements, and standards.

- **Open Web Application Security Project**

The Open Web Application Security Project is an open-source methodology. It provides a set of tools and a knowledge base, which help in protecting web applications and services. It is beneficial for system architects, vendors, developers, security professionals, and consumers who might work on designing, developing, deploying, and testing the security of web services and web applications.

- **CREST**

CREST is the not-for-profit accreditation and certification body representing the   technical information security industry. CREST provides internationally recognized accreditation for organizations and individuals providing penetration testing, cyber incident response and threat intelligence services.

## EC-Council's LPT Methodology

1. Information Gathering
2. Scanning and Reconnaissance
3. Fingerprinting and Enumeration
4. Vulnerability Assesment
5. Exploit Research and Verification
6. Reporting

## When Should Pen Testing Be Performed?

Penetration testing must be performed on a regular basis to ensure that all existing and newly discovered vulnerabilities are identified and fixed before a cybercriminal exploits them. In recent times, many new attacks have been reported, which indicates that even hackers are attempting new methodologies and techniques. An organization must be prepared with solutions for any new kind of attack. However, most companies neglect the possibility of such a situation and wait too long to conduct penetration testing; they conduct tests either when it is required by law or, in the worst case, only when a company has already been breached.

The question of when pen testing should be performed is difficult to answer because the answer depends on the company. For instance, high-profile companies that are often mentioned in the media are the most prone to attacks. Such companies must regularly perform penetration testing.

###  The following are some scenarios where penetration testing is required:

-  Changes have been made in the organization’s infrastructure.
-  Anew threat to the organization’s infrastructure has been discovered.
-  Hardware or software has been updated or reinstalled.
-  The organization’s policy has changed.
   

## Ethics of a Penetration Tester

Every penetration tester must have ethics that help them avoid illegal activities and serve their
clients in a better way. Most organizations make the tester sign an agreement to clarify the
current laws and protect their clients. The laws can differ from country to country. Therefore, it
is very important for a penetration tester to be aware of the current laws and legal agreement
with an organization, and the tester must be highly ethical and fully professional at all times.

**The following are some of the ethical requirements of a penetration tester:**

- Perform penetration testing with the express written permission of the client. 
- Work according to the nondisclosure and liability clauses of a contract.
- Test tools in an isolated laboratory prior to an actual penetration test.
- Inform the client about any possible risks that might emanate from the tests.
- Notify the client at the first discovery of any highly vulnerable flaws.
- Deliver social engineering tests results only in a summarized and statistical format.
- Try to maintain a degree of separation between the criminal hacker and the security
  professional.

## Qualification, Experience, Certifications, and Skills Required for a Pen Tester

The quality of penetration testing depends on the tester’s qualifications. Penetration testing skills
cannot be obtained without years of experience in IT fields such as development, systems
administration, or consultancy. A pen tester should possess security certifications such as CEH,
CPENT, CISSP, and CISA.

**Qualification**
The professional penetration tester must possess the following qualifications:

- Certified Register of Ethical Security Testers (CREST)

- Cyber-security certifications (CHECK, CTM, CTL, CREST, TIGER, OSCP)

- A degree in computer security, computer science, or equivalent

- Recognized security testing certifications (GIAC and CEH)

Experience

- The professional pen tester must have sound knowledge and experience in handling
  various penetration test tools including open and commercial mapping.
- They must possess experience in systems, networks, and web-based applications.
- It is desirable to have experience in using problem-solving techniques and developing
  a solution to meet vulnerability threats.
- They must possess good communication skills to explain technical details to
  nontechnical parties.
- They must be proficient at report writing and scripting skills and have good experience
  at reverse engineering.
- Consulting experience is an added advantage because they must understand the
  client's needs and build a positive relationship with them,

**Certifications**

- CEH: Certified Ethical Hacker

- CPENT: Certified Penetration Testing Professional

  CEPT: Certified Expert Penetration Tester

  GPEN: GIAC Certified Penetration Tester

  OSCP: Offensive Security Certified Professional

  CCISSP: Certified Information Systems Security Professional

  GCIH: GIAC Certified Incident Handler

  GCFE: GIAC Certified Forensic Examiner

  GCFA: GIAC Certified Forensic Analyst

  CCFE: Certified Computer Forensics Examiner

  CREA: Certified Reverse Engineering Analyst

  PTC: Certified Penetration Testing Consultant 

  CPTE: Certified Penetration Testing Engineer

  CompTIA: Security+

  CSTA: Certified Security Testing Associate

  Required skills sets of a penetration tester

  A professional penetration tester should possess the following skill sets:

  Strong knowledge of current and emerging technology, methodologies, and tools in the security industry

  Familiarity with network security concepts, software architecture and design, and engineering processes

  Knowledge of hardware concepts such as the following:

  Networking: Transmission Control Protocol/internet Protocol (TCP/IP) concepts
  and cabling techniques

  Ethical hacking techniques: exploits, hacking tools, and so on.

  Open-source technologies: MySQL and Apache

  Wireless protocols and devices: 802.11x and Bluetooth

  Troubleshooting skills

  Routers, firewalls, and IDS

  Databases: Oracle and MSSQL

  OS skills: Windows, Linux, Mainframe, and Mac

  Web application architecture and Hypertext Transfer Protocol (HTTP) request and response concepts

  Web servers, mail servers, Simple Network Management Protocol (SNMP) stations, and access devices