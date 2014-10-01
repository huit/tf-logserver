#
# Parameters speciic to AWS.
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
    default = "us-east-1"
}
variable "aws_instance_type" {
	default = "m1.small"
}
variable "aws_vpc" {}
variable "aws_az1" {}
variable "aws_az2" {}

variable "elb_subnet1" {}
variable "elb_subnet2" {}
