############################
# Automation Server Security Group
############################

resource "aws_security_group" "automation_sg" {

  name        = "${var.project_name}-automation-sg"
  description = "Security Group for Automation Server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"

    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "FastAPI"

    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "React"

    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-automation-sg"
  }
}

############################
# Target Server Security Group
############################

resource "aws_security_group" "target_sg" {

  name        = "${var.project_name}-target-sg"
  description = "Security Group for Target Server"
  vpc_id      = aws_vpc.main.id

  ingress {

    description = "SSH from Automation Server"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups = [
      aws_security_group.automation_sg.id
    ]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-target-sg"
  }
}
