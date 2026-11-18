# Day 7 – AWS Weighted Routing Practical

## Architecture
Route 53 weighted A alias records point to two CloudFront distributions. Each distribution uses its respective S3 **static website endpoint** as a custom HTTP origin.

```text
                  Route 53 public hosted zone
                     Weighted DNS records
                      /              \
                Weight 70          Weight 30
                    |                  |
              CloudFront A       CloudFront B
                    |                  |
                S3 Website A       S3 Website B
```

## Important AWS note
Use CloudFront distributions as Route 53 alias targets. S3 website endpoints are not direct Route 53 alias targets. For CloudFront, configure each S3 **website endpoint** as a custom origin, not the S3 REST endpoint.

## Files
- `website-a/index.html` and `website-b/index.html`: sample website files
- `architecture/architecture.md`: architecture notes
- `scripts/test-dns.sh`: repeated DNS lookup test
- `scripts/test-http.sh`: HTTP response and page test
- `evidence/illustrative/`: generated illustrative images, not genuine AWS evidence
- `evidence/real-aws-screenshots/`: put actual AWS and terminal screenshots here

## Implementation
1. Create two uniquely named S3 buckets.
2. Enable static website hosting on both; set index document to `index.html`.
3. Upload the matching HTML file to each bucket.
4. For a public website-origin lab, permit public `s3:GetObject` only if your instructor/account administrator authorizes it. Never store private data in these buckets.
5. Copy each S3 website endpoint.
6. Create two CloudFront distributions using those website endpoints as custom HTTP origins. Set default root object to `index.html`.
7. Wait for both distributions to deploy and test their CloudFront domain names.
8. In a public Route 53 hosted zone, create two records with the same name and type:
   - A, Alias Yes, Weighted, weight 70, unique record ID, target CloudFront A.
   - A, Alias Yes, Weighted, weight 30, unique record ID, target CloudFront B.
9. Test DNS and HTTP. DNS caching means a small sample will not show an exact 70:30 split.

## Test
Replace `www.example.com` with your own hostname:
```bash
bash scripts/test-dns.sh www.example.com
bash scripts/test-http.sh https://www.example.com
```

## Genuine submission evidence
The generated mockups in `evidence/illustrative/` are explanatory only. They are **not screenshots from your AWS account** and must not be submitted as proof of deployment. Capture genuine screenshots of:
- both S3 buckets and website hosting settings
- Website A and Website B in browser
- both CloudFront distributions deployed
- both Route 53 weighted records (70 and 30)
- terminal `dig` and `curl` tests

## Cleanup
After instructor acceptance, remove only lab resources you created. Delete Route 53 records, disable then delete CloudFront distributions, and empty/delete only the two lab S3 buckets. Check billing and dependencies first.
