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
  value = module.nomad_japan.public_ip_servers
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

# Demo steps

output "demo_commands" {
	value = <<EOF

* ssh into nomad server in ap-northeast-1	
ssh ubuntu@${module.nomad_japan.public_ip_servers}

* Nomad join
nomad server join ${module.nomad_sydney.public_ip_servers}

* Server status
nomad server members

* Run multi-region deployment
wget --quiet https://raw.githubusercontent.com/pandom/terraform-nomad-jobs/master/snapshot/multi.nomad
nomad job run multi.nomad

* Simulate demployment failure
wget --quiet https://raw.githubusercontent.com/masatomo-ito2/Snapshot_Nomad_Federation/main/job_file/fail.nomad
nomad job run fail.nomad

* Show status of deployment
nomad job status snapshot-cot-fail
 - or - 
nomad deployment status <deployment ID>
EOF
	
}
