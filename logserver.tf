
# # resource "aws_eip" "logserver_ip" {
# #   vpc = true
# # }

# resource "aws_security_group" "logserver" 
# {
#   name = "logserver_ingress"
#   description = "Allow syslog and mgmt traffic"
#   vpc_id = "${aws_vpc.logserver_vpc.id}"

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 10514
#     to_port = 10514
#     protocol = "tcp"
#     cidr_blocks = ["10.0.0.0/0"]
#   }

#   ingress {
#     from_port = 10514
#     to_port = 10514
#     protocol = "udp"
#     cidr_blocks = ["10.0.0.0/0"]
#   }    
# }

# resource "aws_security_group" "loghost" 
# {
#   name = "loghost_ingress"
#   description = "Allow syslog and mgmt traffic"
#   vpc_id = "${aws_vpc.logserver_vpc.id}"

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 514
#     to_port = 514
#     protocol = "tcp"
#     security_groups = [ "${aws_security_group.logserver.id}" ]
#   }
# }

# resource "aws_elb" "log_elb" 
# {
#   name = "logserver-elb"
#   subnets = [ "${aws_subnet.logserver_subnet1.id}", "${aws_subnet.logserver_subnet2.id}" ]
#   security_groups = [ "${aws_security_group.logserver.id}" ]

#   listener {
#     instance_port = 80
#     instance_protocol = "http"
#     lb_port = 80
#     lb_protocol = "http"
#   }

#   listener {
#     instance_port = 514
#     instance_protocol = "tcp"
#     lb_port = 10514
#     lb_protocol = "tcp"
#   }
# }

# resource "aws_autoscaling_group" "logserver_asg" 
# {
#   availability_zones = [ "${var.aws_az1}",  "${var.aws_az2}" ]
#   vpc_zone_identifier = [ "${aws_subnet.logserver_subnet1.id}", "${aws_subnet.logserver_subnet2.id}" ]
#   name = "logserver_asg"
#   max_size = 1
#   min_size = 1
#   desired_capacity = 1
#   health_check_grace_period = 300
#   health_check_type = "EC2"
#   force_delete = true
#   launch_configuration = "${aws_launch_configuration.logserver_launch_conf.id}"
#   load_balancers = [ "${aws_elb.log_elb.name}" ]
# }

# resource "aws_launch_configuration" "logserver_launch_conf" 
# {
#   name = "logserver_config"
#   image_id = "${lookup(var.amazon_linux_amis, var.aws_region)}"
#   instance_type = "${var.aws_instance_type}"
#   security_groups = [ "${aws_security_group.loghost.id}" ]
#   key_name = "${var.key_name}"
#   user_data = ""  

#   # provisioner "remote-exec" {
#   #   inline = [
#   #      "ls -la "
#   #    ]
#   # }
# }





