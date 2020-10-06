provider "aws" {
  region = "ap-northeast-1"
  alias  = "japan"
}

data terraform_remote_state "this" {
  backend = "remote"

  config = {
    organization = var.tfc_org
    workspaces = {
      name = var.tfc_ws
    }
  }
}

locals {
  public_subnets = data.terraform_remote_state.this.outputs.public_subnets_japan
  vpc_id         = data.terraform_remote_state.this.outputs.vpc_id_japan
}

module "nomad" {
  providers = {
    aws = aws.japan
  }

  source  = "hashicorp/nomad/aws"
  version = "0.6.7"

  vpc_id = local.vpc_id

  ami_id        = var.ami
  num_clients   = var.num_clients
  num_servers   = var.num_servers
  ssh_key_name  = var.ssh_key_name
  instance_type = var.instance_type
}
