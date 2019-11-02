
data "template_file" "user_data" {
  template = "${file("${path.module}/templates/web-user-data.tpl")}"
}


resource "aws_instance" "web-ec2-instance" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = var.ami_key_pair_name
    security_groups = [aws_security_group.ec2-instance-sg.id]

    associate_public_ip_address = true

    subnet_id = aws_subnet.subnet-1a.id

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "WebApp"
        Role = "webapp"
        Env = "DEV"
    }

}