variable = "aws_access_key" {}
variable = "aws_secret_key" {}

provider "aws" {
  version ="~> 2.0"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
}

resource "aws_instance" "sandbox" {
  count		= 2
  ami		= "ami-01a4f81713ee9a4ea"
  instance_type = "t2.micro"
  key_name = "keypair-tokyo"
  vpc_security_group_ids = [
      "sg-0251ea64",
      "sg-e8638291",
  ]
  subnet_id = "subnet-867139de"

  tags = {
    Name = "${format("tk-dev-%02d", count.index +1 )}"
  }
}
  
