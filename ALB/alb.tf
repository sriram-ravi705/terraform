locals {
  subnet1 = module.vpc.public_subnets[0]
  subnet2 = module.vpc.public_subnets[1]
}


resource "aws_lb" "alb" {
  security_groups = [aws_security_group.sg_aws.id]
  subnets         = [local.subnet1, local.subnet2]
  tags = {
    Name = "aws_lb"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}