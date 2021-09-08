[TOC]



# Module 4 Social Engineering Penetration Testing

## Social Engineering Penetration Testing: An Overview

- Social engineering is the art of **manipulating people to divulge sensitive information** with the objective of performing a malicious action.

- The objective of performing social engineering penetration testing is to t**est the strengths and weaknesses of human factors** in a security chain within the organization.
- Social engineering pen test is often used to **raise the level of security awareness among employees** by allowing them to experience a real attack, without having an actual breach.
- The tester **should demonstrate extreme care and professionalism** when conducting the social
  engineering pen test, as it might involve legal issues such as violation of privacy and may create embarrassing situations for the organization.
  

## Skills Required to Perform Social Engineering Pen Test

Social engineering penetration tests require tricking target employees into disclosing sensitive private or professional data, corrupting their computers with malware, or enticing them to click links to malicious sites. Therefore, pen testers should possess the following skills to persuade or elicit the targets into performing favorable actions.

- **Good communication skills**: To perform social engineering, penetration testers must have good verbal and nonverbal communication skills. These skills will help them confidently present themselves as vendors or customers and manipulate targets to reveal private information. Good verbal skills will help in direct or mobile conversations, while nonverbal skills will make it easy to create efficient phishing emails.
- **Creativity**: Being creative helps testers think of fake events, scenarios, and messages based on the interests of the targets to provoke them into revealing information. Pen testers use the social media activities of victims to determine their interests, after which they use their creativity to build scenarios based on these results. In addition, creativity helps in devising and implementing strategies that testers can use to take advantage of new technologies and situations within an organization.
- **Good interpersonal skills**: Interpersonal skills include skills such as_ listening, questioning, and understanding the body language of a person. These skills help testers build rapport with the victims, gain their trust, and request them to provide the required data.
- **Talkative and friendly nature**: Having an extroverted and outgoing personality may help the pen tester, as the victim may be more willing to converse and reveal sensitive information.
  

## Black-Box or White-Box Testing?

We now discuss two techniques of social engineering penetration testing, namely, black-box or white-box testing. These techniques differ in terms of the information disclosed by the
organization to the tester.

### White-box social engineering penetration testing

In white-box social engineering penetration testing or clear-box testing, the organization provides testers with the information of target employees. The provided information includes names, phone numbers, email addresses, and location of the target. In some cases, the organization may also define specific social engineering methods that the tester needs to implement.

**Advantages:**

- The clients can decide the target and the information they need to test.

- It helps in detecting insider threats quickly.

- Testing consumes less time, as the client provides most of the information about the target and the organization’s security structure.

**Disadvantages:**

- The scope of testing is limited to the assigned targets only.

- This method may not cover physical means of accessing information.

### Black-box social engineering penetration testing:

In black-box social engineering penetration testing, also called a trial-and-error approach, the client does not provide any information about the target to the tester.


The tester must employ open-source intelligence techniques to gather information about the targets. This technique is the same as real-world social engineering attack situations. This type of testing is time-consuming, as the tester needs to collect information about the employees, systems, and security, and implement customized techniques based on the target.

**Advantages:**

- This method mimics real-life attack situations.
- Testers can decide the type and methods of the attack.

**Disadvantages:**

- This type of testing is difficult to design due to the wide range of targets.
- Gathering information is time-consuming.
  

## Social Engineering Penetration Testing Modes

When considering security, users are believed to be the weakest link; however, many organizations allow users to have more than the necessary privileges to perform their jobs. Social engineering pen testing allows the pen tester to test such types of users and identify those who are susceptible to social engineering tactics.

Social engineering pen testing involves two different modes, namely off-site testing and on-site testing:

### Off-site testing

Off-site testing involves testing employees’ security awareness during their daily activities. To perform off-site social engineering pen testing, first, the tester needs to gather publicly available information about the organization through passive reconnaissance techniques. The tester can obtain important information from the company’s website, search engines, social networking sites, the company’s annual
reports, etc.

Techniques used in off-site social engineering include the following:

#### Phishing

Phishing is a technique in which the pen tester sends an email or provides a link that falsely claims to be from a legitimate site in an attempt to acquire a user’s personal or account information. When the user clicks on the email link, it redirects them to a fake webpage, where they are lured into sharing sensitive details such as address and credit card information without knowing that they are on a phishing site.


