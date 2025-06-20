resource "aws_lb" "this" {
  for_each = var.albs

  name               = each.key
  internal           = each.value.internal
  load_balancer_type = "application"
  security_groups    = each.value.security_group_ids
  subnets            = each.value.subnet_ids

  tags = {
    Name = each.key
  }
}

resource "aws_lb_target_group" "this" {
  for_each = var.albs

  name     = "${each.key}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = each.value.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "this" {
  for_each          = var.albs
  load_balancer_arn = aws_lb.this[each.key].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[each.key].arn
  }
}
