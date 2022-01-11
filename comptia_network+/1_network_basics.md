[TOC]



## Network Basics

### Computer Networks

- What comes to mind?

- Is it limited to computers?

- Is it limited to Ethernet, WiFi, or fiber?

### Purpose of Networks

- To make connections between machines
- Converged networks combine multiple types of traffic like data, video, and voice
- We expect 99.999% availability (The 5 9’s)
  - **Only 5 minutes downtime per year**

### Network Traffic Examples

- File sharing
- Video chatting
- Surfing the Web
- Social Media
- Streaming Video
- E-mail
- Messaging
- VoIP

## Network Components

### 1. Client

- Device end-user accesses the network with

- Workstation, laptop, tablet, smartphone, television, server, or other terminal devices

- Can be any device that connects to the network

### 2. Server

- Provides resources to the rest of the network
- Different servers provide different functions, such as an E-mail server, Web server, File server, Chat server, and Print server
- Can be a dedicated server hardware/software or can be a device that is acting like a server for a particular function

### 3. Hub
- Older technology to connect networked devices, such as clients and servers
- Can be interconnected to provide more ports, but leads to increased network errors
- Receives information in one port and rebroadcasts it out all the other ports

### 4. Wireless Access Point (WAP)
- Device that allows wireless devices to connect into a wired network
- Commonly used in home, small business, and even some large enterprise networks
- Acts as a wireless hub

### 5. Switch

- Connects networked devices such as clients and servers (like a hub) 
- Switches learn what devices are on which switch ports
- Switches only forward traffic received from a port to the destination port based on the device’s MAC address
- Provides more security and efficiently uses available bandwidth

### 6. Router

- Connect two different networks together
- Intelligently forwards traffic to and from a network based on its logical address
- Most modern routers use Internet Protocol (IP) address to determine routing of traffic

### 7. Media

- Connect two devices or a device to a port
- Made from copper cable, fiber optic cable, or radio frequency waves (WiFi)
- Each type has strengths and limitations, such as its available bandwidth, capacity, distance that can be covered, and cost to install and maintain

### 8. Wide Area Network (WAN) Link
- Physically connects networks together
- Numerous WAN links are available: leased lines, DSL, Cable, Fiber Optic, Satellite, Cellular, Microwave, ...
- Connects internal network to external networks, such as a SOHO network to Internet



## Network Resources

### Client/Server Model

- Uses dedicated server to provide access to files, scanners, printers, and other resources
- Administration and backup are easier since resources are located on a few key servers

#### Benefits of Client/Server

- Centralized administration
- Easier management
- Better scalability

#### Drawbacks of Client/Server
- Higher cost
- Requires dedicated resources
- Requires network operating system

### Peer-to-Peer Model

- Peers (PCs) share resources (files/printers) with each other directly
- Administration and backup are more difficult since resources are located on a many PCs which adds to the administrative burden

#### Benefits of Peer-to-Peer
- Lower cost
- No dedicated resources required
- No specialized operating system required

#### Drawbacks of Peer-to-Peer

- Decentralized management
- Inefficient for large networks
- Poor scalability

## Network Geography

### 1. Personal Area Network (PAN)

- Smallest type of wired or wireless network
- Covers the least amount of area (few meters)
- Examples:
  - Bluetooth cellphone to car
  - USB hard drive to laptop
  - Firewire video camera to computer

### 2. Local Area Network (LAN)

- Connects components in a limited distance
- Each segment is limited to short distances, such as 100 meters with CAT 5 cabling
- Consists of **Ethernet (IEEE 802.3)** or **WiFi networks (IEEE 802.11)**
  - Internal wired or wireless networks

### 3. Campus Area Network (CAN)
- Connects building-centric LANs across a university, industrial park, or business park
- Covers many square miles and buildings
- Examples:
  - College campus
  - Business Parks
  - Military bases

### 4. Metropolitan Area Network (MAN)

- Connects scattered locations across a city
- Larger than a CAN, but smaller than a WAN
- Covers up to a 25-mile radius in larger cities
- Examples:
  - City departments like the police department
  - Community college with campuses spread across a county

### 5. Wide Area Network (WAN)
- Connects geographically disparate internal networks
- Consists of leased lines or Virtual Private Networks tunneled over the Internet
- Covers distances around the country or around the world

- Examples:
  - The Internet (largest WAN)
  - Connecting two private corporate networks from New York to Seattle

## Wired Network Topology

### Defining Network Topology

#### Physical Topology
● How devices are physically connected by media

#### Logical Topology
● How the actual traffic flows in the network

### Bus Topology

![image-20211208144850640](images\image-20211208144850640.png)

- Uses a cable running through area that required network connectivity

- Each device “taps” into the cable using either a T connector or vampire tap

- Old technology, not commonly used anymore

- Devices on cable form single collision domain

### Ring Topology

![image-20211208145420888](images\image-20211208145420888.png)

- Uses a cable running in a circular loop

- Each device connects to the ring, but data travels in a singular direction

- **FDDI (Fiber Distributed Data Interface) (Fiber networks) used two counter-rotating rings for redundancy**

- **On token ring networks, devices wait for a turn to communicate on ring by passing a token**

### Star Topology

![image-20211208145247659](images\image-20211208145247659.png)

- Most popular physical LAN topology
- Devices connect to a single point
- Commonly used with Ethernet cabling, but wireless or fiber is also used
- If the central device fails, the entire network fails
### Hub-and-Spoke Topology

![image-20211208145715943](images\image-20211208145715943.png)

- Used for connecting multiple sites
- Similar to Star but with WAN links instead of LAN connections
- Not redundant, if central office (hub) fails, the whole network can fail
### Full-Mesh Topology

![image-20211208145902069](images\image-20211208145902069.png)

- Most redundant topology
- Every node connects to every other node
- Optimal routing is always available
- Very expensive to maintain and operate
- Number of Connections
- x= n(n - 1) / 2
### Partial-Mesh Topology

![image-20211208150115208](images\image-20211208150115208.png)

- Hybrid of the full-mesh and the hub-and-spoke topologies
- Provides optimal routes between some sites, while avoiding the expense   of connecting every site
- Must consider network traffic patterns to design it effectively

## Wireless Network Topology
### Infrastructure Mode

- Most common type of wireless network

- Requires centralized management

- Uses a wireless access point as a centralized point like a star topology

- Supports wireless security controls

### Ad Hoc Mode
- Decentralized wireless network
- No routers or access points are required
- Forwarding decisions for data on the network are made dynamically
- Allows creation/joining of networks “on-the-fly”
- Creates P2P connections

### Wireless Mesh Topology

![image-20211208151331176](images\image-20211208151331176.png)

- Interconnection of different types of nodes or devices
- Consists of clients, routers, and gateways
- Utilizes different radio frequencies to extend and expand access
- Reliable and redundant connections



## Internet of Things (IoT)
### Internet of Things (IoT) Technologies

#### 802.11

- Operates as infrastructure or ad hoc

#### Bluetooth
- Low energy use variant of Bluetooth which allows for a mesh network

####  RFID (Radio Frequency ID)
- Uses electromagnetic fields to read data stored in embedded tags
- 

#### NFC (Near Field Communication)
- Enables two electronic devices to communicate within a 4 cm range
- google pay, apple pay
#### Infrared (IR)
- Operates with line of sight
- tv remote control
#### Z-Wave
- Provides short-range, low-latency data transfer at rates and power consumption lower than Wi-Fi
- Used primarily for home automation
  
#### Ant+
- Collection and transfer of sensor data
- Used with remote control systems (tire pressure, TVs, lights)