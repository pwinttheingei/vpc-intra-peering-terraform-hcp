resource "aws_vpc" "frontend_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "hc-frontend-vpc" }
}

resource "aws_internet_gateway" "fe_igw" {
  vpc_id = aws_vpc.frontend_vpc.id
  tags   = { Name = "fe-igw" }
}

# Public Subnets
resource "aws_subnet" "fe_pub_1" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = { Name = "pub-subnet1" }
}
resource "aws_subnet" "fe_pub_2" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = { Name = "pub-subnet2" }
}
resource "aws_subnet" "fe_pub_3" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1c"
  tags              = { Name = "pub-subnet3" }
}

# Private Subnets
resource "aws_subnet" "fe_pri_1" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = "10.0.253.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = { Name = "pri-subnet1" }
}
resource "aws_subnet" "fe_pri_2" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = "10.0.254.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = { Name = "pri-subnet2" }
}
resource "aws_subnet" "fe_pri_3" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = "10.0.255.0/24"
  availability_zone = "ap-southeast-1c"
  tags              = { Name = "pri-subnet3" }
}

# Route Tables
resource "aws_route_table" "fe_pub_rt" {
  vpc_id = aws_vpc.frontend_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fe_igw.id
  }
  tags = { Name = "fe-public-rt" }
}

resource "aws_route_table_association" "fe_pub_assoc_1" {
  subnet_id      = aws_subnet.fe_pub_1.id
  route_table_id = aws_route_table.fe_pub_rt.id
}