[TOC]



## Media

- Material used to transmit data over the network
## Media (Copper)
- Types of Media
   Three categories:

  - **Copper**
   - **Fiber optic**
  - **Wireless**
- Each category is divided into subcategories
- Each has different specifications and uses

### Coaxial Cable (Coax)
- Inner
  - Insulated conductor or center wire passes data
  
- Outer
  
  - Braided metal shield used to help shield and protect the data transmission
  
  - Provides EMI resistance due to shielding
  
    ![image-20211227173531649](images\image-20211227173531649.png)    

### Coaxial Cables
RG-6

- Commonly used by local cable companies to connect individual homes

RG-59

- Typically used to carry composite video between two nearby devices, such as from a cable box to the television

### Coaxial Connectors
F-connector

- Typically used for cable TV and cable modem connections

BNC

- Termed Bayonet Neill-Concelman or British Naval Connector
- Was used for 10BASE2 Ethernet networks
### Twinaxial Cable
- Similar to coaxial cable but uses two inner conductors to carry the data instead of just one

### Serial Cable
- Usually have a series of straight copper wires inside a single cable or plastic jacket

- DB-9 or DB-25 (RS-232)
  - 9-pin or 25-pin D-subminiature
  
  - Used for asynchronous serial communications and connecting to an external modem
  
### Twisted Pair Cables
- Most popular physical LAN media type
- Eight individually insulated strands of copper wire inside each cable
- Each pair twisted together to reduce EMI
  - Tighter twists = less EMI
- Types:
  - Unshielded Twisted Pair (UTP)
  - Shielded Twisted Pair (STP)
### Unshielded Twisted Pair (UTP)
- Number of twists determines how much EMI can be blocked
- CAT 6 has more twists per inch than CAT 5
- UTP is cheaper than STP
- Media of choice in most LANs



### Shielded Twisted Pair (STP)
- Wires are twisted in pairs and surrounded in a metallic shielding to minimize EMI

- Outer shielding minimizes EMI, but makes STP cost more than UTP

### Twisted Pair Connectors

RJ-45

- 8-pin connector in Ethernet networks
- Most Ethernet use only 4-pins

RJ-11

- 6-pin connector

- Commonly only 2 or 4 pins are used

- Commonly found in telephone systems

### Registered Jack (RJ)

- Used to carry voice or data which specifies the standards a device needs to meet to connect to the phone or data network

### Bandwidth
- Theoretical measure of how much data could be transferred from a source to its destination

### Throughput
- Actual measure of how much data transferred from a source to its destination

| CATEGORY |        STANDARD        |     BANDWIDTH      |        DISTANCE        |
| :------: | :--------------------: | :----------------: | :--------------------: |
|  CAT 3   |        10BASE-T        |      10 Mbps       |       100 meters       |
|  CAT 5   |       100BASE-TX       |      100 Mbps      |       100 meters       |
|  CAT 5e  |       1000BASE-T       |     1000 Mbps      |       100 meters       |
|  CAT 6   | 1000BASE-T / 10GBASE-T | 1000 Mbps / 10Gbps | 100 meters / 55 meters |
|  CAT 6a  |       10GBASE-T        |      10 Gbps       |       100 meters       |
|  CAT 7   |       10GBASE-T        |      10 Gbps       |       100 meters       |
|  CAT 8   |       140GBASE-T       |      40 Gbps       |       30 meters        |

### Cable Lengths

- Keep cable runs under 70 meters from the IDF to the office
### Straight-Through Patch Cables
- Contains the exact same pinout on both ends of the cable

- T-568B is the preferred standard for wiring a building if no pre-existing pattern is used
  

**Data Terminating Equipment (DTE)****

- “Endpoint” devices that connect to a piece of data communications equipment or DCE (e.g. laptops, desktops, servers, and routers)

**Data Communications Equipment (DCE)**

- Includes things like switches, modems, hubs, and bridges

**Connecting DTE and DCE devices**

**Straight-through**
- DTE to DCE
- DCE to DTE
  

**Crossover**

- DTE to DTE

- DCE to DCE

### Crossover Cables
- Swaps the send and receive pins on the other end of the cable when the connector and its pinout are created

### Pinouts (568A/568B)
- TIA/EIA-568A and TIA/EIA-568B are standard
- Orange and Green pairs swap

### Medium Dependent Interface Crossover (MDIX)
- An automated way to electronically simulate a crossover cable connector even if using a straight-through patch cable
- If a switch doesn't support MDIX, use a crossover cable to make them talk

### Plenum and Non-Plenum Cable
**Plenum Cable**

- A special coating put on a UTP or an STP cable that provides a fire-retardant chemical layer to the outer insulating jacket
- Minimizes dangerous fumes if cable on fire
- Safe for use in ceilings, walls, and raised floors

**Non-plenum Cable**

- Also known as PVC
- Normal UTP/STP rated cable
- Cannot be used in raised floors, ceilings, or walls



