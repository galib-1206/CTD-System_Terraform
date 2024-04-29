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

  owners = ["099720109477"]
}

resource "aws_key_pair" "ctd_key_pair" {
  key_name   = "ctd-${var.tag}-key-pair"
  public_key = var.ssh_public_key
}

resource "aws_iam_role" "ecr_full_permissions_role" {
  name = "ECRFullPermissionsRole-${var.tag}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "ecr_full_permissions_attachment" {
  name       = "ECRFullPermissionsAttachment-${var.tag}"
  roles      = [aws_iam_role.ecr_full_permissions_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_instance" "ctd_ec2" {
  ami           = "ami-08116b9957a259459"
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  key_name      = aws_key_pair.ctd_key_pair.key_name
  iam_instance_profile = aws_iam_role.ecr_full_permissions_role.name

  root_block_device {
    delete_on_termination = true
    volume_type          = "gp2"
    volume_size          = 20
    encrypted            = true
  }

  tags = {
    environment = "ctd-${var.tag}"
    Name        = "${var.tag}-ctd-ec2"
  }

  depends_on = [aws_key_pair.ctd_key_pair]
}
