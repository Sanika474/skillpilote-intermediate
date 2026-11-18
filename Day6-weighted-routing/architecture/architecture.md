# Architecture

1. Client requests the public DNS hostname.
2. Route 53 selects an eligible weighted record using relative weights.
3. The selected alias resolves to CloudFront A or B.
4. CloudFront fetches the page from its configured S3 website custom origin.
5. Browser displays Website A or Website B.

Weights 70 and 30 are relative DNS response weights, not a guarantee that exactly 70% of page loads show A. Resolver caching, TTLs and repeated client queries affect observations.

For S3 static website hosting, use the S3 website endpoint as a CloudFront custom origin. The S3 REST endpoint behaves differently.
