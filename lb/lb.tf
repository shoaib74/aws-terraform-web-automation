resource "aws_lb" "applb" {
  name               = "applb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ "launch-wizard-1" ]
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "shopapp"
  }
}