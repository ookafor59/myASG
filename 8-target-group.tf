resource "aws_lb_target_group" "web_tier" {
name    = "web-tier-server-target-group"
port    = 80
protocol = "HTTP"
vpc_id  = aws_vpc.main.id

health_check {
    enabled = true
}

tags = {
    Name = "web-tier-tg"
    }
  
}