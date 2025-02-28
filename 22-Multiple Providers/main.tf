provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias = "test"
  region = "us-east-2"
  profile = ""
}

resource "aws_instance" "firstec2" {
  ami = "ami-XXXXXXXXXX"
  instance_type = "t2.micro"
  tags = {
    Name="remote-exec-ec2"
  }
}

resource "aws_instance" "secondec2" {
  ami = "ami-XXXXXXXXXX"
  instance_type = "t2.micro"
  tags = {
    Name="remote-exec-ec2"
  }

  provider = aws.test
}