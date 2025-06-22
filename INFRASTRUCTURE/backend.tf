terraform {
  backend "s3" {
    bucket = "zainy-terraform-state"
    key    = "production/production.tfstate"
    region = "eu-central-1"
  }
}
