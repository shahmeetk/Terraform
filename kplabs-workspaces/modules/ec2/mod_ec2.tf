resource "aws_instance" "myweb" {
   ami = "ami-bf5540df"
   instance_type = "${lookup(var.instance_type, terraform.workspace)}"
   security_groups = ["default"]

   tags {
      Name = "web-server"
  }

}


/*
default - t2.nano
dev  - t2.micro
prd  - m4.large
*/
