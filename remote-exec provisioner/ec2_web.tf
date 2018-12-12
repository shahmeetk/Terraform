

resource "aws_instance" "myweb" {
   ami = "ami-bf5540df"
   instance_type = "t2.micro"
   security_groups = ["${aws_security_group.mysg.name}"]
   key_name = "remotepractical"

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
      private_key = "${file("./remotepractical.pem")}"
    }
  }

}
