# Terraform with Lambda

## Overview
Welcome! This repo was setup to provide a simple example of a typescript multi-lambda setup using terraform. Hopefully this assists someone out there since the official aws/terraform docs were a little vague on the topic.  

## What does this terraform code do?
This terraform project will create two different typescript lambdas and push them to the AWS account configured in the [terraform.auto.tfvars](terraform.auto.tfvars) file.

see [get_orders](resources/lambdas/GetOrders/index.ts) and [get_customers](resources/lambdas/GetCustomers/index.ts) for the lambda code.

## How to use

1. Add AWS credentials to [terraform.auto.tfvars](terraform.auto.tfvars) file
2. run `./build_lambdas.sh` to compile the lambda typescript code
3. run `terraform plan` to check the terraform changes (optional)
4. run `terraform apply` to apply the changes

## Running locally via AWS SAM

note: you will need docker installed on your local machine to use AWS SAM

1. run `./build_lambdas.sh`
2. run `sam build --hook-name terraform --beta-features`
3. run `sam local invoke aws_lambda_function.get_customers`

Note: You need to add additional  "null_resource" "sam_metadata_aws_lambda_function_" blocks for every lambda you wish to test locally 