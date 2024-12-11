resource "aws_security_group" "demo_security_group" {
  name        = "allow tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.project_name}-security_grp-${terraform.workspace}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_https" {
  security_group_id = aws_security_group.demo_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_http" {
  security_group_id = aws_security_group.demo_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_egress_all_traffic_ipv4" {
  security_group_id = aws_security_group.demo_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
