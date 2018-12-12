
variable "instance_type" {
  type = "map"

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd    = "m4.large"
  }
}
