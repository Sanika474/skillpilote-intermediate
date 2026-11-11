**SkillPilote Intermediate – Day 04**

**AWS Network ACL – Layered Security for a Public Subnet**

**Project Overview**



**Implemented a custom AWS Network Access Control List (NACL) to provide subnet-level traffic filtering in Amazon VPC.**



**AWS Configuration**

**Region: ap-south-1 (Mumbai)**

**VPC ID: vpc-082185a0fbb302aef**

**VPC CIDR: 172.31.0.0/16**

**Public Subnet ID: subnet-09342d17a9d77d4ed**

**Subnet CIDR: 172.31.0.0/20**

**Custom NACL ID: acl-029fbec5a8d2918b2**

**Inbound Rules**

**Rule	Protocol	Port	Action	Source**

**100	TCP	80	Allow	0.0.0.0/0**

**110	TCP	443	Allow	0.0.0.0/0**

**Outbound Rules**

**Rule	Protocol	Port	Action	Destination**

**100	All	All	Allow	0.0.0.0/0**

**Implementation Steps**

**Inspected existing VPC and subnets.**

**Identified the public subnet and its route table.**

**Inspected existing Network ACLs.**

**Created a custom Network ACL.**

**Configured inbound HTTP and HTTPS rules.**

**Configured outbound allow-all rule.**

**Associated the custom NACL with the public subnet.**

**Verified NACL rules and subnet association.**

**Key Learnings**

**Network ACLs operate at subnet level.**

**NACLs are stateless.**

**NACL rules are evaluated in ascending rule-number order.**

**Security Groups and NACLs provide different security layers.**

**Return traffic must be explicitly permitted by NACL rules.**

**Screenshots**



**See the screenshots/ directory for implementation evidence.**



**Architecture**



**See architecture/nacl-architecture.mmd.**



**Cleanup**



**Restore the original subnet NACL association and delete the custom NACL when the practical is complete.**



**Cost Considerations**



**Network ACLs do not have an additional charge. Avoid unnecessary billable infrastructure.**

