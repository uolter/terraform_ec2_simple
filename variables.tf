variable "ami_name" {
    default = "WebApp"
}
variable "ami_id" {
    default = "ami-040ba9174949f6de4"
}
variable "ami_key_pair_name" {
    default = "foo-key-pair"
}

variable "vpc_cidr_block" {
    
    default = "10.0.0.0/24"
}