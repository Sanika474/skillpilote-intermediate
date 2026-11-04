
# SkillPilote Day 02 - Multi-Tier VPC Architecture
# Region: ap-south-1

$Region = "ap-south-1"

# Resource IDs
$VpcId = "vpc-0dae8c737bfd0fed7"
$PublicSubnetId = "subnet-089c9e5c878e149bb"
$PrivateSubnetId = "subnet-0041e2296348ed805"
$InternetGatewayId = "igw-02055bcc396cf036d"
$PublicRouteTableId = "rtb-0c691b931c4374da4"
$PrivateRouteTableId = "rtb-0593bc9bd36695ce7"
$NatGatewayId = "nat-03d945f660686d39a"
$WebSecurityGroupId = "sg-0045404255fb1e0fb"
$DatabaseSecurityGroupId = "sg-0713fb97e89004b7e"

Write-Host "Checking VPC..."
aws ec2 describe-vpcs --vpc-ids $VpcId --region $Region

Write-Host "Checking subnets..."
aws ec2 describe-subnets --subnet-ids $PublicSubnetId $PrivateSubnetId --region $Region

Write-Host "Checking Internet Gateway..."
aws ec2 describe-internet-gateways --internet-gateway-ids $InternetGatewayId --region $Region

Write-Host "Checking route tables..."
aws ec2 describe-route-tables --route-table-ids $PublicRouteTableId $PrivateRouteTableId --region $Region

Write-Host "Checking NAT Gateway..."
aws ec2 describe-nat-gateways --nat-gateway-ids $NatGatewayId --region $Region

Write-Host "Checking security groups..."
aws ec2 describe-security-groups --group-ids $WebSecurityGroupId $DatabaseSecurityGroupId --region $Region

Write-Host "Day 02 VPC verification completed."
