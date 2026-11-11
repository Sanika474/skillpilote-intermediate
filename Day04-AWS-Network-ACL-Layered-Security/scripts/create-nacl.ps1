
$Region = "ap-south-1"
$VpcId = "vpc-082185a0fbb302aef"

$Name = "SkillPilote-Day04-Public-NACL"

Write-Host "Creating custom Network ACL..." -ForegroundColor Cyan

$Result = aws ec2 create-network-acl `
    --region $Region `
    --vpc-id $VpcId `
    --tag-specifications "ResourceType=network-acl,Tags=[{Key=Name,Value=$Name},{Key=Project,Value=SkillPilote},{Key=Day,Value=Day04}]" `
    --output json | ConvertFrom-Json

if ($LASTEXITCODE -ne 0) {
    throw "Failed to create Network ACL."
}

$NaclId = $Result.NetworkAcl.NetworkAclId

Write-Host "Custom NACL created successfully!" -ForegroundColor Green
Write-Host "NACL ID: $NaclId" -ForegroundColor Yellow
