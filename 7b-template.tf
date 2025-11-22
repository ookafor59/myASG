resource "aws_launch_template" "web_tier" {
    name = "web-tier-server-template"
    description = "Launch template for web tier servers"

image_id = "ami-083b3f53cbda7e5a4"
instance_type = "t3.micro"
vpc_security_group_ids = [aws_security_group.web_server.id]

tags = {
    Name = "web-tier-server-template"
}

user_data = filebase64("user_data.sh")

lifecycle {

    create_before_destroy = true
}

}