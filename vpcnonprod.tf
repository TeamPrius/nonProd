# Create the VPC

resource "aws_vpc" "nonprod" {
  cidr_block = "10.0.0.0/24"  
  tags = {
     Name = "Non-Prod VPC"
  }
}

#Create Private Subnet 

resource "aws_subnet" "private_subnet_nonprod" {
  vpc_id     = aws_vpc.nonprod.id
  cidr_block = "10.0.0.128/25"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "Private Subnet Non-Prod"
  }
}

#Create Route Table for the private subnet

resource "aws_route_table" "private_rt_nonprod" {
  vpc_id = aws_vpc.nonprod.id
  tags = {
    Name = "Private Route Table Non-Prod"
  }
}

resource "aws_route_table_association" "private_rta_nonprod" {
  subnet_id      = aws_subnet.private_subnet_nonprod.id
  route_table_id = aws_route_table.private_rt_nonprod.id
}


