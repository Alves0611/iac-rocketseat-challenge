terraform {
  backend "s3" {
    bucket = "my-terraform-state-dev"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  environment = "dev"
}

module "ec2" {
  source = "../../modules/ec2"
  environment = "dev"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "lb" {
  source = "../../modules/lb"
  environment = "dev"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}
