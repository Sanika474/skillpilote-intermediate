# Day 2 – AWS Multi-Tier VPC Architecture

## Objective
Create a multi-tier VPC architecture for a web application using AWS networking services.

## AWS Services
- Amazon VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Security Groups

## Network Configuration

| Component | Configuration |
|---|---|
| VPC | 10.0.0.0/16 |
| Public Subnet | 10.0.1.0/24 |
| Private Subnet | 10.0.2.0/24 |
| Public AZ | ap-south-1a |
| Private AZ | ap-south-1b |
| Public Route | 0.0.0.0/0 → IGW |
| Private Route | 0.0.0.0/0 → NAT |
| Web Security Group | HTTP 80, HTTPS 443 |
| DB Security Group | MySQL 3306 from Web SG |

## Implementation
1. Created custom VPC.
2. Enabled DNS support and DNS hostnames.
3. Created public and private subnets.
4. Attached Internet Gateway.
5. Configured public and private route tables.
6. Allocated Elastic IP.
7. Created NAT Gateway.
8. Configured private subnet outbound internet access.
9. Created Web and Database Security Groups.
10. Verified routing and security rules.

## Security
- Database subnet does not have a direct Internet Gateway route.
- Database inbound access is restricted to the Web Security Group.
- No public database access configured.

## Architecture
See `architecture/vpc-architecture.mmd`.

## Screenshots
See the `screenshots/` folder.

## Learning Outcomes
Learned VPC creation, subnet segmentation, internet routing, NAT Gateway, and security group configuration.

**Platform:** SkillPilote Intermediate  
**Practical:** Day 2