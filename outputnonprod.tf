output "instance_id1" {

  description = "ID of the Linux Amazon EC2 instance"

  value       = aws_instance.amazonlinuxec2.id

}
output "instance_id2" {

  description = "ID of the SUSE Linux EC2 instance"

  value       = aws_instance.suselinuxec2.id

}
output "instance_id3" {

  description = "ID of the Linux Ubuntu EC2 instance"

  value       = aws_instance.ubuntuec2.id

}
output "instance_id4" {

  description = "ID of the MS Windows EC2 instance"

  value       = aws_instance.windowsec2.id

}
output "instance_id5" {

  description = "ID of the Linux Red Hat EC2 instance"

  value       = aws_instance.redhatec2.id

}

