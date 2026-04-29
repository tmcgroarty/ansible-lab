provider "aws" {
  region = "us-east-2"
}

module "ec2" {
  source = "./modules/ec2"
}

module "kms" {
  source = "./modules/kms"
}

module "iam_role" {
  source = "./modules/iam_role"
}

module "rds" {
  source = "./modules/rds"
}
