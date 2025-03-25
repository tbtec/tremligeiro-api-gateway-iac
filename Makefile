AWS_BUCKET_TERRAFORM=tremligeiro-tf

tf-init:
	@cd tf \
		&& terraform init -backend-config="bucket=${AWS_BUCKET_TERRAFORM}"

tf-plan:
	@cd tf \
		&& terraform plan 
		
tf-delete:
	@cd tf \
		&& rm -r .terraform \
		&& rm .terraform.lock.hcl

tf-apply:
	@cd tf \
		&& terraform apply 

tf-destroy:
	@cd tf \
		&& terraform destroy -auto-approve