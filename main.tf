provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "APP_INSTANCE" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "us-east-1"
  subnet_id              = "subnet-0d9d669d0c60f644b"
  vpc_security_group_ids = ["sg-0f4511e1e5bb259ea"]
  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "APP_INSTANCE-root-block"
    }
  }
  tags = {
    Name = "APP_INSTANCE"
  }
}

output "public_ip_address" {
  value = aws_instance.APP_INSTANCE.public_ip
}
