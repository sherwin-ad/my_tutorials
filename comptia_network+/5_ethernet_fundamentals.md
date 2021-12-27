[TOC]



## Ethernet Fundamentals

- In early computer networks, there were many different network technologies competing for a portion of the market share

- Ethernet, Token Ring, Fiber Distributed Data Interface (FDDI), and others fought for dominance

- Currently, Ethernet is dominant for Layer 1

- Due to Ethernet’s popularity, it is important to understand the fundamentals of Ethernet

## Origins of Ethernet

- Was first run over coax cables (10Base5, 10Base2)

- Ethernet has changed to using twisted pair cables

- 10BASE-T is Unshielded Twisted Pair

  - Maximum speed: 10 Mbps

  - Maximum distance: 100 meters

## How should devices access the network?

  - Deterministic
      - Very organized and orderly
      - Need an electronic token to transmit
      - For example, Token Ring networks
      
- Contention-based

- Very chaotic

- Transmit (almost) whenever you want

- For example, Ethernet networks

## Carrier Sense Multiple Access/ Collision Detect (CSMA/CD)
- Ethernet devices transmit based on a principle called carrier sense multiple access/collision detect (CSMA/CD)
- Carrier sense

  - Listen to the wire, verify it is not busy
- Multiple access

  - All devices have access at any time
  
- Collision detect
  - If two devices transmit at the same time, a collision occurs
  - Back off, wait a random time, and try again

## Example of CSMA/CD

![image-20211227125722618](images/image-20211227125722618.png)



## Collision Domains with Switches
- Ethernet switches increase scalability of the network by creating multiple collision domains 

- Each port on a switch is a collision domain, no chance of collisions, and increases speed

- Switches can operate in full-duplex mode

  

## Speed Limitations

|    Ethernet Type     | Bandwidth Capacity |         Description         |
| :------------------: | :----------------: | :-------------------------: |
|       Ethernet       |      10 Mbps       | 10 million bits per second  |
|    Fast Ethernet     |      100 Mbps      | 100 million bits per second |
|   Gigabit Ethernet   | 1000 Mbps (1Gbps)  |  1 billion bits per second  |
| 10-Gigabit Ethernet  |      10 Gbps       | 10 billion bits per second  |
| 100-Gigabit Ethernet |      100 Gbps      | 100 billion bits per second |

- Bandwidth is the measure of how many bits the network can transmit in 1-second (bps)
- Type of cable determines the bandwidth capacity of the network

## Distance Limitations

| Ethernet Standard |   Media Type    | Bandwidth Capacity | Distance Limitation |
| :---------------: | :-------------: | :----------------: | :-----------------: |
|     10BASE-T      | Cat 3 or higher |      10 Mbps       |        100 m        |
|    100BASE-TX     | Cat 5 or higher |      100 Mbps      |        100 m        |
|    1000BASE-TX    | Cat 6 or higher |       1 Gbps       |        100 m        |
|    1000BASE-SX    |       MMF       |       1 Gbps       |        220 m        |
|    1000BASE-LX    |       MMF       |       1 Gbps       |        550 m        |
|    1000BASE-LX    |       SMF       |       1 Gbps       |        5 km         |
|    1000BASE-ZX    |       SMF       |       1 Gbps       |        70 km        |



## Network Infrastructure Devices
- Network Infrastructure

  - Primary devices used in our networks

    ![image-20211227132401025](images/image-20211227132401025.png)



