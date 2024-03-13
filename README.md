# nonProd
Terraform code for the capstone project's non-production environment. This VPC will be hosting 5 virtual machines running the following operating systems: Amazon Linux, MacOS, Ubuntu Linux, MS Windows and Red Hat Linux.

Notes from 1st deployment:

***I get the following error for the MacOS VM:
Error: creating EC2 Instance: InvalidParameterValue: The architecture 'x86_64,i386' of the specified instance type does not match the architecture 'x86_64_mac' of the specified AMI. Specify an instance type and an AMI that have matching architectures, and try again. You can use 'describe-instance-types' or 'describe-images' to discover the architecture of the instance type or AMI.
│ 	status code: 400, request id: 9332eec0-b3ca-4668-9185-8712739d4c08
│ 
│   with aws_instance.macosec2,
│   on ec2.tf line 55, in resource "aws_instance" "macosec2":
│   55: resource "aws_instance" "macosec2" {


***A private subnet cannot connect directly to the internet. I need to configure a NAT gateway with an elastic IP address.
Instructions: https://krishnendubhowmick.medium.com/how-to-access-internet-on-aws-ec2-under-a-private-subnet-165b2ef260c6
