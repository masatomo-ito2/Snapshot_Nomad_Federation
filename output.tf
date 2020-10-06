output "launch_config_name_clients" {
  value = module.nomad.launch_config_name_clients
}

output "launch_config_name_servers" {
  value = module.nomad.launch_config_name_servers
}

output "security_group_id_clients" {
  value = module.nomad.security_group_id_clients
}

output "security_group_id_servers" {
  value = module.nomad.security_group_id_servers
}

output "asg_name_clients" {
  value = module.nomad.asg_name_clients
}

output "asg_name_servers" {
  value = module.nomad.asg_name_clients
}
output "aws_region" {
  value = module.nomad.aws_region
}
