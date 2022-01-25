[TOC]



# IP Addressing

## Internet Protocol (IP) Address
- An assigned numerical label that is used to identify Internet communicating devices on a computer network

**Layer 2**

- Between two devices that are internal to own network or LAN
Layer 3
- Between two different networks or even two different subnets

## Pv4 Addressing

### Internet Protocol Version 4 (IPv4) Addressing

- Written in dotted-decimal notation
  - 10.1.2.3
  - 172.21.243.67
- Each IPv4 address is divided into 4 separate numbers and divided by dots
- Each of these divisions are called octets due to having 8 bits assigned
- 32-bits in length

​		![image-20211228091635616](images\image-20211228091635616.png)

### IPv4 Addressing
- IPv4 address is divided into network and host portions
- Subnet mask defines the network portion
  - Network portion if a binary 1
  - Host portion if binary 0

![image-20211228091711025](images\image-20211228091711025.png)



### Classes of IP Addresses

- Default subnet mask assigned by first octet
  - Classful Masks if using default subnet mask
- Defines the Class of IP Address

![image-20211228091901221](images\image-20211228091901221.png)



### Routable IPs
- Publicly routable IP addresses are globally managed by ICANN
  - Internet Corporation for Assigned Names and Numbers
    - ARIN, LACNIC, AFNIC, APNIC, and RIPE NCC
- Public IP’s must be purchased before use through your Internet Service Provider (ISP)



### Private IPs
- Private IP’s can be used by anyone
- Not routable outside your local area network
- Network Address Translation (NAT) allows for routing of private IPs through a public IP

![image-20211228092818995](images\image-20211228092818995.png)



### Specialized IPs
- Loopback addresses (127.x.x.x range)
  - Refers to the device itself and used for testing
  - Most commonly used as 127.0.0.1

- Automatic Private IP Addresses (APIPA)
  - Dynamically assigned by OS when DHCP server is unavailable and address not assigned manually
  - Range of 169.254.x.x

![image-20211228093452762](images\image-20211228093452762.png)



### Identifying Network and Hosts in IPv4

![image-20211228093800111](images\image-20211228093800111.png)

### Virtual IP Addresses (VIP or VIPA)

- An IP address that does not correlate to an actual physical network interface
- respond to numerous IP addresses and have them resolve to your physical network interface to establish connectivity

### Subinterfaces
- A virtual interface that is created by dividing up one physical interface into multiple logical interfaces

## IPv4 Data Flows

**Unicast**

- Data travels from a single source device to a single destination device

![image-20211228094342331](images\image-20211228094342331.png)

**Multicast**

- Data travels from a single source device to multiple (but specific) destination devices

![image-20211228094428233](images\image-20211228094428233.png)

**Broadcast**

- Data travels from a single source device to all devices on a destination network

![image-20211228094505351](images\image-20211228094505351.png)

## Assigning IP Addresses
**Static**

- Simple

- Time-consuming

- Prone to human errors

- Impractical for large networks

**Dynamic**

- Quicker
- Easier
- Less confusing
- Simplistic for large networks

**Components of an IP Address**

- Information assigned from static or dynamic
  - IP Address
  - Subnet Mask
  - Default Gateway
  - Server addresses
    - Domain Name System (DNS)
      - Converts domain names to IP address
    - Windows Internet Name Service (WINS)
      - Converts NetBIOS computer name into an IP address

![image-20211228095231929](images\image-20211228095231929.png)

### Dynamic Host Control Protocol (DHCP) Configuration

- Based on the older Bootstrap Protocol (BOOTP for short)
  - Required static database of IP and MAC to assign
  
- **DHCP** service assigns an IP from an assignable pool (scope)

- **IP Address Management** is software used to manage the IP’s being assigned
  
### Dynamic Host Control Protocol (DHCP)

Provides clients with

- IP
- Subnet mask
- Default gateway
- DNS server
- WINS server
- Other variables needed for VoIP
- Each IP is leased for a given amount of time and given back to the pool when lease expires (TTL)

![image-20211228100123591](images\image-20211228100123591.png)

### Automatic Private IP Address (APIPA)

