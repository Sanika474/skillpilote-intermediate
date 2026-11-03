$Groups = @(
    "SkillPilote-Developers",
    "SkillPilote-Deployers",
    "SkillPilote-Auditors"
)

foreach ($Group in $Groups) {
    aws iam get-group --group-name $Group 2>$null | Out-Null

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Already exists: $Group" -ForegroundColor Yellow
    }
    else {
        aws iam create-group --group-name $Group
        if ($LASTEXITCODE -ne 0) { throw "Failed to create $Group" }
        Write-Host "Created: $Group" -ForegroundColor Green
    }
}
