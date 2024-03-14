#Create security group

resource "aws_security_group" "nonprodsg" {
  name        = "nonprodsg"
  description = "Allow https traffic"
  vpc_id      = aws_vpc.nonprod.id

  tags = {
    Name = "App-SG"
  }
}

#Inbound rules

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.nonprodsg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


#Outbound rules

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.nonprodsg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# Create 1st EC2 instance

resource "aws_instance" "amazonlinuxec2" {
  ami              	 	= "ami-0f403e3180720dd7e"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address  = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprodsg.id}"]
  #user_data         		= filebase64("./userdata.sh")
  
  metadata_options {
    http_tokens   = "optional"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "Amazon Linux EC2"
  }
}

# Create 2nd EC2 instance

resource "aws_instance" "suselinuxec2" {
  ami              	 	= "ami-05efd9e66ddc3cf4b"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address  = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprodsg.id}"]
  #user_data         		= filebase64("./userdata.sh")
  
  metadata_options {
    http_tokens   = "optional"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "SUSE Linux EC2"
  }
}

# Create 3rd EC2 instance

resource "aws_instance" "ubuntuec2" {
  ami              	 	= "ami-07d9b9ddc6cd8dd30"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address  = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprodsg.id}"]
  #user_data         		= filebase64("./userdata.sh")
  
  metadata_options {
    http_tokens   = "optional"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "Linux Ubuntu EC2"
  }
}

# Create 4th EC2 instance

resource "aws_instance" "windowsec2" {
  ami              	 	= "ami-0f9c44e98edf38a2b"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address  = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprodsg.id}"]
  #user_data         		= filebase64("./userdata.sh")
  
  metadata_options {
    http_tokens   = "optional"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "MS Windows EC2"
  }
}

# Create 5th EC2 instance

resource "aws_instance" "redhatec2" {
  ami              	 	= "ami-0fe630eb857a6ec83"
  instance_type     		= "t2.micro"
  subnet_id         		= aws_subnet.private_subnet_nonprod.id
  availability_zone 		= "us-east-1a"
  associate_public_ip_address  = false
  vpc_security_group_ids 	= ["${aws_security_group.nonprodsg.id}"]
  #user_data         		= filebase64("./userdata.sh")
  
  metadata_options {
    http_tokens   = "optional"
    http_endpoint = "enabled"
  }

  tags = {
    Name = "Linux Red Hat EC2"
  }
}


