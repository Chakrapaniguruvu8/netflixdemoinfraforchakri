provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count         = 4
  ami           = "ami-02d26659fd82cf299"
  instance_type = "t3.medium"
  key_name      = "chkpair"

  vpc_security_group_ids = [
    "sg-070eb542e17ea82af"
  ]

  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = [
    "jenkins",
    "AppServer-1",
    "AppServer-2",
    "Monitoring server"
  ]
}
