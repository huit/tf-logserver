#
# Sets up a 2 AZ VPC with an internet gateway
#

resource "aws_vpc" "logserver_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
}

resource "aws_internet_gateway" "logserver_gw" {
    vpc_id = "${aws_vpc.logserver_vpc.id}"
}

resource "aws_route_table" "logserver_route_table" {
    vpc_id = "${aws_vpc.logserver_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.logserver_gw.id}"
    }
}

resource "aws_subnet" "logserver_subnet1" {
    vpc_id = "${aws_vpc.logserver_vpc.id}"
	availability_zone = "${var.aws_az1}"  
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "logserver_subnet2" {
    vpc_id = "${aws_vpc.logserver_vpc.id}"
	availability_zone = "${var.aws_az2}"    
    cidr_block = "10.0.2.0/24"
}

resource "aws_route_table_association" "logserver_subnet1_rtassoc" {
    subnet_id = "${aws_subnet.logserver_subnet1.id}"
    route_table_id = "${aws_route_table.logserver_route_table.id}"
}

resource "aws_route_table_association" "logserver_subnet2_rtassoc" {
    subnet_id = "${aws_subnet.logserver_subnet2.id}"
    route_table_id = "${aws_route_table.logserver_route_table.id}"
}
