data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "Pwint_Org1"
    workspaces   = { name = "fe-network" }
  }
}