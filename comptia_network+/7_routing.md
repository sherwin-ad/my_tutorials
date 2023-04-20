# Routing

## Routers

- Used to forward traffic between subnets, between an internal and external network, or between two external networks
- Each subnet or external network is going to be its own broadcast domain
- Multilayer switches also perform routing functions
  -  Switch
    - Layer 2 Switch
  -  Multilayer Switch
      - Router

## Routing Fundamentals

- Traffic is routed to flow between subnets
- Each subnet is its own broadcast domain
- Routers are the layer 3 devices that separate broadcast domains, but multilayer switches can also separate broadcast domains

![image-20211228155037149](images\image-20211228155037149.png)

## Basic Routing Process

![image-20211228155302241](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228155302241.png)

## Routing Tables

### Routing Decisions

- Layer 3 to Layer 2 Mapping
  - Routers use ARP caches to map an IP address to a given MAC address
- Make packet-forwarding decisions based on its internal routing tables

![image-20211228155606439](images\image-20211228155606439.png)



### Routing Tables

- Table kept by the router to help determine which route entry is the best fit for the network
- A route entry with the longest prefix is the most specific network
- 10.1.1.0/24 more specific than 10.0.0.0/8

![image-20211228155845670](images\image-20211228155845670.png)

### Sources of Routing Information

**Directly Connected Routes**
- Learned by physical connection between routers

![image-20211228160451403](C:\Users\sherwinowen\Documents\GitHub\my_tutorials\comptia_network+\images\image-20211228160451403.png)

**Static Routes**
- Manually configured by an administrator
- Default static route (0.0.0.0/0) is a special case
  - “If I don’t know where, then send out default static route.”

![image-20211228160638996](images\image-20211228160638996.png)

**Dynamic Routing Protocols**

- Learned by exchanging information between routers
- More than one route can exist for a network
- Different protocols consider different criteria when deciding which route to give preference
  ▪ Based on number of hops (hop count in RIP), link bandwidths (OSPF), or
  other criteria

![image-20211228162103954](images\image-20211228162103954.png)

![image-20211228160348535](images\image-20211228160348535.png)

### Preventing Routing Loops

**Split horizon**

- Prevents a route learned on one interface from being advertised back out of that same interface

**Poison reverse**

- Causes a route received on one interface to be advertised back out of that same interface with a metric considered to be infinite

### Routing Loops

![image-20211228163025302](images\image-20211228163025302.png)

### Routing Protocols

**Interior Gateway Protocols (IGP)**

- Operate within an autonomous system

**Exterior Gateway Protocols (EGP)**

- Operated between autonomous systems

![image-20211228163545442](images\image-20211228163545442.png)



### Router Advertisement Method
- Characteristic of a routing protocol

- How does it receive, advertise, and store routing information?
  - Distance vector
  - Link state

- Not every routing protocol fits neatly into one of these two categories (hybrids exist)

### Distance Vector

- Sends full copy of routing table to its directly connected neighbors at regular intervals
- Slow convergence time
  - Time it takes for all routers to update their routing tables in response to a topology change
- Holding-down timers speeds up convergence
  - Prevents updates for a specific period of time
- Uses hop count as a metric

### Link State

- Requires all routers to know about the paths that all other routers can reach in the network
- Information is flooded throughout the link-state domain (OSPF or IS-IS) to ensure routers have synchronized information
- Faster convergence time and uses cost or other factors as a metric
- Each router constructs its own relative shortest-path tree with itself as the root for all known routes in the network

### Routing Information Protocol (RIP)

- Interior Gateway Protocol
- Distance-vector protocol using hop count
- Maximum hops of 15, 16 is infinite
- Oldest dynamic routing protocol, provides updates every 30 seconds
- Easy to configure and runs over UDP



### Open Shortest Path First (OSPF)

- Interior Gateway Protocol
- Link-state protocol using cost
- Cost is based on link speed between routers

![image-20211228165342398](images\image-20211228165342398.png)

### Intermediate System to Intermediate System (IS-IS)
- Interior Gateway Protocol

- Link-state protocol using cost

- Cost is based on link speed between two routers

- Functions like OSPF protocol, but not as popular or widely utilized
  

### Enhanced Interior Gateway Routing Protocol (EIGRP)

- Interior Gateway Protocol
- Advanced distance-vector protocol using bandwidth and delay making it a hybrid of distance-vector and link-state
- Proprietary Cisco protocol that is popular in Cisco-only networks

### Border Gateway Protocol (BGP)

