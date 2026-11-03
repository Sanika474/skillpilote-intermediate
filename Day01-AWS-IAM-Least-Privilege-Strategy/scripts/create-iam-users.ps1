$Assignments = @{
    "sp_developer" = "SkillPilote-Developers"
    "sp_deployer"  = "SkillPilote-Deployers"
    "sp_auditor"   = "SkillPilote-Auditors"
}

foreach ($User in $Assignments.Keys) {
    aws iam get-user --user-name $User 2>$null | Out-Null

    if ($LASTEXITCODE -ne 0) {
        aws iam create-user --user-name $User
        if ($LASTEXITCODE -ne 0) { throw "Failed to create $User" }
    }

    $Group = $Assignments[$User]
    $Membership = aws iam list-groups-for-user --user-name $User --query "Groups[?GroupName=='$Group'].GroupName" --output text

    if ($Membership -ne $Group) {
        aws iam add-user-to-group --user-name $User --group-name $Group
        if ($LASTEXITCODE -ne 0) { throw "Failed to assign $User to $Group" }
    }

    Write-Host "$User -> $Group" -ForegroundColor Green
}
