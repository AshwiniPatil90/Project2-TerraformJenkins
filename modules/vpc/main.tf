#Create VPC
resource "aws_vpc" "vpc1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "${var.project_name}-vpc-${terraform.workspace}"
    Environment = "Dev"
    Terraform   = true
  }
}

#Create InternetGateway and attach it to VPC
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "${var.project_name}-igw-${terraform.workspace}"
  }
}

# Use data source to get all avalablility zones in region
data "aws_availability_zones" "avalablility_zones" {}

#Create public subnet in az-1
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.pub_sub_1a_cidr
  availability_zone       = data.aws_availability_zones.avalablility_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-publlic_sub_1a-${terraform.workspace}"
  }
}

#Create public subnet in az-2
resource "aws_subnet" "public_subnet_2b" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.pub_sub_2b_cidr
  availability_zone       = data.aws_availability_zones.avalablility_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public_sub_2b-${terraform.workspace}"
  }
}

#Create Route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = "${var.project_name}-public_rt-${terraform.workspace}"
  }
}

#Associate public subnet pub-sub-1a to public route table
resource "aws_route_table_association" "public_sub_1a_route_tb_association" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

#Associate public subnet pub-sub-2b to public route table
resource "aws_route_table_association" "public_sub_2b_route_tb_association" {
  subnet_id      = aws_subnet.public_subnet_2b.id
  route_table_id = aws_route_table.public_route_table.id
}

#Create private subnet for application in az-1 i.e private-sub-3a
resource "aws_subnet" "private_subnet_3a" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.pri_sub_3a_cidr
  availability_zone       = data.aws_availability_zones.avalablility_zones.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-private-sub-3a-${terraform.workspace}"
  }
}

#Create private subnet private-sub-4b in az-2
resource "aws_subnet" "private_subnet_4b" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.pri_sub_4b_cidr
  availability_zone       = data.aws_availability_zones.avalablility_zones.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name}-private-sub-4b-${terraform.workspace}"
  }
}
