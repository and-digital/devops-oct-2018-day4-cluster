

You will need to create a variables file:
`secrets.tfvars`

Content's should be:
```
aws_secret = "<<YOUR SECRET HERE>>"
aws_key = "<<KEY>>"
```

When you run terraform use the secrets file:
Examples
`terraform plan -var-file=secret.tfvars`
`terraform apply -var-file=secret.tfvars`
`terraform destroy -var-file=secret.tfvars`


### TODOS:
- Create Network
- ECS
