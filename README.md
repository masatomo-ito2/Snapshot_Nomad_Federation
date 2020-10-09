# Snapshot_Nomad_Federation

## HashiCorp Snapshot demo for Nomad Federation 1

### Steps

1. Clone this repo

2. Build AMI using Snapshot_Nomad_Federation/terraform-aws-nomad/examples/nomad-consul-ami/nomad-consul.json. You would have to run `packer build` twice for two regions by changing `aws_region` in packer config. (i.e. ap-northeast-1 and ap-southeast-2)
```
packer build nomad-consul.json
```

Specify consul/nomad version to install in packer config. (`nomad_verision` and `consul_version`)

3. Push this repo to git based VCS (github, gitlab, bitbucket, etc)
	
4. Set up TFC Workspace
	- See variables.tf for required variables.
	- Please use Ubuntu AMI
	- Set up VCS integration with your repo created at step 3.

5. Queue plan

6. Once provigioning finished, you ssh into either of servers. Server IP should be obtained by terraform output nomad_server_ips_{aws region}. And run,
```
nomad server join {nomad server ip of other region}
```

If you use Enterprise binary, you would need to manually enter a valid license.
```
nomad license put ...
```
```
consul license put ...
```

7. Enjoy multi-cloud federation!


## To do
* [done] Install docker to clients
* [____] Automate `nomad server join` process.
	- Use `null_resource` with remote provisioner to run the command after all provisioning. It only needs to be done in either of servers.
* [____] Mechanism to enter a license for enterprise binary.
	- Use `null_resourxce` to run remote provisioner, execute `nomad license put`.






