module "vpc" {
  source          = "./modules/vpc"
  region          = var.region
  project_name    = var.project_name
  vpc_cidr        = var.vpc_cidr
  pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_2b_cidr = var.pub_sub_2b_cidr
  pri_sub_3a_cidr = var.pri_sub_3a_cidr
  pri_sub_4b_cidr = var.pri_sub_4b_cidr


}

module "natgateway" {
  source        = "./modules/natgateway"
  vpc_id        = module.vpc.vpc_id
  project_name  = module.vpc.project_name
  igw_id        = module.vpc.internet_gateway_id
  pub_sub_1a_id = module.vpc.pub_sub_1a_id
  pub_sub_2b_id = module.vpc.pub_sub_2b_id
  pri_sub_3a_id = module.vpc.pri_sub_3a_id
  pri_sub_4b_id = module.vpc.pri_sub_4b_id
}

module "security-groups" {
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
  project_name = module.vpc.project_name
}

/*module "rds" {
  source            = "./modules/rds"
  allocated_storage = var.allocated_storage
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  project_name      = var.project_name
  db_username       = var.db_username
  db_password       = var.db_password
}*/
