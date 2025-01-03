resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr // or "10.0.0.0/16"
  tags = {
    Name = "tf-basic-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block             = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-basic-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "tf-basic-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "tf-basic-rt"
  }
}

resource "aws_route_table_association" "public_rta" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_security_group" "web_sg" {
  name        = "tf-basic-sg"
  description = "SG para SSH y HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                  = "ami-075449515af5df0d1" # Ubuntu Server 24.04 LTS AWS eu-north-1   ("ami-0c02fb55956c7d316"  Amazon Linux 2 us-east-1) ()
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
/*Also here we could add a  key_name = "mykey"   Refering to a Key Pair previously crerated so you can use it to login via SSH to that instanvce 

like this: ssh -i ~/.ssh/mykey.pem ec2-user@<public_ip>
*/

  tags = {
    Name = "tf-basic-ec2"
  }
}
