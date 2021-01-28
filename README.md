# Basic AWS account setup with Terraform

## Billing Alarm Module

### Plan-Apply

    terraform plan -target module.billing-alarm -out billing-alarm.tfplan
    terraform apply billing-alarm.tfplan

### Test

    aws cloudwatch set-alarm-state --alarm-name "billing-alert" --state-value ALARM --state-reason "testing"
    aws cloudwatch set-alarm-state --alarm-name "billing-alert" --state-value OK --state-reason "cancel-testing"