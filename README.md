Here's an example `README.md` file for your Terraform project that sets up an EKS cluster along with VPC and security groups. This file provides an overview of the project, prerequisites, how to use the Terraform files, and how to apply the configuration.

---

# Terraform Project for EKS Cluster with VPC and Security Groups

This project provisions an Amazon Elastic Kubernetes Service (EKS) cluster using Terraform. It also creates the necessary networking components like a Virtual Private Cloud (VPC), subnets, and security groups to support the EKS cluster.

## Table of Contents

- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Variables](#variables)
- [Usage](#usage)
- [Outputs](#outputs)
- [Notes](#notes)

## Project Overview

This Terraform project automates the following:

- Provisioning of an **EKS Cluster**.
- Creation of a **VPC** with public and private subnets across multiple Availability Zones (AZs).
- Configuration of **Security Groups** for controlling access to EKS nodes and services.
- Optional: **IAM roles** for worker nodes and necessary permissions for EKS to interact with other AWS services.

## Prerequisites

Before starting, ensure you have the following:

1. **Terraform** installed (version 1.x.x or higher). You can download Terraform from [here](https://www.terraform.io/downloads).
2. **AWS CLI** configured with credentials for accessing your AWS account.
3. **kubectl** installed for interacting with the EKS cluster.
4. A blank **S3 bucket** and **DynamoDB table** for Terraform state management (optional, if using remote state).

## Setup Instructions

1. **Clone the Repository**
   
   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/your-repo/terraform-eks-vpc.git
   cd terraform-eks-vpc
   ```

2. **Set AWS Credentials**

   Make sure your AWS credentials are set up properly:

   ```bash
   export AWS_ACCESS_KEY_ID=your-access-key
   export AWS_SECRET_ACCESS_KEY=your-secret-key
   ```

3. **Initialize Terraform**

   Initialize the project by running the following command in the project root directory. This will download necessary provider plugins:
 
   terraform init
 

## Variables

Below are the key variables used in this project. You can update these variables in `terraform.tfvars` or pass them as command-line arguments when running Terraform.

| Variable                    | Description                               | Default Value  |
|-----------------------------|-------------------------------------------|----------------|
| `cluster_name`               | Name of the EKS cluster                   | `eks-cluster`  |
| `vpc_cidr`                   | CIDR block for the VPC                    | `10.0.0.0/16`  |
| `private_subnet_cidrs`       | CIDR blocks for the private subnets       | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `public_subnet_cidrs`        | CIDR blocks for the public subnets        | `["10.0.3.0/24", "10.0.4.0/24"]` |
| `instance_type`              | EC2 instance type for EKS worker nodes    | `t3.medium`    |
| `desired_capacity`           | Desired number of EKS worker nodes        | `2`            |
| `max_size`                   | Maximum number of worker nodes            | `3`            |
| `min_size`                   | Minimum number of worker nodes            | `1`            |
| `region`                     | AWS region to deploy the cluster          | `ap-south-1`    |

## Usage

### Steps to Provision EKS Cluster and VPC

1. **Configure Variables**

   Update the `terraform.tfvars` file or pass the variables via the command line:

   ```bash
   cluster_name       = "my-eks-cluster"
   vpc_cidr           = "10.0.0.0/16"
   private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
   public_subnet_cidrs  = ["10.0.3.0/24", "10.0.4.0/24"]
   ```

2. **Plan the Infrastructure**

   Run Terraform `plan` to see the changes that will be made by Terraform:

   ```bash
   terraform plan
   ```

3. **Apply the Infrastructure**

   Apply the configuration to create the EKS cluster, VPC, and other resources:

   ```bash
   terraform apply
   ```

   This command will ask for confirmation. Type `yes` to proceed.

4. **Configure kubectl**

   Once the EKS cluster is created, configure your `kubectl` to interact with it:

   ```bash
   aws eks --region <region> update-kubeconfig --name <cluster_name>
   ```

   Example:

   ```bash
   aws eks --region us-west-2 update-kubeconfig --name my-eks-cluster
   ```

5. **Verify the Cluster**

   Use `kubectl` to check if the EKS cluster is running successfully:

   ```bash
   kubectl get nodes
   ```

### Clean Up Resources

To clean up and delete the resources provisioned by this project:

```bash
terraform destroy
```

## Outputs

This Terraform project provides the following outputs:

- **EKS Cluster Name**: The name of the EKS cluster.
- **VPC ID**: The ID of the VPC created for the cluster.
- **Security Group IDs**: The IDs of the security groups created.
- **Private and Public Subnet IDs**: The IDs of the private and public subnets.
  
After running `terraform apply`, you can retrieve the outputs by running:

```bash
terraform output
```

## Notes

- The `kubeconfig` file is required to interact with your EKS cluster. This is automatically generated using the AWS CLI after the cluster is created.
- The VPC is set up across multiple Availability Zones (AZs) for high availability.
- Security groups are configured to allow inbound traffic on ports required by the EKS cluster.

---

Feel free to modify this README as per your project specifics.