- Used when device does not have a static IP address and cannot reach a  DHCP server
- Allows a network device to self-assign an IP address from the 169.254.0.0/16 network
- Designed to allow quick configuration of a LAN without need for DHCP
- Non-routable but allows for network connectivity inside the local subnet



### Zero Configuration (Zeroconf)

Newer technology based on APIPA providing:

- Assigning link-local IP addresses
  - Non-routable IP usable only on local subnet
- Resolving computer names to IP addresses without the need for DNS server on local network
  - mDNS - Multicast Domain Name Server
- Locating network services
  - Provides service discovery protocols
    - Service Location Protocol (SLP)
    - Microsoft’s Simple Service Discovery Protocol (SSDP)
    - Apple’s DNS-based Service Discovery (DNS-SD)

### Computer Mathematics
- Humans count using Base-10 numbers

  - Decimals
  - 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, …

- Computers and networks do not understand decimal numbers natively

- Process numbers using Base-2 numbers

  - Binary

  - 0, 1, 10, 11, …

### Converting Binary to Decimal
- Use table to convert from binary to decimal
- Each number is a factor of 2
- Starting from the right and go to the left

![image-20211228103239950](images\image-20211228103239950.png)

- Populate the table with the binary digits
- Add up any columns that contain a 1

![image-20211228103418216](images\image-20211228103418216.png)

### Converting Decimal to Binary

- Use subtraction to convert decimal to binary

![image-20211228103532350](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228103532350.png)

### Computer Mathematics Practice

- You must be able to convert:
- Binary - Decimal
- Decimal - Binary

### Converting Binary to Decimal

![image-20211228103903216](images\image-20211228103903216.png)

### Converting Decimal to Binary

![image-20211228104027936](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228104027936.png)

### Subnetting
- Default classful subnet masks are rarely the optimal choice for a subnet size
- Subnets can be modified using subnet masks to create networks that are better scoped
- Creating a subnet involves borrowing bits from the original host portion and adding them to the network portion

![image-20211228104959280](images\image-20211228104959280.png)

![image-20211228105231843](images\image-20211228105231843.png)

### Subnet Masks

![image-20211228105339362](images\image-20211228105339362.png)

### Subnetting Formulas

![image-20211228105626539](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228105626539.png)

### Classful vs Subnetted Networks

![image-20211228105741704](images\image-20211228105741704.png)

### Calculating Number of Subnets

![image-20211228105904968](images\image-20211228105904968.png)

### Calculating Number of IPs

![image-20211228110121964](images\image-20211228110121964.png)

### Listing Subnets

![image-20211228111133023](images\image-20211228111133023.png)

### Classless Interdomain Routing (CIDR)

- Instead of advertising multiple individual routes, the routes can be summarized and advertised as a single route
- Used to summarize contiguous networks 
  - Called route aggregation

![image-20211228111412956](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228111412956.png)

### Variable-Length Subnet Masking (VLSM)

- Allows subnets of various sizes to be used
- Requires a routing protocol that supports it
  - RIPv2, OSPF, IS-IS, EIGRP, and BGP
- Basically, it is subnetting subnets
- Without VLSM, all subnets would have to be the same size

![image-20211228111707378](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228111707378.png)

### Subnetting Exam Tip

![image-20211228111902841](images\image-20211228111902841.png)



### Subnetting Practice

You are the network administrator for DionTraining.com. We decided to locate a small branch office in another city. To support the new location, you will need to subnet the private IP address range given to you into several smaller networks to service each department.

The new office location has been assigned the range of 10.10.10.0/24.

‘When you set up the new network, you need to configure separate subnets for each department in the new office. You should allocate the addresses using CIDR notation and provide each department the minimum number of IP addresses that will meet their needs.

The departments at the new location will require these number of computers in their subnets:

54 - IT
32 - Instructors
5 - Sales
3 - Administrative
X—Unused

+ When complete, summarize the remaining available IPs in their own subnet using CIDR notation.
+ If you have memorized the table, this problem becomes quite simple.