#### Vishing

Vishing (voice phishing or Voice over IP (VoIP) phishing) is an impersonation technique in which the pen tester uses VoIP technology to trick individuals into revealing their critical financial and personal information. In this technique, pen testers call employees, pretending to be a customer or vendor who needs assistance and requests them for information. Pen testers generally choose nontechnical employees and request them to provide basic information regarding the organization. The testers can also use real names of vendors or customers associated with the organization to convince the employees. After gaining their trust, pen testers try to gather sensitive information.

#### SMiShing

In SMiShing (SMS Phishing), the SMS text messaging system is used to lure users into instant action such as downloading malware, visiting a malicious webpage, or calling a fraudulent phone number. SMiShing messages are crafted to provoke an instant action from the victim, requiring them to divulge their personal information and account details.

### On-site testing

On-site testing involves testing the physical security of an organization and the security policies in place. To perform on-site social engineering pen testing, the pen tester disguises themselves as an authorized person to enter the target premises.

Techniques used in on-site social engineering include the following:

#### Piggybacking

Piggybacking usually implies entry into the building or security area with the consent of an authorized person who is not aware of the pen tester’s identity. For example, pen testers request an authorized person to unlock a security door, saying that they have forgotten their ID badge. In the interest of common courtesy, the authorized person might allow the pen tester to pass through the door.

#### Tailgating

Tailgating implies access to a building or secured area without the consent of an authorized person. It refers to the act of following an authorized person through a secure entrance, exploiting the fact that a polite user opens and holds the door for those following them. In this technique, a pen tester wears a fake badge/ID and attempts to enter the secured area by closely following an authorized person
through a door requiring key access.

#### Eavesdropping

Eavesdropping refers to an unauthorized person listening to a conversation or reading others’ messages. It includes interception of any form of communication, including audio, video, or written communication, using channels such as telephone lines, email, and instant messaging. The pen tester can obtain sensitive information such as passwords, business plans, phone numbers, and addresses.


#### Shoulder surfing

Shoulder surfing is the technique of observing or looking over someone's shoulder as they key in information into a device. The pen tester can use shoulder surfing to find out passwords, personal identification numbers (PINs), account numbers, and other information.

#### Baiting

Baiting is a technique in which pen testers tempt the target user with something alluring in exchange for important information such as login details and other sensitive data. In this technique, pen testers leave a physical device such as a USB flash drive containing malicious files in locations where people can easily find them including parking lots, elevators, and bathrooms. This physical device is labeled with a legitimate company logo relevant to the target user, which is used to trick them into finding and open such devices on their systems. Once the device is connected and opened by the victim, a malicious file gets downloaded and the system becomes infected, which allows pen testers to take control over the victim's system.

#### Reverse social engineering

In reverse social engineering, the pen tester assumes the role of a person in authority so that employees ask them for information. The pen tester manipulates the questions that employees ask in a manner than the employees themselves give up the required information.

#### Dumpster diving

Dumpster diving is the process of retrieving sensitive personal or organizational information by searching through trash bins. The pen tester can extract confidential data such as user IDs, passwords, policy numbers, network diagrams, account numbers, bank statements, salary data, source code, sales forecasts, access codes, phone lists, credit card numbers, calendars, and organizational charts on paper or disk

#### Elicitation

Elicitation is the technique of extracting information from the victim by drawing them into normal and disarming conversations. To elicit information, the pen tester needs to initiate a casual conversation with the target user to extract information without making them realize that they are being socially engineered

#### Motivation techniques

The pen tester can use motivation techniques such as authority, intimidation, consensus/social proof, scarcity, and urgency, in order to make the victims reveal sensitive information about the organization.

Note: Eavesdropping can be used for both on-site and off-site testing.

## Social Engineering Penetration Testing Process

**Do Remember: Before Social Engineering Pen Test**

- Penetration testers must be aware of the local laws, as some of their actions may infringe on lberty, resulting in potential legal action.
- Be aware of social engineering pretext agreed to in the Rules of Engagement (ROE).



To perform social engineering penetration testing, the pen tester needs to follow the below-mentioned four well-defined steps.

