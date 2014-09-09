# Amazon Linux
variable "amazon_linux_amis" {
    default = {
        us-east-1 = "ami-7c807d14"
        us-west-1 = "ami-1b3b462b"
        us-west-2 = "ami-a8d3d4ed"
        eu-west-1 = "ami-672ce210"
    }
}

# Ubuntu Precise 12.04 LTS (x64)
variable "ubuntu_precise_amis" {
    default = {
        eu-west-1 = "ami-b1cf19c6"
        us-east-1 = "ami-de7ab6b6"
        us-west-1 = "ami-3f75767a"
        us-west-2 = "ami-21f78e11"
    }
}