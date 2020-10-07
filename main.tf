provider "aws" {
  region = "ap-northeast-1"
  alias  = "japan"
}

provider "aws" {
  region = "ap-southeast-2"
  alias  = "sydney"
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
  public_subnets_japan  = data.terraform_remote_state.this.outputs.public_subnets_japan
  vpc_id_japan          = data.terraform_remote_state.this.outputs.vpc_id_japan
  public_subnets_sydney = data.terraform_remote_state.this.outputs.public_subnets_sydney
  vpc_id_sydney         = data.terraform_remote_state.this.outputs.vpc_id_sydney
}

# Nomad cluster in Japan
module "nomad_japan" {
  providers = {
    aws = aws.japan
  }

  source = "./terraform-aws-nomad"

  vpc_id        = local.vpc_id_japan
  public_subnet = local.public_subnets_japan

  ami_id        = var.ami
  num_clients   = var.num_clients
  num_servers   = var.num_servers
  ssh_key_name  = var.ssh_key_name_japan
  instance_type = var.instance_type
}

# Nomad cluster in Sydney
module "nomad_sydney" {
  providers = {
    aws = aws.sydney
  }

  source = "./terraform-aws-nomad"

  vpc_id        = local.vpc_id_sydney
  public_subnet = local.public_subnets_sydney

  ami_id        = var.ami
  num_clients   = var.num_clients
  num_servers   = var.num_servers
  ssh_key_name  = var.ssh_key_name_sydney
  instance_type = var.instance_type
}
