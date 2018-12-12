module "myec2" {
  source = "../../modules/ec2"
  instance_type = "m4.large"
}
