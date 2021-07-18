Must initialize tf:  
`terraform init`  

Run a plan and save/read:  
`terraform plan -out tfplan`   
`terraform show tfplan`  

Apply plan:  
`terraform apply tfplan`  
`terraform apply "tfplan"`

Refresh state, may be necessary sometimes:  
`terraform apply -refresh-only`


