resource "aws_instance" "my_vm" {
 ami           = var.ami
 instance_type = var.instance_type
 Region        = us-east-1

 tags = {
   Name = var.name_tag,
 }
}
