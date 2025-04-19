CopyEdit
#!/bin/bash
cd /infra/project
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
echo "✅ Terraform apply complete."
Optionally log outputs and errors to a file.
