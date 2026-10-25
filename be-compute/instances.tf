resource "aws_instance" "be_public_01" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = data.terraform_remote_state.network.outputs.be_pub_1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.terraform_remote_state.security.outputs.be_pub_sg_id]
  key_name                    = aws_key_pair.generated_key.key_name
  tags                        = { Name = "public-instance-1" }
}

resource "aws_instance" "be_private_1" {
  ami                    = data.aws_ami.ubuntu_24.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.network.outputs.be_pri_1_id
  vpc_security_group_ids = [data.terraform_remote_state.security.outputs.be_pri_sg_1_id]
  key_name               = aws_key_pair.generated_key.key_name
  tags                   = { Name = "private-instance-1" }
}

resource "aws_instance" "be_private_2" {
  ami                    = data.aws_ami.ubuntu_24.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.network.outputs.be_pri_2_id
  vpc_security_group_ids = [data.terraform_remote_state.security.outputs.be_pri_sg_2_id]
  key_name               = aws_key_pair.generated_key.key_name
  tags                   = { Name = "private-instance-2" }
}

resource "aws_instance" "be_private_3" {
  ami                    = data.aws_ami.ubuntu_24.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.network.outputs.be_pri_3_id
  vpc_security_group_ids = [data.terraform_remote_state.security.outputs.be_pri_sg_3_id]
  key_name               = aws_key_pair.generated_key.key_name
  tags                   = { Name = "private-instance-3" }
}