- First, we round up our department numbers to the next highest multiple of 2. Remember, the numbers provided are for the computers, we still need to add 2 IPs to account for the network and broadcast IPs:
  - IT.54 +2 = 56 => 64 IPs will be assigned
  - Instructors: 32 + 2 = 34 => 64 IPs will be assigned
  - Sales: 5+2=7 => 8 IPs will be assigned
  - Administrative: 3 + 2 = § => 8 IPs will be assigned
  - Unused: 256 - 64 - 64 - 8 - 8 = 112 => 64 Unused IPs

![image-20211228130326365](images\image-20211228130326365.png)

### Internet Protocol Version 6 (IPv6) Addresses

#### IPv6

- IPv4 essentially ran out of addresses due to proliferation of devices

- IPv6 addressing provides enough IP addresses for generations to come

- Enough IPv6 addresses for every person on the planet (5 x 10<sup>28</sup>)

  ![image-20211228130714713](\images\image-20211228130714713.png)

- IPv5 was an experimental protocol that was abandoned, although some of its concepts have been incorporated into other protocols



#### IPv6 Benefits

- No broadcasts

- No fragmentation
  - Performs MTU (maximum transmission units) discovery for each session
  
- Can coexist with IPv4 during transition
  - Dual stack (run IPv4 and IPv6 simultaneously)

  - IPv6 over IPv4 (tunneling over IPv4)
  - Allows an existing IPv4 router to carry IPv6 traffic
  - Encapsulates IPv6 packets within IPv4 headers to carry this IPv6 data over IPv4 routers and other infrastructure

  - Simplified header
    - 5 fields instead of 12 fields

### Headers (IPv4 and IPv6)

![image-20211228133518475](images\image-20211228133518475.png)



### IPv6 Address Structure

- Each hexadecimal digit is 4-bits
- 128-bits in an IPv6 address
- No more than 32 hexadecimal digits

![image-20211228133630235](images\image-20211228133630235.png)



### IPv6 Address Types

**Unicast Addresses**

- Used to identify a single interface
  - Globally routable unicast addresses
    - Begins with 2000 to 3999
  - Link-local address
      - Begins with FE80
      - It uses stateless address autoconfiguration, or SLAAC

**Multicast Addresses**

- Used to identify a group of interfaces so that a packet can be sent to a multicast address and then be delivered to all of the interfaces in the group

  - Begins with FF

**Anycast Addresses**

- Used to identify a set of interfaces so that a packet can be sent to any member of a set

### Do you need DHCP for IPv6?

- IPv6 uses auto configuration to discover the current network and selects its own host ID based on its MAC using the EUI64 process
- If you want to still use DHCP, there is a DHCPv6 protocol
- IPv6 uses Neighbor Discovery Protocol (NDP) to learn the Layer 2 addresses on the network

### Stateless Address Autoconfiguration (SLAAC)

- Discovers the current network that an interface is located on and then select its own host ID based on its MAC address using the EUI64 process
  ● Extended Unique Identifier (EUI)

### Neighbor Discovery Protocol (NDP)
- Used to learn Layer 2 addresses on network
- Router Solicitation

  - Hosts send message to locate routers on link
- Router Advertisement
  - Router advertise their presence periodically and in response to solicitation
- Neighbor Solicitation
  - Used by nodes to determine link layer addresses
- Neighbor Advertisement
  - Used by nodes to respond to solicitation messages
- Redirect
  - Routers informing host of better first-hop routers

### IPv6 Data Flows
Three data flow methods, like IPv4

- Unicast

- Multicast

- Anycast (new to IPv6)

#### Unicast
- Data travels from a single source device to a single destination device

![image-20211228154401559](images\image-20211228154401559.png)

#### Multicast

- Data travels from a single source device to multiple (but specific) destination devices

![image-20211228154445226](images\image-20211228154445226.png)



#### Anycast
- Designed to let one host initiate the efficient updating of router tables for a group of hosts
- IPv6 can determine which gateway host is closest and sends the packets to that host as though it were a unicast communication
- That host can anycast to another host in the group until all routing tables are updated
- Data travels from a single source device to the device nearest to multiple (but specific) destination devices

![image-20211228154604965](images\image-20211228154604965.png)