### 1. Test Planning and Scoping

- The pen tester needs to conduct a meeting between the management of the client organization and the pen testing team to define the scope of pen testing and decide how to perform it.
- The scoping document must contain all the techniques and methods to be used in the pen test.
- Test planning and scoping help you create a clear contract that is agreed upon and signed by all parties involved before the pen testing is undertaken.
  

### 2. Target Identification

- Based on the scoping document and pen testing contract, you need to identify the victim.
- Choose victims or groups of victims who can be easily tricked.

#### Common Targets of Social Engineering Pen Test 

- Users/Clients
- Receptionists/Help-desk personnel
- Vendors of the organization
- Technical support executives
- System administrators 
- Disgruntled/Mistreated Employees
- Employees who are less aware
- Recently fired employees
  

 #### Gather Information About the Targets

- Search for names, phone numbers, designation, and other details of employees on the company’s website
- Search through online platforms, phone, and email.
- Search using social networking sites.
- Search on job sites such as Linkedin and Glassdoor.

### 3.  Penetration Testing Attempt

#### Using email attack vector

Some of the common techniques for performing social engineering pen testing through email
are listed below:

- Identifying a list of users who use a common password for different online accounts
- Sending some information (sweepstakes) related to lottery or gifts to the user and requesting them to provide their full name, email ID, password, and address through an online submission form
- Introducing themselves as a network administrator, the pen tester sends emails to users through the network and asks them to provide a password.
- Installing pop-up windows on the network and asking users to re-enter their username and password
- Trying to trick victims by sending spoofed emails that seem to be coming from real sources. These emails can be warning messages asking users to manage their mailbox storage space by logging in to some fake website. The pen tester can also pretend to be an employee and send requesting emails that ask for company records.

![image-20210816085931754](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210816085931754.png)

The pen tester can leverage the email addresses collected in the target identification phase to perform email-based social engineering attacks. They can send phishing or spear-phishing emails to the victims, trick them, and gather sensitive information. They can also actively gather information using email messages.

The tester can perform the following attacks using the email attack vector:

- Phishing 

  ![image-20210816091802590](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210816091802590.png)

- Whaling

  ![image-20210816094550691](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210816094550691.png)

- Spear phishing 

  **Examples of spear phishing:**

  1. The pen tester can send a spoofed mail embedded with a fake link to the system administrator of the target organization claiming that they are an authorized professional for IT services.

  2. The pen tester can claim that their company is offering a free new service for a limited
     time to the target organization and invite the user to sign in using business email to avail
     the free service

  3. When the user clicks on the link, they will be redirected to a fake website that looks

     ![image-20210816093917367](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210816093917367.png)

  ![image-20210816091932625](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210816091932625.png)

- Pharming

  **Example of pharming:**

  - The pen tester sends a malicious code as an email attachment.
  - When the user clicks on the attachment, the code is executed on their personal computer, modifying local host files.
  - When the victim enters the target website’s URL in the browsers address bar, the compromised host file automatically redirects the user’s traffic to the pharming website created by the pen tester.

  ![image-20210816094850006](/home/sherwinowen/Documents/my_tutorials/CPENT/images/image-20210816094850006.png)





#### Using telephone attack vector

Using a telephone attack vector is the oldest and most effective social engineering technique. The pen tester can use the telephone numbers of the employees to send fake SMS or make fake calls masquerading as a legitimate bank professional and trick them into revealing sensitive information. Social engineering using telephone calls not only reveals sensitive information; in some cases, it can even compromise the security of the whole organization.

The pen tester can perform the following attacks using telephone attack vector:

