resource "aws_eip" "myeip" {
  instance = "${aws_instance.my_ec2.id}"
}


output "ip_address" {
  value = "${aws_instance.my_ec2.public_ip}"
}
