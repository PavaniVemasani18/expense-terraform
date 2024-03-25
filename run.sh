env $1
action $2
if [ -z "$env" ];then
  echo "env[dev/prod/qa] is missing"
  exit 1
fi
if [ -z "$action" ];then
  echo "action[apply/destroy] is missing"
  exit 1
fi

rm -rf .terraform/terraform.state
terraform init -backend-config=env-${env}/state.tfvars
terraform $action -var-file=env-${env}/main.tfvars