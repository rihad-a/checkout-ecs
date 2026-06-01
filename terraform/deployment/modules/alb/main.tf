# Creating an application load balancer

resource "aws_lb" "ecs-checkout" {
  name               = "ecs-checkout"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  
}

# Creating security group for the load balancer

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.cidr_block
  from_port         = var.port_https
  ip_protocol       = "tcp"
  to_port           = var.port_https
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.cidr_block
  from_port         = var.port_http
  ip_protocol       = "tcp"
  to_port           = var.port_http
}


resource "aws_vpc_security_group_egress_rule" "all_traffic" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = var.cidr_block
  ip_protocol       = "-1"
}

# Creating target group and listeners

resource "aws_lb_target_group" "http" {
  name     = "http-tg"
  port     = var.port_http
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.ecs-checkout.arn
  port              = var.port_https
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.ecs-checkout.arn
  port              = var.port_http
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = var.port_https
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}