provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  environment = var.environment
}

module "ec2" {
  source = "./modules/ec2"
  environment = var.environment
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "lb" {
  source = "./modules/lb"
  environment = var.environment
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}
