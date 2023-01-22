output "elb_dns_name" {
  value = aws_elb.web.dns_name
}
output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_id" {
  value = aws_subnet.web.id
}
output "security_group_id" {
  value = aws_security_group.web.id
}
output "autoscaling_group_name" {
  value = aws_autoscaling_group.web.name
}
