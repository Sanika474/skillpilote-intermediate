$AccountId = (aws sts get-caller-identity --query Account --output text).Trim()
$Region = "ap-south-1"

$BucketObjectArn = "arn:aws:s3:::skillpilote-cloudapp-$AccountId-$Region/test.txt"
$FunctionArn = "arn:aws:lambda:${Region}:${AccountId}:function:SkillPilote-CloudApp-Function"
$TableArn = "arn:aws:dynamodb:${Region}:${AccountId}:table/SkillPilote-CloudApp-Records"

Write-Host "`nDEVELOPER TESTS" -ForegroundColor Cyan
aws iam simulate-principal-policy `
  --policy-source-arn "arn:aws:iam::${AccountId}:user/sp_developer" `
  --action-names s3:GetObject s3:DeleteObject `
  --resource-arns $BucketObjectArn `
  --query "EvaluationResults[*].[EvalActionName,EvalDecision]" `
  --output table

Write-Host "`nDEPLOYER TESTS" -ForegroundColor Cyan
aws iam simulate-principal-policy `
  --policy-source-arn "arn:aws:iam::${AccountId}:user/sp_deployer" `
  --action-names lambda:UpdateFunctionCode lambda:DeleteFunction `
  --resource-arns $FunctionArn `
  --query "EvaluationResults[*].[EvalActionName,EvalDecision]" `
  --output table

Write-Host "`nAUDITOR TESTS" -ForegroundColor Cyan
aws iam simulate-principal-policy `
  --policy-source-arn "arn:aws:iam::${AccountId}:user/sp_auditor" `
  --action-names dynamodb:Query dynamodb:PutItem `
  --resource-arns $TableArn `
  --query "EvaluationResults[*].[EvalActionName,EvalDecision]" `
  --output table
