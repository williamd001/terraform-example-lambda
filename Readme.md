# Terraform with Lambda

## How to use

1. Add AWS credentials to terraform.auto.tfvars
2. run `npx tsc --project  resources/lambdas/GetOrders/` to compile typescript code and generate a build directory
3. run `terraform plan`
4. run `terraform apply`

note: you can also use `./build_lambdas` to rebuild all lambda functions

## Running locally via AWS SAM

1. run `./build_lambdas.sh`
2. run `sam build --hook-name terraform --beta-features`
3. run `sam local invoke aws_lambda_function.get_customers`