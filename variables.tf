# Required

variable ami {
	default = "ami-xxxxxxxxxxxxxx"
	description = "AMI ID to use"
}

variable tfc_org {
	default = "xxxxxx"
	description = "Org name that contains vpc settings"
}

variable tfc_ws {
	default = "xxxxxxxxx"
	description = "Workspace name that contains vpc state"
}

variable ssh_key_name {
	default = "xxxxx"
	description = "Keypair name to ssh"
}

# Optional 

variable num_clients {
	default = 1
}

variable num_servers {
	default = 1
}

variable instance_type {
	default = "t2.micro"
}
