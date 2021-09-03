resource "aws_instance" "sandbox" {
  count		= 2
  ami		= "ami-015892a1577cdf2e6"
  instance_type = "t3.micro"
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
  
