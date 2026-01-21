# Multi-Cloud Infrastructure using Terraform (AWS)

## Overview
This project demonstrates a **production-grade AWS infrastructure** built using **Terraform with modular design and remote state management**.  
It provisions a secure and scalable application architecture using **VPC, Application Load Balancer (ALB), Auto Scaling Group (ASG), and EC2**, with Terraform state stored remotely in **S3** and locked using **DynamoDB**.

The infrastructure follows Infrastructure as Code (IaC) best practices and is designed to be reusable across environments.

---

## Architecture
**Traffic Flow:**

Internet  
→ Application Load Balancer (ALB)  
→ Target Group  
→ Auto Scaling Group  
→ EC2 Instances (Private Subnets)

---

## Technologies Used
- **Cloud Provider:** AWS
- **Infrastructure as Code:** Terraform
- **Compute:** EC2, Auto Scaling Group
- **Networking:** VPC, Public & Private Subnets, Security Groups
- **Load Balancing:** Application Load Balancer (ALB)
- **State Management:** S3 Remote Backend with DynamoDB Locking
- **Operating System:** Amazon Linux 2023

---

## Key Features
- Modular Terraform structure (`vpc`, `security`, `alb`, `compute`)
- Remote Terraform backend using S3 and DynamoDB
- Highly available and scalable architecture
- EC2 instances deployed in private subnets
- Load-balanced traffic using ALB
- Environment-based configuration (`dev`)
- Automated instance bootstrapping using user data

---

## Repository Structure
```text
multi-cloud-infrastructure-terraform/
├── bootstrap/
│   └── aws/                # S3 and DynamoDB backend bootstrap
├── aws/
│   ├── modules/
│   │   ├── vpc/
│   │   ├── security/
│   │   ├── alb/
│   │   └── compute/
│   └── envs/
│       └── dev/
│           ├── main.tf
│           ├── backend.tf
│           ├── providers.tf
│           ├── variables.tf
│           └── outputs.tf
└── README.md
