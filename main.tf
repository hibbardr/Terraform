terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "ballfindr"

    workspaces {
      name = "learn-terraform-cloud"
    }
    token = "4BqY7FnjQQ9Ebg.atlasv1.NRUEZtHsmzpFFGvbooGrFKJ0MhNQA2vaHZ0VmrEzZ0q0Sp5VbcITWphi3OyZKYMn3UA"
  }
}
provider "aws" {
  region     = "us-east-1"
  access_key = "ASIA35KEIHUNPCU4T47H"
  secret_key = "l2aSM6QEvCFl547e/34rjFmdnXPhTgOiQkg+XqKS"
  token      = "FwoGZXIvYXdzENX//////////wEaDAPtaxh3+ttDL8hlxiLJAWlGIiWGjgqpRIKBDEdkks4IQGQ3/Ox/dker2zXii46bOGBHzxtDhu4egfOhHgviD2t/C1LGt1jjUbvqM/W3Zr4WDRAV7H4iNueAvrlJrrI34Dzp2oYI0FX2PDHCnOTILzGKkx9PoRfi1EBBey4YFZrXgCI0pLph1yYOGGTL6Tpn9KyCdUJdntAb19fp5KFWg+cnO/lTVVelNVz0Fqo3ANuAYY/79/hosk11mUaSQdrOt07QHPV7yLibHhcwpcuxCmfdmHCyZUJstSjq+dahBjItLl0KYBP0+z+T/d2tcH5pWLqhEVXKG9v6U3WkMbpAHFnVBGv8Qd5tDlmgHRTp"
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
  instance_type = "t2.micro"
}

