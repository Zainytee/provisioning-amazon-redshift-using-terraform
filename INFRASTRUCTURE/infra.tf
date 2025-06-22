data "aws_secretsmanager_random_password" "redshift_master_password" {
  password_length = 10
  exclude_numbers = false
  exclude_punctuation = true
}

resource "aws_ssm_parameter" "secret" {
  name        = "/production/database/password/master"
  description = "The redshift master password"
  type        = "SecureString"
  value       = data.aws_secretsmanager_random_password.redshift_master_password

  tags = {
    environment = "production"
  }
}

resource "aws_redshift_cluster" "default" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "staging"
  master_username    = "stg"
  master_password    = data.aws_secretsmanager_random_password.redshift_master_password
  node_type          = "dc1.large"
  cluster_type       = "multi-node"
  number_of_nodes    = 3
  
}