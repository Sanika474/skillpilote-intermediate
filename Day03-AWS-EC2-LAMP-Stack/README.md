# Day 03 – AWS EC2 LAMP Stack Deployment

## Objective
Deploy a LAMP stack (Linux, Apache, MariaDB, PHP) on an AWS EC2 instance and host a dynamic PHP webpage connected to a MariaDB database.

## AWS Infrastructure
- Cloud Provider: AWS
- Region: ap-south-1
- Operating System: Amazon Linux 2023
- Instance Type: t2.micro
- Web Server: Apache HTTP Server
- Database: MariaDB 10.5
- Backend: PHP 8.5
- Storage: EC2 EBS root volume
- Networking: VPC, public subnet, Internet Gateway and Security Group

## Implementation
1. Verified AWS VPC, subnet and Internet Gateway.
2. Configured EC2 security group for SSH and HTTP.
3. Launched Amazon Linux 2023 EC2 instance.
4. Installed Apache, MariaDB and PHP.
5. Started and enabled Apache and MariaDB services.
6. Created MariaDB database `skillpilote_lamp`.
7. Created visitors table and inserted sample records.
8. Connected PHP application to MariaDB.
9. Deployed a dynamic PHP webpage.
10. Verified application access through the EC2 public IP.

## Security
- SSH access restricted to the administrator's public IP.
- HTTP access enabled for website visitors.
- Database user restricted to localhost.
- Database credentials must be supplied securely and must not be committed to GitHub.

## Project Structure
- `php/` – PHP application source
- `scripts/` – Deployment and verification scripts
- `screenshots/` – Practical evidence
- `architecture/` – Architecture diagram

## Evidence
Screenshots are available in the `screenshots/` directory.

## Learning Outcomes
- Understanding AWS EC2 deployment.
- Configuring VPC networking and security groups.
- Installing and managing a LAMP stack.
- Connecting PHP applications with MariaDB.
- Hosting dynamic websites on AWS EC2.

## Cleanup
Terminate the EC2 instance and remove the Day 03 security group after completing verification and capturing all required evidence.