provider "aws" {
  region = "us-east-1"  # specify your preferred AWS region
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0866a3c8686eaeeba"  # updated with your specified AMI
  instance_type = "t2.micro"               # specify the instance type

  key_name = "CICD"  # specify your key pair name

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }
}
