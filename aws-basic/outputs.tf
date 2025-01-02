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
  value       = aws_instance.web_server.state
}

output "instance_type" {
  description = "Type of the EC2 instance"
  value       = aws_instance.web_server.instance_type
}


output "route_table_all_rules" {
  description = "All routes in the route table"
  value       = aws_route_table.public_route_table.route
}

output "route_table_vpc" {
  description = "VPC associated with the route table"
  value       = aws_route_table.public_route_table.vpc_id
}

output "route_table_subnets" {
  description = "Subnets associated with the route table"
  value       = aws_route_table_association.public_subnets.subnet_id
}

output "security_group_ingress_rules" {
  description = "Ingress rules for the security group"
  value       = aws_security_group.my_security_group.ingress
}

output "security_group_egress_rules" {
  description = "Egress rules for the security group"
  value       = aws_security_group.my_security_group.egress
}

output "security_group_vpc" {
  description = "VPC associated with the security group"
  value       = aws_security_group.my_security_group.vpc_id
}


output "network_summary" {
  description = "Summary of the network resources"
  value = {
    vpc_id                 = aws_vpc.my_vpc.id
    route_table_id         = aws_route_table.public_route_table.id
    route_table_vpc        = aws_route_table.public_route_table.vpc_id
    route_table_routes     = aws_route_table.public_route_table.route
    associated_subnets     = aws_route_table_association.public_subnets[*].subnet_id
    security_group_id      = aws_security_group.my_security_group.id
    security_group_vpc     = aws_security_group.my_security_group.vpc_id
    security_group_ingress = aws_security_group.my_security_group.ingress
    security_group_egress  = aws_security_group.my_security_group.egress
  }
}


output "route_table_all_rules" {
  description = "All routes in the route table (JSON format)"
  value       = jsonencode(aws_route_table.public_route_table.route)
}
