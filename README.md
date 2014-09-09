Terraform Logserver 
===================

Design pattern for a log server setup to accompany a service deployed  to the cloud. Uses http://terraform.io

# Getting started

Create a `terraform.tfvars` file in the root of the repo with needed variables of the form:

```
aws_access_key = "my key"
aws_secret_key = "my secret"
aws_region = "us-east-1"

aws_vpc = "vpc-12345678"
aws_az1 = "us-east-1a"
aws_az2 = "us-east-1c"

key_path = "path/to/key"
key_name = "my key name"
```

and change to reflect your specifics. 

Then deploy with 

``` 
terraform plan 
terraform apply
```
