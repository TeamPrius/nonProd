# nonProd
Terraform code for the capstone project's non-production environment. This VPC will be hosting 5 virtual machines running the following operating systems: Amazon Linux, XXXXXX, Ubuntu Linux, MS Windows and Red Hat Linux.

Notes from 2nd deployment:

***It looks like we cannot run MacOS on t2.micro, so we will have to choose another OS for that one. Maybe Debian Linux.

***Removed reference to the NAT gateway and any internet connection, and created a transit gateway. This will only work when we launch both the on-prem and non-prod environments in the same account.
