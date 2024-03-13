# Create the VPC

resource "aws_vpc" "nonprod" {
  cidr_block = "10.0.0.0/24"  
  tags = {
     Name = "Non-Prod VPC"
  }
}

#Create Public Subnet 

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.nonprod.id
  cidr_block = "10.0.0.0/25"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Public Subnet"
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

# Create Elastic IP for NAT Gateway
resource "aws_eip" "eip" {
  vpc = true
}

#Create NAT Gateway 

# Create NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet.id
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

# Route internet-bound traffic from private subnet to NAT Gateway
resource "aws_route" "private_route_to_internet" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

