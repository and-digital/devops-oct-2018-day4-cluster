resource "aws_security_group" "sg" {
    name = "vote_app_sg"
    description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"

    lifecycle {
        create_before_destroy = true
    }

    ingress {
        from_port   = "8080"
        to_port     = "8080"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        self        = true
    }

    egress {
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        self        = true
    }
  
    tags { 
        Name = "vote_app_sg" 
    }
}