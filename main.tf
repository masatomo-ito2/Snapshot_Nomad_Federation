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
  public_subnets_japan = data.terraform_remote_state.this.outputs.public_subnets_japan
  vpc_id_japan         = data.terraform_remote_state.this.outputs.vpc_id_japan
}

module "nomad" {
  providers = {
    aws = aws.japan
  }

  source = "./terraform-aws-nomad"

  vpc_id        = local.vpc_id_japan
  public_subnet = local.public_subnets_japan

  ami_id        = var.ami
  num_clients   = var.num_clients
  num_servers   = var.num_servers
  ssh_key_name  = var.ssh_key_name
  instance_type = var.instance_type
}

/*
resource "aws_eip" "nomad_server_ip" {
	instance = data.aws_instances.nomad_server_instances.ids[0]
	vpc = true
}

data "aws_instances" "nomad_server_instances" {
	instance_tags = {
		Name = "nomad-example-server"
	}
}

*/
/*
resource "aws_eip_association" "static_ip" {
	instance_id  = data.aws_instances.nomad_server_instances.ids[0]
	allocation_id = aws_eip.nomad_server_ip.id
}
*/
