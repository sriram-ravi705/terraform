resource "aws_lb_target_group" "lb_target_group" {
  protocol = "HTTP"
  port     = 80
  vpc_id   = module.vpc.vpc_id

  tags = {
    Name = "target_group"
  }
}

resource "aws_lb_target_group_attachment" "target_group_ec2_a1_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.a1_ec2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "target_group_ec2_b1_attachment" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.b1_ec2.id
  port             = 80
}