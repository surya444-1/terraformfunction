variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
    description = "AMIs by region"
	type = "map"
    default = {

        us-east-1 = "ami-0915e09cc7ceee3ab" # ubuntu 14.04 LTS
		us-east-2 = "ami-097834fcb3081f51a" # ubuntu 14.04 LTS
		us-west-1 = "ami-0027eed75be6f3bf4" # ubuntu 14.04 LTS
		us-west-2 = "ami-01f08ef3e76b957e5" # ubuntu 14.04 LTS
    }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable Main_Routing_Table {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "blocks" {
  description = "Use the CIDR Blocks for the Subnets"
  type = "list"
  default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}
variable "environment" { default = "dev" }
variable "instance_type" {
  type = "map"
  default = {
    dev = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
    }
}

