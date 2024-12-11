output "region" {
  value = var.region
}
output "project_name" {
  value = var.project_name
}
output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "pub_sub_1a_id" {
  value = aws_subnet.public_subnet_1a.id
}
output "pub_sub_2b_id" {
  value = aws_subnet.public_subnet_2b.id
}

output "pri_sub_3a_id" {
  value = aws_subnet.private_subnet_3a.id
}

output "pri_sub_4b_id" {
  value = aws_subnet.private_subnet_4b.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.demo_igw.id
}
