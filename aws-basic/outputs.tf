# Outputs de EC2
output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.web_server.private_ip
}

output "public_dns" {
  description = "Public DNS of the EC2"
  value       = aws_instance.web_server.public_dns
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web_server.id
}

output "instance_state" {
  description = "State of the EC2 instance"
  value       = aws_instance.web_server.instance_state
}

output "instance_type" {
  description = "Type of the EC2 instance"
  value       = aws_instance.web_server.instance_type
}

# Outputs de Route Table
output "route_table_all_rules" {
  description = "All routes in the route table"
  value       = aws_route_table.public_route_table.route
}

output "route_table_vpc" {
  description = "VPC associated with the route table"
  value       = aws_route_table.public_route_table.vpc_id
}

output "route_table_subnets" {
  description = "Subnet associated with the route table"
  value       = aws_route_table_association.public_rta.subnet_id
}

# Outputs de Security Group
output "security_group_ingress_rules" {
  description = "Ingress rules for the security group"
  value       = aws_security_group.web_sg.ingress
}

output "security_group_egress_rules" {
  description = "Egress rules for the security group"
  value       = aws_security_group.web_sg.egress
}

output "security_group_vpc" {
  description = "VPC associated with the security group"
  value       = aws_security_group.web_sg.vpc_id
}

# Network Summary
output "network_summary" {
  description = "Summary of the network resources"
  value = {
    vpc_id                 = aws_vpc.main.id
    route_table_id         = aws_route_table.public_route_table.id
    route_table_vpc        = aws_route_table.public_route_table.vpc_id
    route_table_routes     = aws_route_table.public_route_table.route
    associated_subnet      = aws_route_table_association.public_rta.subnet_id
    security_group_id      = aws_security_group.web_sg.id
    security_group_vpc     = aws_security_group.web_sg.vpc_id
    security_group_ingress = aws_security_group.web_sg.ingress
    security_group_egress  = aws_security_group.web_sg.egress
  }
}

output "route_table_all_rules_jsonformat" {
  description = "All routes in the route table (JSON format)"
  value       = jsonencode(aws_route_table.public_route_table.route)
}


/*Here the Outputs when applyed Terraform Apply, To analize the  later:
Outputs:

instance_id = "i-050a68b6837b036f9"
instance_state = "running"
instance_type = "t3.micro"
network_summary = {
  "associated_subnet" = "subnet-080f8f5c5a9bc9fd0"
  "route_table_id" = "rtb-0b569e25050b5e851"
  "route_table_routes" = toset([
    {
      "carrier_gateway_id" = ""
      "cidr_block" = "0.0.0.0/0"
      "core_network_arn" = ""
      "destination_prefix_list_id" = ""
      "egress_only_gateway_id" = ""
      "gateway_id" = "igw-00b532b674f94d714"
      "ipv6_cidr_block" = ""
      "local_gateway_id" = ""
      "nat_gateway_id" = ""
      "network_interface_id" = ""
      "transit_gateway_id" = ""
      "vpc_endpoint_id" = ""
      "vpc_peering_connection_id" = ""
    },
  ])
  "route_table_vpc" = "vpc-0d89a3109b784d306"
  "security_group_egress" = toset([
    {
      "cidr_blocks" = tolist([
        "0.0.0.0/0",
      ])
      "description" = ""
      "from_port" = 0
      "ipv6_cidr_blocks" = tolist([])
      "prefix_list_ids" = tolist([])
      "protocol" = "-1"
      "security_groups" = toset([])
      "self" = false
      "to_port" = 0
    },
  ])
  "security_group_id" = "sg-0b7c0640dab5d4368"
  "security_group_ingress" = toset([
    {
      "cidr_blocks" = tolist([
        "0.0.0.0/0",
      ])
      "description" = "HTTP"
      "from_port" = 80
      "ipv6_cidr_blocks" = tolist([])
      "prefix_list_ids" = tolist([])
      "protocol" = "tcp"
      "security_groups" = toset([])
      "self" = false
      "to_port" = 80
    },
    {
      "cidr_blocks" = tolist([
        "0.0.0.0/0",
      ])
      "description" = "SSH"
      "from_port" = 22
      "ipv6_cidr_blocks" = tolist([])
      "prefix_list_ids" = tolist([])
      "protocol" = "tcp"
      "security_groups" = toset([])
      "self" = false
      "to_port" = 22
    },
  ])
  "security_group_vpc" = "vpc-0d89a3109b784d306"
  "vpc_id" = "vpc-0d89a3109b784d306"
}
private_ip = "10.0.1.137"
public_dns = ""
public_ip = "13.51.156.237"
route_table_all_rules = toset([
  {
    "carrier_gateway_id" = ""
    "cidr_block" = "0.0.0.0/0"
    "core_network_arn" = ""
    "destination_prefix_list_id" = ""
    "egress_only_gateway_id" = ""
    "gateway_id" = "igw-00b532b674f94d714"
    "ipv6_cidr_block" = ""
    "local_gateway_id" = ""
    "nat_gateway_id" = ""
    "network_interface_id" = ""
    "transit_gateway_id" = ""
    "vpc_endpoint_id" = ""
    "vpc_peering_connection_id" = ""
  },
])
route_table_all_rules_jsonformat = "[{\"carrier_gateway_id\":\"\",\"cidr_block\":\"0.0.0.0/0\",\"core_network_arn\":\"\",\"destination_prefix_list_id\":\"\",\"egress_only_gateway_id\":\"\",\"gateway_id\":\"igw-00b532b674f94d714\",\"ipv6_cidr_block\":\"\",\"local_gateway_id\":\"\",\"nat_gateway_id\":\"\",\"network_interface_id\":\"\",\"transit_gateway_id\":\"\",\"vpc_endpoint_id\":\"\",\"vpc_peering_connection_id\":\"\"}]"
route_table_subnets = "subnet-080f8f5c5a9bc9fd0"
route_table_vpc = "vpc-0d89a3109b784d306"
security_group_egress_rules = toset([
  {
    "cidr_blocks" = tolist([
      "0.0.0.0/0",
    ])
    "description" = ""
    "from_port" = 0
    "ipv6_cidr_blocks" = tolist([])
    "prefix_list_ids" = tolist([])
    "protocol" = "-1"
    "security_groups" = toset([])
    "self" = false
    "to_port" = 0
  },
])
security_group_ingress_rules = toset([
  {
    "cidr_blocks" = tolist([
      "0.0.0.0/0",
    ])
    "description" = "HTTP"
    "from_port" = 80
    "ipv6_cidr_blocks" = tolist([])
    "prefix_list_ids" = tolist([])
    "protocol" = "tcp"
    "security_groups" = toset([])
    "self" = false
    "to_port" = 80
  },
  {
    "cidr_blocks" = tolist([
      "0.0.0.0/0",
    ])
    "description" = "SSH"
    "from_port" = 22
    "ipv6_cidr_blocks" = tolist([])
    "prefix_list_ids" = tolist([])
    "protocol" = "tcp"
    "security_groups" = toset([])
    "self" = false
    "to_port" = 22
  },
])
security_group_vpc = "vpc-0d89a3109b784d306"
ernesto@ECM:~/terraform/tf-projects/aws-basic$ 
*/