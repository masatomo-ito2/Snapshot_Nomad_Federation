# Required

variable ami {
	default = "ami-xxxxxxxxxxxxxx"
	description = "$B:n@.$5$l$?(BAMI$B$N(BID"
}

variable tfc_org {
	default = "xxxxxx"
	description = "VPC$B$J$I$N>pJs$,$"$k(BOrg$BL>(B"
}

variable tfc_ws {
	default = "xxxxxxxxx"
	description = "VPC$B$J$I$N>pJs$r4^$s$@(BState$B$N(BWorkspace"
}

variable ssh_key_name {
	default = "xxxxx"
	description "$B%$%s%9%?%s%9$K(BSSH$B$9$k$?$a$N(BKey pair"
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
