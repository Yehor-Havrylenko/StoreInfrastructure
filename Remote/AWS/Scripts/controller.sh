#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 {destroy|apply} {environment} {backend|ecr|frontend}"
    exit 1
fi
cd ../Terraform/$3
echo "Terraform init"
terraform init -var-file="../Variables/$2/$3.tfvars"
echo "Terraform plan"
terraform plan -var-file="../Variables/$2/$3.tfvars"
echo "Terraform $1"
terraform "$1" -auto-approve -var-file="../Variables/$2/$3.tfvars"
echo "Terraform finish"