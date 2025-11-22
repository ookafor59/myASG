resource "aws_autoscaling_group" "test" {
name = "web-server-asg"

 vpc_zone_identifier = [aws_subnet.private_a.id,
                        aws_subnet.private_b.id,
                        aws_subnet.private_c.id]
max_size            = 6
min_size            = 3
health_check_type   = "ELB"
target_group_arns   = [aws_lb_target_group.web_tier.arn]
force_delete = true

launch_template {
    id = aws_launch_template.web_tier.id
    version = "$Latest"
}

tag {
    key                 = "Name"
    value               = "web-instance"
    propagate_at_launch  = true
    }

}




