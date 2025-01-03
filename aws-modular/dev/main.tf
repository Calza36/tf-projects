module "my_vpc" {
  source   = "../modules/vpc_module"
  vpc_cidr = var.dev_vpc_cidr
}

module "my_ec2" {
  source          = "../modules/ec2_module"
  instance_type   = var.dev_instance_type
  vpc_id          = module.my_vpc.vpc_id
  subnet_id       = module.my_vpc.public_subnet_id
  ...
}
