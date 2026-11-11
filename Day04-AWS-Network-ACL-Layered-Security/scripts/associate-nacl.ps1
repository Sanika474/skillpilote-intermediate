
$Region = "ap-south-1"

$NaclId = "acl-029fbec5a8d2918b2"
$SubnetId = "subnet-09342d17a9d77d4ed"

Write-Host "Checking current subnet association..." -ForegroundColor Cyan

$Result = aws ec2 describe-network-acls `
    --region $Region `
    --filters "Name=association.subnet-id,Values=$SubnetId" `
    --output json | ConvertFrom-Json

if ($LASTEXITCODE -ne 0) {
    throw "Failed to inspect subnet association."
}

$Association = $Result.NetworkAcls[0].Associations |
    Where-Object { $_.SubnetId -eq $SubnetId }

if (-not $Association) {
    throw "No existing NACL association found."
}

if ($Result.NetworkAcls[0].NetworkAclId -eq $NaclId) {
    Write-Host "Custom NACL is already associated." -ForegroundColor Green
    exit 0
}

Write-Host "Replacing NACL association..." -ForegroundColor Yellow

aws ec2 replace-network-acl-association `
    --region $Region `
    --association-id $Association.NetworkAclAssociationId `
    --network-acl-id $NaclId

if ($LASTEXITCODE -ne 0) {
    throw "NACL association failed."
}

Write-Host "Custom NACL associated successfully!" -ForegroundColor Green
