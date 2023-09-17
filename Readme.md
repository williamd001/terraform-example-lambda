# Terraform with Lambda

## How to use

1. Add AWS credentials to terraform.auto.tfvars

2. Navigate to a lambda function directory `cd resources/GetCustomers` 
3. run `npx tsc` to compile typescript code and generate a build directory
4. run `terraform plan`
5. run `terraform apply`