- Vishing

  **Attempt Social Engineering Using Phone (Vishing)**

  Vishing (voice or Voice over IP (VoIP) phishing) is an impersonation technique in which pen
  testers use VoIP technology to trick individuals into revealing their critical financial and personal
  information. In this technique, the pen tester uses caller ID spoofing to forge identification. The
  pen tester can also include pre-recorded messages and instructions resembling those from a
  legitimate financial institution. Using this technique, the pen tester can attempt to trick users
  into providing bank account or credit card details for identity verification over the phone.

  Vishing is a combination of phishing and VoIP technology. A pen tester can perform vishing by
  calling employees of the target organization pretending to be a colleague, vendor, or customer
  from a legitimate enterprise and request them to help in accomplishing a certain task or answer
  certain questions. The main targets of vishing include financial institutions, government
  organizations, online sales, payment services, and so on.

  The tester can also send a fake SMS or email message to the target user asking them to call the
  financial institution for credit card or bank account verification. When the user calls on the
  number mentioned in the message, the tester can play the recorded instructions, which insist
  that the target must provide personal and financial information such as name, date of birth,
  social security numbers, bank account numbers, credit card numbers, and credentials like
  usernames and passwords.

  **Three common techniques to perform social engineering using the phone are as follows:**

  - Acting as a customer looking for sensitive information
  - Posing as an employee who forgot their password
  - Pretending to be a technical support member to deceive staff members

  **Pen testers trick users into giving up the following information/performing the following actions:**

  - Contact or schedule information of other employees 
  - Usernames and passwords
  - Trick employees into running commands on their computer and providing information

  **Some of the techniques used to perform social engineering penetration testing using a telephone attack vector are discussed below:**

  - Calling the victim posing as a colleague and asking for sensitive information such as bank account number and passport number

  - Calling the victim pretending to be an important user, gaining their trust, and then asking them various questions to collect information.

  - Posing as an important person of the target organization and trying to collect information

  - Offering various rewards to acquire sensitive information

  - Using deceptive methodologies such as threatening with dire consequences like deactivation of the account unless the target provides sensitive information

  - Making the victim believe that the call is from their organization’s tech support team and requesting sensitive information

  - Using reverse social engineering method and creating situations where victims approach the pen tester themselves and provide sensitive information. For example, sending an email or SMS, informing them that due to security-related issues, users must call a given number or send an email and provide certain details.

  **Example of Social Engineering Using Phone**

  The pen tester pretends to be an employee of a bank, calls a person, and asks them to check their personal information such as account number, debit card number, credit card number, password, or PIN. The pen tester records these details with the help of a video recorder and uses this information for identity theft.

  **The following are a few points to remember while making a call:**

  - The pen tester should call the company’s help desk and ask for sensitive information.

  - The pen tester should call the receptionist, engage them in a conversation, and extract various contact details of the company.

  - The pen tester should make the call sound realistic; rehearsing many times before making the call is advised.

  - The pen tester should have backup answers for every question that the target person is asked.

  - The pen tester should record the conversation for reporting purposes.

  Examples of conversation:

  - Hi, this is Jason, VP of sales. I’m at the New York branch today, and | can’t remember my password. The machine in my home office has that “Remember password” set, so it’s been months since | actually had to enter it. Can you tell me what it is, or reset it or something? | really need to access this month’s sales reports ASAP.

  - Hi, this is Joanna from the Boston branch. I’m the new LAN administrator, and my boss wants this done before he gets back from London.

- SMiShing

  **Attempt Social Engineering Using SMiShing (SMS Phishing)**

  In SMiShing (SMS Phishing), the SMS text messaging system is used to lure users into instant action such as downloading malware, visiting a malicious webpage, or calling a fraudulent phone number. The pen test must craft SMiShing messages to provoke an instant action from the victim, requiring them to divulge their personal information and account details.

  **Example of SMiShing:**

  - Let us take the example of Tracy, a software engineer working in the target company

  - The pen tester sends an SMS to her from the security department of XIM Bank. The SMS must claim to be urgent and say that Tracy should call up the phone number mentioned in the SMS immediately.

  - Worried, Tracy calls up to check on her account, believing it to be an XIM Bank customer service number.

  - The pen tester plays a recorded message that asks her to provide her credit card or debit card number as well as password.

  - Tracy believes it to be a genuine message and shares the sensitive information.

#### Using physical attack vector

Using a physical attack vector, the pen tester can test the physical security of an organization or building. Based on the gathered information such as employee names, their designations, contact details, and company information, the pen tester must focus on entering the buildings of the target company. The pen tester must create various target scenarios based on the identified target in order to identify specific vulnerabilities and meet clear objectives.

Before using the physical attack vector, the pen tester must gather the following information:

