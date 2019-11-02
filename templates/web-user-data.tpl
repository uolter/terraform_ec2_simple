#!/bin/sh

yum update -y

# install httpd

yum install -y httpd

systemctl start httpd
systemctl enable httpd
