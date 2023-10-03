data "aws_vpc" "myvpc" {
  
}
resource "aws_security_group" "allow_traffic" {
  name        = "allow traffic"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.myvpc.id

  dynamic "ingress" {
    for_each = [ 8000,80,443]
    iterator = port
    content {
      description      = "TLS from VPC"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
#  depends_on = [ aws_ecs_service.my_ecs_service ]
}