- How many branches does the company have?
- Does the company have any other businesses?
- Does the company have secured parking lots?
- Does the company have a trained security guard or guards?
- Is the security guard's office located outside or inside?
- Is the main reception secured?
- How many people work in the reception at any one time?
- Does the company implement security controls such as radio-frequency identification (RFID) or magnetic strip tags?
- Who are the third parties working with the target company?

The above information will help the tester in creating various targeted social engineering scenarios to gain physical access to the target company and identify
physical vulnerabilities in the company’s security systems,

The pen tester can perform the following attacks using the physical attack vector:

- Piggybacking/Tailgating
- Eavesdropping
- Shoulder surfing
- Baiting
- Dumpster diving
- Reverse social engineering
- Elicitation techniques
- Motivation techniques

### 4. Reporting

Reporting is the final step. The pen tester must list all the results of the social engineering pen test in the report. While generating the report, the pen tester should consider the target audience of the report. Generally, in most cases, the audience comprises the senior management of the organization. The report should address all the relevant aspects pertaining to the initial planning and scoping, target identification, tests conducted, and identified vulnerabilities. Along with the identified vulnerabilities, the report must also include the recommendations and countermeasures required to mitigate the identified vulnerabilities and
thwart future attacks.

**The social engineering pen test report must contain the following elements.**

1. **Cover page**: Contains customer name, logo, and date of the report
2. **Title page**: Contains the name of the author of the report along with version details

3. **Disclaimer page**: Contains a disclaimer statement that describes the agreed upon terms
   and conditions between the tester/testing organization and the target
   organization/individual and extent of disclosure of sensitive information.
4. **Table of contents**: Contains an index of the report
5. **Social engineering overview**: Includes basic information about social engineering
   attacks and how to defend against such attacks
6. **Social engineering methodology**: Includes the methodology used to perform the social
   engineering pen testing
7. **Reporting**: After completing all the tests, the gathered information is used to construct
   the final report, which includes the following details:
   - Introduction (What, Why, When, Where, and How of the report) 
   - Anexecutive summary
   - Individual attack vectors
   - Identified technical risks
   - Potential impact of identified vulnerabilities
   - Remediation steps for each identified vulnerability
   - Recommendations for vulnerability elimination
   - Conclusions of the pen test
     



## Phishing Tools

### OhPhish



### Blackeye

https://github.com/An0nUD4Y/blackeye

```
┌─[sherwinowen@parrot]─[~/MyTools/blackeye]
└──╼ $./blackeye.sh 
     :: Disclaimer: Developers assume no liability and are not    ::
     :: responsible for any misuse or damage caused by BlackEye.  ::
     :: Only use for educational purporses!!                      ::

     ::     BLACKEYE v1.5! By @suljot_gjoka & @thelinuxchoice     ::

          [01] Instagram      [17] DropBox        [33] eBay               
          [02] Facebook       [18] Adobe ID       [34] Amazon         
          [03] Snapchat       [19] Shopify        [35] iCloud          
          [04] Twitter        [20] Messenger      [36] Spotify          
          [05] Github         [21] GitLab         [37] Netflix          
          [06] Google         [22] Twitch         [38] Custom         
          [07] Origin         [23] MySpace                 
          [08] Yahoo          [24] Badoo                   
          [09] Linkedin       [25] VK                      
          [10] Protonmail     [26] Yandex                  
          [11] Wordpress      [27] devianART               
          [12] Microsoft      [28] Wi-Fi                   
          [13] IGFollowers    [29] PayPal                  
          [14] Pinterest      [30] Steam                                
          [15] Apple ID       [31] Bitcoin                               
          [16] Verizon        [32] Playstation                               

[*] Choose an option: 
```



### ShellPhish

https://github.com/AbirHasan2005/ShellPhish

