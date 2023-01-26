#----------------------------PUBLIC SECURITY GROUP----------------------------

resource "aws_security_group" "public_security_group" {
  name        = "public_security_group"
  description = "Security group for PUBLIC servers"
  vpc_id      = var.vpc_id

  ingress {
    description = "Accept SSH connections"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Accept all traffic within the vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "All traffic in all network"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.env}-public-security-group"
  }
}

#=============================================================================

#----------------------------PRIVATE SECURITY GROUP---------------------------
resource "aws_security_group" "private_security_group" {
  name        = "private_security_group"
  description = "Security group for PRIVATE servers"
  vpc_id      = var.vpc_id

  ingress {
    description = "Accept all traffic within the vpc"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "All traffic in all network"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.env}-private-security-group"
  }
}

#=============================================================================
