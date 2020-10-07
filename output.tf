# Tokyo
output "security_group_id_servers_japan" {
  value = module.nomad_japan.security_group_id_servers
}

output "aws_region_japan" {
  value = module.nomad_japan.aws_region
}

output "nomad_client_ips_japan" {
  value = module.nomad_japan.public_ip_clients
}

output "nomad_server_ips_japan" {
  value = module.nomad_sydney.public_ip_servers
}

# Sydney
output "security_group_id_servers_sydney" {
  value = module.nomad_sydney.security_group_id_servers
}

output "aws_region_sydney" {
  value = module.nomad_sydney.aws_region
}

output "nomad_client_ips_sydney" {
  value = module.nomad_sydney.public_ip_clients
}

output "nomad_server_ips_sydney" {
  value = module.nomad_sydney.public_ip_servers
}
