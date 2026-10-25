resource "aws_vpc" "backend_vpc1" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = "hc-backend-vpc" }
}

resource "aws_internet_gateway" "be_igw" {
  vpc_id = aws_vpc.backend_vpc1.id
  tags   = { Name = "be-igw" }
}

# Public Subnets
resource "aws_subnet" "be_pub_1" {
  vpc_id            = aws_vpc.backend_vpc1.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = { Name = "pub-subnet1" }
}
resource "aws_subnet" "be_pub_2" {
  vpc_id            = aws_vpc.backend_vpc1.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = { Name = "pub-subnet2" }
}
resource "aws_subnet" "be_pub_3" {
  vpc_id            = aws_vpc.backend_vpc1.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "ap-southeast-1c"
  tags              = { Name = "pub-subnet3" }
}

# Private Subnets
resource "aws_subnet" "be_pri_1" {
  vpc_id            = aws_vpc.backend_vpc1.id
  cidr_block        = "192.168.253.0/24"
  availability_zone = "ap-southeast-1a"
  tags              = { Name = "pri-subnet1" }
}
resource "aws_subnet" "be_pri_2" {
  vpc_id            = aws_vpc.backend_vpc1.id
  cidr_block        = "192.168.254.0/24"
  availability_zone = "ap-southeast-1b"
  tags              = { Name = "pri-subnet2" }
}
resource "aws_subnet" "be_pri_3" {
  vpc_id            = aws_vpc.backend_vpc1.id
  cidr_block        = "192.168.255.0/24"
  availability_zone = "ap-southeast-1c"
  tags              = { Name = "pri-subnet3" }
}

# Route Tables
resource "aws_route_table" "be_pub_rt" {
  vpc_id = aws_vpc.backend_vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.be_igw.id
  }
  tags = { Name = "be-public-rt" }
}

resource "aws_route_table_association" "be_pub_assoc_1" {
  subnet_id      = aws_subnet.be_pub_1.id
  route_table_id = aws_route_table.be_pub_rt.id
}