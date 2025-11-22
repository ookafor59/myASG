# Elastic IP setup (required)
resource "aws_eip" "nat" {
  domain           = "vpc"
  
  tags = {
    Name = "terraform-eip-for-nat"

  }

  depends_on = [ aws_internet_gateway.main ] # explicit dependency 
}

#And now, the NAT gateway setup
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id # implicit dependency
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "terraform-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}