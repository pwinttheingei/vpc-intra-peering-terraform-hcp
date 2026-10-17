# Public Security Group
resource "aws_security_group" "be_pub_sg_01" {
  name   = "be-pub-sg-01"
  vpc_id = data.terraform_remote_state.network.outputs.backend_vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "be_pub_ssh" {
  security_group_id = aws_security_group.be_pub_sg_01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "be_pub_ping" {
  security_group_id = aws_security_group.be_pub_sg_01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "icmp"
  from_port         = 8
  to_port           = 0
}
resource "aws_vpc_security_group_egress_rule" "be_pub_egress" {
  security_group_id = aws_security_group.be_pub_sg_01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Private Security Group 01
resource "aws_security_group" "be_pri_sg_01" {
  name   = "be-pri-sg-01"
  vpc_id = data.terraform_remote_state.network.outputs.backend_vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "be_pri1_ssh" {
  security_group_id            = aws_security_group.be_pri_sg_01.id
  referenced_security_group_id = aws_security_group.be_pub_sg_01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}
resource "aws_vpc_security_group_ingress_rule" "be_pri1_ping" {
  security_group_id            = aws_security_group.be_pri_sg_01.id
  referenced_security_group_id = aws_security_group.be_pub_sg_01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}
resource "aws_vpc_security_group_egress_rule" "be_pri1_egress" {
  security_group_id = aws_security_group.be_pri_sg_01.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Private Security Group 02
resource "aws_security_group" "be_pri_sg_02" {
  name   = "be-pri-sg-02"
  vpc_id = data.terraform_remote_state.network.outputs.backend_vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "be_pri2_ssh" {
  security_group_id            = aws_security_group.be_pri_sg_02.id
  referenced_security_group_id = aws_security_group.be_pri_sg_01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}
resource "aws_vpc_security_group_ingress_rule" "be_pri2_ping" {
  security_group_id            = aws_security_group.be_pri_sg_02.id
  referenced_security_group_id = aws_security_group.be_pri_sg_01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}
resource "aws_vpc_security_group_egress_rule" "be_pri2_egress" {
  security_group_id = aws_security_group.be_pri_sg_02.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Private Security Group 03
resource "aws_security_group" "be_pri_sg_03" {
  name   = "be-pri-sg-03"
  vpc_id = data.terraform_remote_state.network.outputs.backend_vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "be_pri3_ssh" {
  security_group_id            = aws_security_group.be_pri_sg_03.id
  referenced_security_group_id = aws_security_group.be_pri_sg_01.id
  ip_protocol                  = "tcp"
  from_port                    = 22
  to_port                      = 22
}
resource "aws_vpc_security_group_ingress_rule" "be_pri3_ping" {
  security_group_id            = aws_security_group.be_pri_sg_03.id
  referenced_security_group_id = aws_security_group.be_pri_sg_01.id
  ip_protocol                  = "icmp"
  from_port                    = 8
  to_port                      = 0
}
resource "aws_vpc_security_group_egress_rule" "be_pri3_egress" {
  security_group_id = aws_security_group.be_pri_sg_03.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}