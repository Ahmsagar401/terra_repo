resource "aws_instance" "git_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.git_sg.id]
}

resource "aws_security_group" "git_sg" {
    name = "allow-ssh"

    ingress {
        from_port = var.port
        to_port = var.port
        protocol = "tcp"
        cidr_blocks = [var.cidr_block]
    }

    tags = {
        name = "git_sg"
    }
}
