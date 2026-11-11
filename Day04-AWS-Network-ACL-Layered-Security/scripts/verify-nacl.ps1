
$Region = "ap-south-1"

$NaclId = "acl-029fbec5a8d2918b2"
$SubnetId = "subnet-09342d17a9d77d4ed"

Write-Host "`n===== INBOUND RULES =====" -ForegroundColor Cyan

aws ec2 describe-network-acls `
    --region $Region `
    --network-acl-ids $NaclId `
    --query 'NetworkAcls[0].Entries[?Egress==`false`].{Rule:RuleNumber,Protocol:Protocol,Action:RuleAction,Port:PortRange,CIDR:CidrBlock}' `
    --output table

Write-Host "`n===== OUTBOUND RULES =====" -ForegroundColor Cyan

aws ec2 describe-network-acls `
    --region $Region `
    --network-acl-ids $NaclId `
    --query 'NetworkAcls[0].Entries[?Egress==`true`].{Rule:RuleNumber,Protocol:Protocol,Action:RuleAction,CIDR:CidrBlock}' `
    --output table

Write-Host "`n===== SUBNET ASSOCIATION =====" -ForegroundColor Cyan

aws ec2 describe-network-acls `
    --region $Region `
    --filters "Name=association.subnet-id,Values=$SubnetId" `
    --query "NetworkAcls[*].{NACL_ID:NetworkAclId,Associations:Associations[*].{SubnetId:SubnetId,AssociationId:NetworkAclAssociationId}}" `
    --output json

Write-Host "`nVerification commands completed." -ForegroundColor Green
