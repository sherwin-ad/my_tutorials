[TOC]

## TCP/IP Model
- Also known as TCP/IP stack or the DoD Model
- Alternative to the OSI Model
- More relevant model for network designers since it’s based on TCP/IP
- Only a 4-layer model

## OSI Model to TCP/IP Model

![image-20211209101223102](images\image-20211209101223102.png)

## Network Interface (Layer 1)

- Physical and electrical characteristics
- Describes how to transmit bits across the network (1’s and 0’s)
- Determines how interface uses network medium
- Coaxial, Optical fiber, or Twisted-pair copper cabling
- Examples:
  - Ethernet, Token Ring, FDDI, RS-232

## Internet (Layer 2)
- Packages data into IP datagrams

  - Contains source and destination IPs

  - Forwards datagrams between hosts across the networks

- Routes IP datagrams across networks
- Connectivity occurs externally
- Examples:
  - IP, ICMP, ARP, RARP
## Transport (Layer 3)
- Provides communication session management between hosts
- Defines level of service and status of connection used for transport
- Examples:
  - TCP
  - UDP
  - RTP
## Application (Layer 4)
- Defines TCP/IP application protocols
- Defines how programs interface with the transport layer service
- Layer with which the user interacts
- Examples:
  - HTTP, TELNET, FTP, SNMP, DNS, SMTP, SSL, TLS, ...

## Data Transfer Over Networks

### Ports
- Port numbers can be 0 to 65,535
-  “Well-known” & Reserved Ports
  - Ports 0 to 1023
- Ephemeral Ports
  - Short-lived transport port that is automatically selected from a predefined range
    - Ports 1024 to 65,535

### Data Transfer