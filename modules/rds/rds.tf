resource "aws_db_subnet_group" "rds" {
  name       = "my-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "my-rds-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "my-rds-sg"
  description = "Allow PostgreSQL access"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL from my allowed source"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "my-postgres-db"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = "mydb"
  username               = "adminuser"
  password               = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = "my-postgres-db"
  }
}
