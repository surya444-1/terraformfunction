data "aws_subnet_ids" "subnets" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_instance" "servers" {
    count = "${length(data.aws_subnet_ids.subnets.ids)}"
    ami = "${lookup(var.amis, var.aws_region)}"
    #availability_zone = "${element(var.azs, count.index)}"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"
    subnet_id = "${element(tolist(data.aws_subnet_ids.subnets.ids), count.index+1)}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "Terraform-Server-${count.index+1}"
        Env = "Prod"
        Owner = "Surya"
    }
}

