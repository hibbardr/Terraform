provider "aws" {
   region = "us-east-1"
  access_key = "ASIA35KEIHUNKNEK6VN3"
  secret_key = "CLN36Ydx+UEHOc1FBV1FiHJZQ69RQ380pymU505/"
  token      = "FwoGZXIvYXdzENH//////////wEaDIAp8fufs0wqCZk/lCLJAUzc3CnABnr5/2M/FT3U1K+e73ddXXfYZBGDsu7lF8nVJ3Vcsroi34NNXX2x4yHDnkTGEvlkQQQ9de1Xb70Z09JHLJO7M/BEmWowRVcpVGNj0Ffq18x2hdTanj77aoWPajDMQYnqz3tIdx+NBYzCKswQMVCiFL2/OQhRwiyUVEPt1uObL/AnVWszUnedtgGOqMXXZH8OgQVIwZQzlS0MNis80i9Q6oGMHzV7xMQv+drZTh+3tFCBjLJ6siS4TtxA1xCZZI/Qf5rltCiGidahBjIt8j0l+ig+qc6XDi1tnd+qJtbXHM7vi3bTHNqFnfJ/8ewlw3v/knsWRcewb/lW"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
