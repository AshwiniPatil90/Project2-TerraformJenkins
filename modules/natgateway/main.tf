#Create elastic ip for nat gateway
resource "aws_eip" "demo_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip-nat-a-${terraform.workspace}"
  }
}

#Create NAT gateway in public subnet 1a (Nat Gateway a)
resource "aws_nat_gateway" "demo_nat_gw_a" {
  allocation_id = aws_eip.demo_eip.id
  subnet_id     = var.pub_sub_1a_id

  tags = {
    Name = "${var.project_name}-NAT-gw-${terraform.workspace}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.igw_id]
}

#Create route table for private subnet private-rt-a and add route through Nat Gateway-a
resource "aws_route_table" "private_rt_a" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.demo_nat_gw_a.id
  }
  tags = {
    Name = "${var.project_name}-private-rt-a-${terraform.workspace}"
  }
}

#Associate private subnet-3a and 2b with private route table private_rt_a
resource "aws_route_table_association" "pri_sub_3a_with_pri_rt_a" {
  subnet_id      = var.pri_sub_3a_id
  route_table_id = aws_route_table.private_rt_a.id
}

resource "aws_route_table_association" "pri_sub_4b_with_pri_rt_a" {
  subnet_id      = var.pri_sub_4b_id
  route_table_id = aws_route_table.private_rt_a.id
}
