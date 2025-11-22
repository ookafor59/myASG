resource "aws_security_group" "web_lb" {
  name        = "web-alb-sg"
  description = "Allow HTTP for web tier ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "web-alb-sg"
    Tier = "web"
  }
}

#Inbound rule #1 
resource "aws_vpc_security_group_ingress_rule" "web_lb_http" {

  security_group_id = aws_security_group.web_lb.id
  description       = "HTTP from internet"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


#Outbound rule
resource "aws_vpc_security_group_egress_rule" "web_lb_http" {
  security_group_id = aws_security_group.web_lb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

#Inbound  rule #2
resource "aws_vpc_security_group_ingress_rule" "web_lb_egress" {

  security_group_id = aws_security_group.web_lb.id
  description       = "allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

  

