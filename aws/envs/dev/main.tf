module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr        = "10.10.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnets = ["10.10.101.0/24", "10.10.102.0/24"]

  tags = {
    Owner = "Swecha"
  }
}

module "security" {
  source = "../../modules/security"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id

  ssh_cidr = ""

  tags = {
    Owner = "Swecha"
  }
}

module "alb" {
  source = "../../modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id

  tags = {
    Owner = "Swecha"
  }
}

module "compute" {
  source = "../../modules/compute"

  project_name       = var.project_name
  environment        = var.environment
  private_subnet_ids = module.vpc.private_subnet_ids
  app_sg_id          = module.security.app_sg_id
  target_group_arn   = module.alb.target_group_arn

  instance_type    = "t3.micro"
  desired_capacity = 2
  min_size         = 2
  max_size         = 3

  tags = {
    Owner = "Swecha"
  }
}