- External Gateway Protocol

- Path vector using the number of autonomous system hops instead of router hops

- Widespread utilization, this protocol runs the backbone of the Internet

- Does not converge quickly, though, when the topology changes
  
### Route Believability
- If a network is using more than one routing protocol, how does it choose which routing protocol to make decisions from?
- Some routing protocols are considered more believable than others, so routers use an index of believability called administrative distance (AD)
- If a route has a lower the administrative distance (AD), the route is more believable

|  Routing Information Source   | Administrative Distance |
| :---------------------------: | :---------------------: |
|  Directly connected network   |            0            |
| Statically configured network |            1            |
|             EIGRP             |           90            |
|             OSPF              |           110           |
|              RIP              |           120           |
|        External EIGRP         |           170           |
|    Unknown or Unbelievable    |    255 (unreachable)    |

### Metrics

- If a routing protocol knows multiple paths to reach a network, how does it choose its path?

- Metrics are the values assigned to a route
- Lower metrics are preferred over higher metrics

### Metrics calculated differently for each protocol (RIP, OSPF, IS-IS, EIGRP, and BGP)

- Hop count
- Bandwidth
- Reliability
- Delay
- Other metrics

### Routing Protocol Summary

|              Routing Protocol              | Abbreviation |           Type           | Interior/Exterior |
| :----------------------------------------: | :----------: | :----------------------: | :---------------: |
|        Routing information Protocol        |     RIP      |     Distance Vector      |     Interior      |
|          Open Shortest Path First          |     OSPF     |        Link State        |     Interior      |
| Enhanced Interior Gateway Routing Protocol |    EIGRP     | Advanced Distance vector |     Interior      |
| Intermediate System-to-Intermediate System |    IS-IS     |       Links State        |     Interior      |
|          Border Gateway Protocol           |     BGP      |       Path Vector        |     Exterior      |

A network can simultaneously support more than one routing protocol through route redistribution. This allows a router to participate in OSPF on one interface and EIGRP on another interface. The router can than translate from one protocol for redistribution as the other protocol.



### Address Translation (NAT & PAT)
#### Address Translation

- Network Address Translation (NAT) is used to conserve the limited supply of IPv4 addresses

- NAT translates private IP addresses to public IP addresses for routing over public networks

- Port Address Translation (PAT) is a variation of address translation that utilizes port numbers instead of IP addresses for translation

#### Types of Address Translation
- **Dynamic NAT (DNAT)**
  - IP addresses automatically assigned from a pool
  - Many-to-many translations
- **Static NAT (SNAT)**
  - IP addresses manually assigned
  - One-to-one translations
- **Port Address Translation (PAT)**
  - Multiple private IP addresses share one public IP
  - Many-to-one translation
  - Common in small networks

#### Names of NAT IP Addresses

**Inside local**

- Private IP address referencing an inside device

**Inside global**

- Public IP address referencing an inside device

**Outside local**

- Private IP address referencing an outside device

**Outside global**

- Public IP address referencing an outside device

### How NAT Works

![image-20211228194940042](images\image-20211228194940042.png)

### How PAT Works

![image-20211228195252370](images\image-20211228195252370.png)



### Multicast Routing
**What is multicast touring?**

- Multicast sender sends traffic to a Class D IP Address, known as a multicast group
  - Goal
    - Send the traffic only to the devices that want it
    
  - Two primary protocols
  
    **Internet Group Management Protocol (IGMP)**
  
  ​       **Protocol Independent Multicast (PIM)**

**Internet Group Management Protocol (IGMP)**

- Used by clients and routers to let routers known which interfaces have multicast receivers
- Used by clients to join a multicast group

**Versions**
**IGMPv1**

- Client requests to join the group and is asked every 60 seconds if it wants to remain in the group

**IGMPv2**

- Client can send a leave message to exit multicast group

**IGMPv3**

- Client can request multicast from only specific server
- Called source-specific multicast (SSM)
- Allows multiple video streams to single multicast



### Protocol Independent Multicast (PIM)
- Routes multicast traffic between multicast-enabled routers

- Multicast routing protocol forms a multicast distribution tree
  **PIM Dense Mode (PIM-DM)**

  - Uses periodic flood and prune behavior to form optimal distribution tree

  - Causes a negative performance impact on the network

  - Rarely used in modern networks

  **PIM Sparse Mode (PIM-SM)**
  
  - Initially uses a shared distribution tree, which may be suboptimal, but
  - Eventually creates an optimal distribution tree through shortest path tree (SPT) switchover
