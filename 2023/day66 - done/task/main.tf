resource "aws_vpc" "devopschallenge_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "devopschallenge_vpc"
  }
}

resource "aws_subnet" "devopschallenge_public_subnet" {
  vpc_id     = aws_vpc.devopschallenge_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "devopschallenge_public_subnet"
  }
}

resource "aws_subnet" "devopschallenge_private_subnet" {
  vpc_id     = aws_vpc.devopschallenge_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "devopschallenge_private_subnet"
  }
}

resource "aws_internet_gateway" "devopschallenge_igw" {
  vpc_id = aws_vpc.devopschallenge_vpc.id

  tags = {
    Name = "devopschallenge_igw"
  }
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.devopschallenge_routetable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devopschallenge_igw.id
}


resource "aws_route_table" "devopschallenge_routetable" {
  vpc_id = aws_vpc.devopschallenge_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopschallenge_igw.id
  }

  tags = {
    Name = "devopschallenge_routetable"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.devopschallenge_public_subnet.id
  route_table_id = aws_route_table.devopschallenge_routetable.id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.devopschallenge_private_subnet.id
  route_table_id = aws_route_table.devopschallenge_routetable.id
}

resource "aws_security_group" "devopschallenge_sg" {
  name_prefix = "devopschallenge_sg"
  vpc_id      = aws_vpc.devopschallenge_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_instance" "devopschallenge_ec2instance" {
  ami           = "ami-0eb260c4d5475b901"
  instance_type = "t2.micro"
  key_name      = "devopschallenge-key"
  subnet_id     = aws_subnet.devopschallenge_public_subnet.id
  security_groups = [
    aws_security_group.devopschallenge_sg.id
  ]

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install -y apache2
                sudo systemctl start apache2
                sudo systemctl enable apache2
                echo "<html><body><h1>Welcome to my website!</h1></body></html>" > /var/www/html/index.html
                sudo systemctl restart apache2
                EOF
  tags = {
    Name = "devopschallenge_ec2instance"
  }
}

resource "aws_eip" "devopschallenge_eip" {
  instance = aws_instance.devopschallenge_ec2instance.id
}
