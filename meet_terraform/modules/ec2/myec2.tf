resource "aws_instance" "my_ec2" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = ["default"]
  key_name = "${var.key_name}"

  tags {
     Name = "web-server"
 }

 provisioner "remote-exec" {
   inline = [
     "sudo yum -y install epel-release",
     "sudo yum -y install nginx",
     "sudo service nginx start"
   ]
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = "${file("../../new_relic.pem")}"
   }
 }

}
