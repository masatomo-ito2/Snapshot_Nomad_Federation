# Required

variable ami {
	default = "ami-xxxxxxxxxxxxxx"
}

variable tfc_org {
	default = "xxxxxx"
}

variable tfc_ws {
	default = "xxxxxxxxx"
}

variable ssh_key_name {
	default = "xxxxx"
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
