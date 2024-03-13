# Create the VPC

provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "nonprod" {
  cidr_block = "10.0.0.0/24"  
  tags = {
     Name = "Non-Prod VPC"
  }
}

#Create Private Subnet 

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.nonprod.id
  cidr_block = "10.0.0.128/25"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "Private Subnet"
  }
}

#Create Route Table for the private subnet

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.nonprod.id
  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}


