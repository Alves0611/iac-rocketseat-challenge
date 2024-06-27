terraform {
  backend "s3" {
    bucket = "my-terraform-state-staging"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source      = "../../modules/vpc"
  environment = "staging"
}

module "ec2" {
  source      = "../../modules/ec2"
  environment = "staging"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.subnet_ids
}

module "lb" {
  source      = "../../modules/lb"
  environment = "staging"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.subnet_ids
}
