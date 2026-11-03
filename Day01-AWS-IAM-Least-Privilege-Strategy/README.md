# SkillPilote – Intermediate Level

## Overview
This repository contains hands-on practical implementations completed during the SkillPilote Intermediate AWS Cloud learning program.

## Learning Objectives
- Implement AWS security and IAM best practices.
- Configure cloud services using AWS Console and CLI.
- Apply least-privilege access control.
- Automate cloud operations using PowerShell.
- Document practical implementations and validation results.

## Practical Index

| Day | Practical | Status |
|---|---|---|
| Day 01 | AWS IAM Least-Privilege Strategy | Completed |

## Day 01 – AWS IAM Least-Privilege Strategy

**Objective:** Implement a least-privilege IAM strategy for a sample SkillPilote cloud application.

### Implementation
- Created three IAM groups: Developers, Deployers and Auditors.
- Created three custom IAM policies.
- Created restricted IAM test users.
- Assigned users to their corresponding groups.
- Tested allowed and denied permissions using the AWS IAM Policy Simulator.

### Permission Validation

| Role | Allowed action | Denied action |
|---|---|---|
| Developer | s3:GetObject | s3:DeleteObject |
| Deployer | lambda:UpdateFunctionCode | lambda:DeleteFunction |
| Auditor | dynamodb:Query | dynamodb:PutItem |

### Project Files
See the [Day 01 practical](Day01-AWS-IAM-Least-Privilege-Strategy/) for:
- IAM policy JSON files
- PowerShell scripts
- Architecture diagram source
- Practical screenshots
- Detailed documentation

## Technologies Used
- Amazon Web Services (AWS)
- AWS IAM
- AWS CLI
- Windows PowerShell 5.1
- Git and GitHub
- Mermaid

## Security
No AWS passwords, access keys, secret keys or other credentials are stored in this repository.

## Author
SkillPilote Intermediate Learning Project
