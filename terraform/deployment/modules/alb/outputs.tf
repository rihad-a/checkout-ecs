output "alb_dns" {
  value = aws_lb.ecs-checkout.dns_name
}

output "alb_zoneid" {
  value = aws_lb.ecs-checkout.zone_id
}