```
       __  _             _  _           _               _      
      / / | | v2.5-MOD  | || | ______  | |     _       | |     
     / /  | |           | || |(_____ \ | |    (_)      | |     
     \ \  | |___   ____ | || | _____) )| |___  _   ___ | |___  
      \ \ | |_  | / _  )| || ||  ____/ | |_  || | /___)| |_  | 
  _____) )| | | |( (/ / | || || |      | | | || ||___ || | | | 
 (______/ |_| |_| \____)|_||_||_|      |_| |_||_|(___/ |_| |_| 

       .:.:. Phishing Tool Moded by @AbirHasan2005 .:.:.

  :: Disclaimer: Developers assume no liability and are not    ::
  :: responsible for any misuse or damage caused by ShellPhish ::
 
 .:. Choose any social site which you want to hack .:.
 
 [01] Facebook     [11] Twitch       [21] DeviantArt
 [02] Instagram    [12] Pinterest    [22] Badoo
 [03] Google       [13] Snapchat     [23] Origin
 [04] Microsoft    [14] Linkedin     [24] CryptoCoin
 [05] Netflix      [15] Ebay         [25] Yahoo
 [06] PayPal       [16] Dropbox      [26] Wordpress
 [07] Steam        [17] Protonmail   [27] Yandex
 [08] Twitter      [18] Spotify      [28] StackoverFlow
 [09] PlayStation  [19] Reddit       [29] VK
 [10] GitHub       [20] Adobe

 [ST] Termux Setup [SL] Linux Setup  [EX] Exit

 [~] Select an option: 
```



### LUCY

https://lucysecurity.com/

### SET

https://github.com/trustedsec/social-engineer-toolkit

```
         .M"""bgd `7MM"""YMM MMP""MM""YMM
        ,MI    "Y   MM    `7 P'   MM   `7
        `MMb.       MM   d        MM
          `YMMNq.   MMmmMM        MM
        .     `MM   MM   Y  ,     MM
        Mb     dM   MM     ,M     MM
        P"Ybmmd"  .JMMmmmmMMM   .JMML.

[---]        The Social-Engineer Toolkit (SET)         [---]
[---]        Created by: David Kennedy (ReL1K)         [---]
                      Version: 8.0.3
                    Codename: 'Maverick'
[---]        Follow us on Twitter: @TrustedSec         [---]
[---]        Follow me on Twitter: @HackingDave        [---]
[---]       Homepage: https://www.trustedsec.com       [---]
        Welcome to the Social-Engineer Toolkit (SET).
         The one stop shop for all of your SE needs.

   The Social-Engineer Toolkit is a product of TrustedSec.

           Visit: https://www.trustedsec.com

   It's easy to update using the PenTesters Framework! (PTF)
Visit https://github.com/trustedsec/ptf to update all your tools!


 Select from the menu:

   1) Social-Engineering Attacks
   2) Penetration Testing (Fast-Track)
   3) Third Party Modules
   4) Update the Social-Engineer Toolkit
   5) Update SET configuration
   6) Help, Credits, and About

  99) Exit the Social-Engineer Toolkit
```



## Social Engineering Countermeasures and Recommendations

| Social Engineering Targets                  | Attack Techniques                                            | Defense Strategies                                           |
| ------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Front office and help desk                  | Eavesdropping, shoulder surfing, impersonation, persuasion, and intimidation | Train employees/help desk to never< reveal passwords or other information by phone. Enforce policies for the front office and help desk personnel. |
| Technical support and system administrators | Impersonation, persuasion, intimidation, fake SMS, phone calls, and emails | Train technical support executives and system administrators to never reveal passwords or other information by phone or email. |
| Perimeter security                          | Impersonation, reverse social engineering, piggybacking, tailgating, etc. | Implement strict badge, token, or biometric authentication; employee training; and strict monitoring by security guards. |
| Office                                      | Shoulder surfing, eavesdropping, ingratiation, etc.          | Employee training, best practices, and checklists for using passwords. Ensure that all guests are escorted by an employee or relevant personnel. |
| Vendors of the  target organization         | Impersonation, persuasion, intimidation                      | Educate vendors about social engineering.                    |
| Mail room                                   | Theft, damage, or forging of mails                           | Lock and monitor mail room, including employee training      |
| Machine room/Phone closet                   | Attempting to gain access, remove equipment, and/or attach a ptotocol analyzer to obtain the confidential data | Keep phone closets, serverrooms, etc. locked at all times and keep equipment inventory updated. |
| Company's executives                        | Fake SMS, phone calls, and emails to obtain confidential data | Train executives to never reveal identity, passwords, or other confidential information by phone or email. |
| Dumpsters                                   | Dumpstersdiving                                              | Keep all trash in secured and monitored shred important data, and erase magnetic media. |