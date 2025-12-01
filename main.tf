provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count         = 4
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t3.medium"
  key_name      = "ch1"

  vpc_security_group_ids = [
    "sg-0a31e6e15e2d29f54"
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
