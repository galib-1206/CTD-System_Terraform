output "ctd_subnet1_id" {
  value = aws_subnet.ctd_subnet1.id
}

output "ctd_subnet2_id" {
  value = aws_subnet.ctd_subnet2.id
}

output "vpc_security_group_ids" {
  value = aws_security_group.security_group_1.id
}

output "vpc_id" {
  value = aws_vpc.ctd_vpc.id
}