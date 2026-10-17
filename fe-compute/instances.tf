resource "aws_instance" "fe_public_1" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = data.terraform_remote_state.network.outputs.fe_pub_1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.terraform_remote_state.security.outputs.fe_pub_sg_id]
  key_name                    = aws_key_pair.generated_key.key_name
  tags                        = { Name = "public-instance-01" }
}

resource "aws_instance" "fe_private_1" {
  ami                    = data.aws_ami.ubuntu_24.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.network.outputs.fe_pri_1_id
  vpc_security_group_ids = [data.terraform_remote_state.security.outputs.fe_pri_sg_1_id]
  key_name               = aws_key_pair.generated_key.key_name
  tags                   = { Name = "private-instance-01" }
}

resource "aws_instance" "fe_private_2" {
  ami                    = data.aws_ami.ubuntu_24.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.network.outputs.fe_pri_2_id
  vpc_security_group_ids = [data.terraform_remote_state.security.outputs.fe_pri_sg_2_id]
  key_name               = aws_key_pair.generated_key.key_name
  tags                   = { Name = "private-instance-02" }
}

resource "aws_instance" "fe_private_3" {
  ami                    = data.aws_ami.ubuntu_24.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.network.outputs.fe_pri_3_id
  vpc_security_group_ids = [data.terraform_remote_state.security.outputs.fe_pri_sg_3_id]
  key_name               = aws_key_pair.generated_key.key_name
  tags                   = { Name = "private-instance-03" }
}