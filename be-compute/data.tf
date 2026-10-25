data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "Pwint_Org1"
    workspaces   = { name = "be-network" }
  }
}

data "terraform_remote_state" "security" {
  backend = "remote"
  config = {
    organization = "Pwint_Org1"
    workspaces   = { name = "be-security" }
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

data "aws_ami" "ubuntu_24" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}