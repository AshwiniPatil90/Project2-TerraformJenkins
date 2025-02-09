variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "pub_sub_1a_cidr" {}
variable "pub_sub_2b_cidr" {}
variable "pri_sub_3a_cidr" {}
variable "pri_sub_4b_cidr" {}
variable "allocated_storage" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
#variable "pri_sub_5a_cidr" {}
#variable "pri_sub_6b_cidr" {}

#variable "certificate_domain_name" {}
#variable "additional_domain_name" {}
