
$Region = "ap-south-1"
$NaclId = "acl-029fbec5a8d2918b2"

Write-Host "Configuring inbound HTTP rule..." -ForegroundColor Cyan

aws ec2 create-network-acl-entry `
    --region $Region `
    --network-acl-id $NaclId `
    --ingress `
    --rule-number 100 `
    --protocol 6 `
    --port-range From=80,To=80 `
    --cidr-block 0.0.0.0/0 `
    --rule-action allow

if ($LASTEXITCODE -ne 0) { throw "HTTP rule creation failed." }

Write-Host "Configuring inbound HTTPS rule..." -ForegroundColor Cyan

aws ec2 create-network-acl-entry `
    --region $Region `
    --network-acl-id $NaclId `
    --ingress `
    --rule-number 110 `
    --protocol 6 `
    --port-range From=443,To=443 `
    --cidr-block 0.0.0.0/0 `
    --rule-action allow

if ($LASTEXITCODE -ne 0) { throw "HTTPS rule creation failed." }

Write-Host "Configuring outbound allow-all rule..." -ForegroundColor Cyan

aws ec2 create-network-acl-entry `
    --region $Region `
    --network-acl-id $NaclId `
    --egress `
    --rule-number 100 `
    --protocol -1 `
    --cidr-block 0.0.0.0/0 `
    --rule-action allow

if ($LASTEXITCODE -ne 0) { throw "Outbound rule creation failed." }

Write-Host "NACL rules configured successfully!" -ForegroundColor Green
