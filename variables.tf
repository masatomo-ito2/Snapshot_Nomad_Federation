# Required

variable ami {
	default = "ami-xxxxxxxxxxxxxx"
	description = "作成されたAMIのID"
}

variable tfc_org {
	default = "xxxxxx"
	description = "VPCなどの情報があるOrg名"
}

variable tfc_ws {
	default = "xxxxxxxxx"
	description = "VPCなどの情報を含んだStateのWorkspace"
}

variable ssh_key_name {
	default = "xxxxx"
	description "インスタンスにSSHするためのKey pair"
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
