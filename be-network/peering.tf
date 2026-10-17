data "terraform_remote_state" "fe_network" {
  backend = "remote"
  config = {
    organization = "Pwint_Org1"
    workspaces   = { name = "fe-network-ws" }
  }
}

resource "aws_vpc_peering_connection" "be_to_fe" {
  vpc_id      = aws_vpc.backend_vpc.id
  peer_vpc_id = data.terraform_remote_state.fe_network.outputs.frontend_vpc_id
  auto_accept = true
  tags        = { Name = "fe-to-be-peering" }
}

# Routes via Peering Connection
resource "aws_route" "be_to_fe_route" {
  route_table_id            = aws_vpc.backend_vpc.default_route_table_id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.be_to_fe.id
}