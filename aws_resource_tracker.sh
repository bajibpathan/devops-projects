#!/bin/bash

###############################################
# Author: Baji
# Date: 11th-Jan
#
# Version: v1
#
# This script will report the AWS resource usage
###############################################

set -x

# AWS S3
# AWS EC2
# AWS Lamda Functions
# AWS IAM Users

# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls > resourceTracker

# list EC2 instance
echo "Print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

# list Lambda Functions
aws lambda list-functions >> resourceTracker

# list IAM Users
echo "Print list of iam users"
aws iam list-users >> resourceTracker