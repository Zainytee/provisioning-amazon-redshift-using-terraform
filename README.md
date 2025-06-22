# Terraform Redshift Cluster Provisioning

This Terraform project provisions an Amazon Redshift cluster with 3 nodes and stores the master password securely in AWS Systems Manager (SSM) Parameter Store.

## 📁 Files Included

- `provider.tf` – Configures the AWS provider
- `backend.tf` – (Optional) Remote backend configuration

## Requirements

- Terraform ≥ 5.0
- AWS CLI configured


## Usage

1. Clone the repo:
   ```bash
   git clone https://github.com/Zainytee/provisioning-amazon-redshift-using-terraform.git
   cd provisioning-amazon-redshift-using-terraform.git


2. Create infra.tf file
   ```hcl
   resource "aws_redshift_cluster" "default" {
    cluster_identifier = "tf-redshift-cluster"
    database_name      = "staging"
    master_username    = "stg"
    master_password    = data.aws_secretsmanager_random_password.redshift_master_password
    node_type          = "dc1.large"
    cluster_type       = "multi-node"
    number_of_nodes    = 3
    
  }

3.  Initiate and apply
   ```hcl
    terraform plan
    terraform apply