## Media (Fiber)
### Fiber Optic Cables

- Uses light from an LED or laser to transmit information through a glass fiber

- Immune to EMI

- Uses light instead of electricity

### Benefits:
- Greater range (many miles)

- Greater data-carrying capacity (measured in Tbps)
  
### Types:
**Single-Mode Fiber (SMF)**

- Used for longer distances and has smaller core size which allows for only a single mode of travel for the light signal
- SMF’s core size is 8.3-10μ in diameter

**Multimode Fiber (MMF)**
- Used for shorter distances and has larger core size which allows for multiple modes of travel for the light signal
- MMF’s core size is 50-100μ in diameter
- Up to 2 kms or less

**Fiber Optic Connectors**

![image-20211227181634551](images\image-20211227181634551.png)



**Specialized SC Connectors**

![image-20211227181721995](images\image-20211227181721995.png)

### Wavelength Division Multiplexing (WDM)

- Combines multiple signals into one signal and sends over a single fiber optic strand using different wavelengths of the laser light source

|                     | Course WDM (CWDM)                                 | Dense WDM (DWDM)                |
| ------------------- | ------------------------------------------------- | ------------------------------- |
| Wavelength channels | Up to 18 channels                                 | Up to 80 channels               |
| Channel distance    | 20nm                                              | .8nm                            |
| Spped               | Up tp 10 Gbps (Ethernet) /  Up to 16 Gbps (Fiber) | Up tp 8 Tbps (100 Gbps/channel) |



## Transceivers
**Copper vs Fiber Optic Cables**

- Fiber-Optic Advantages

  - Higher bandwidth
  - Longer distances
  - Immune to EMI
  - Better security

  ![image-20211227185024195](images\image-20211227185024195.png)

- Copper Advantages
  
    - Less expensive
    - Easy to install
    - Inexpensive tools
    
    ![image-20211227185052576](images\image-20211227185052576.png)

**Media Converters**

- Convert media from one format to another

- Layer 1 device

  - Physical conversion of signal only

    Examples:

    - Ethernet to Fiber Optic
    - Fiber Optic to Ethernet
    - Coaxial to Fiber
    - Fiber to Coaxial

**Transceivers**

- Device that sends (transmits) and receives data

**Bidirectional**

- Devices take turns communicating
- Known as half-duplex

**Duplex**

- Full duplex occurs when devices can both communicate at the same time
- Half duplex occurs when devices can either transmit or receive, but cannot do both at the same time

**Types of transceivers used in switches and routers**

**GBIC**

- Standard, hot-pluggable gigabit Ethernet transceiver (copper or fiber)

**Small Form-factor Pluggable (SFP)**

-  Compact, hot-pluggable optical module transceiver
-  Support up to 4.25 Gbps
- Known as Mini-GBIC

**SFP+**

- Enhanced SFP
- Support up to 16 Gbps

**Quad Small Form-factor Pluggable (QSFP)**

- Compact, hot-pluggable optical module transceiver
- Supports up to 100 Gbps

| Transceiver                             | Speed           |
| --------------------------------------- | --------------- |
| Small Form-factor Pluggable (SFP)       | Up to 4.2 Gbps  |
| SFP+                                    | Up to 10 Gbps   |
| Quad Small Form-factor Pluggable (QSFP) | Up to 40 Gbps   |
| QSFP+                                   | Up to 41.2 Gbps |
| QSFP28                                  | Up to 100 Gbps  |
| QSFP56                                  | Up to 200 Gbps  |



### Cable Distribution

- An organized system to connect the network’s backbone in the main distribution frame to the intermediate distribution frames and finally to the end user’s wall jacks

- **Cable Distribution System**

  - Use an organized system that is hierarchical

**Demarcation point**

- The entrance facilities where you WAN connection will enter your building

Components
● Entrance facilities
● MDF
● Cross-connect facilities
● IDF
● Backbone wiring
● Telecommunications closet
● Horizontal wiring
● Patch Panels
● Work area

#### Punch Down Blocks
**66 block**

- Used for phones and older LAN wiring
- Causes crosstalk due to proximity of cables
- Bad choice for higher-speed LAN wiring
  - Do not use for CAT 5 or above

**110 block**

- Used for higher-speed network wiring
  - Required for CAT 5 or above cabling

**Krone block**

- A proprietary European alternative to a 110 block

**BIX block**

- Another proprietary punch down block that comes in various sizes
- If you are going to work on a BIX block, you will need a BIXspecific punch down tool

#### Patch Panels (Copper)
- Device with jacks to connect wiring from the jack to a network switch in a flexible manner

- Has punch downs (like a 110 block) on the back side that is used to connect wiring to wall jacks in building

- Front has RJ-45 jacks

#### Patch Panels (Fiber)
- Connect fiber jacks throughout building to a single patch panel in network closet
- Front uses patch cables to connect different wall jacks and switch ports

#### Example of Cable Distribution

![image-20211228064348784](images\image-20211228064348784.png)
