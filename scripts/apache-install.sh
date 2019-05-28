#!/bin/sh
# First lets update the system
yum -y update 
# Then install apache server
yum -y install httpd
# Start and configure automatic start for the service 
systemctl enable httpd
systemctl start httpd.service