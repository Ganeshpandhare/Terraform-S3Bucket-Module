resource "aws_instance" "my-instance" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "gp1"
  vpc_security_group_ids = [aws_security_group.my-sg-s3.id]

  tags = {
    Name  = "ec2-s3"
    owner = "ganesh"
  }

}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "s3-module"

  tags = {
    Name = "my-bucket"
    dev  = "env"
  }
}

resource "aws_security_group" "my-sg-s3" {
  name = "aws-s3-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
