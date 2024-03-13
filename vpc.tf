# Create the VPC

resource "aws_vpc" "nonprod" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
  
  tags = {
     Name = "Non-Prod VPC"
  }
}

#Create Private Subnet 

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.nonprod.id
  cidr_block = "10.0.0.0/28"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "Private Subnet"
  }
}

#Create Internet Gateway 

resource "aws_internet_gateway" "np_igw" {
  vpc_id = aws_vpc.nonprod.id

  tags = {
    Name = "Non-Prod IGW"
  }
}

#Create Route Table for the private subnet

resource "aws_route_table" "np_rt" {
  vpc_id = aws_vpc.nonprod.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "private_rta" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.np_rt.id
}


