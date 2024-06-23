# Notes

## Security Group vs Network Access Control List (NACL)

| Security Group | NACL |
| -------------- | ---- |
| Apply to instance | Apply to subnet |
| Stateful. Automatically allows return traffic | Stateless. Need allow both inbound and outbound |
| Default: deny all inbound | Default: allow all traffic |
| Allow rules only | Can specify allow and deny rules |

## Which AWS service that are not region specific?
- IAM, Route53, Cloudfront

## How to make sure ALB receive traffic from Cloufront?
- Configure Cloudfront to add custom header to ALB.
- Configure ALB only forward request that contain the custom header.

## AWS design decision
- Upgrade EOL
- Use IAC
- Automated/Continous deployment: blue/green deployment
- Use AWS auto scaling
  - Allow horizontal scaling
  - Instance swap
  - Self healing, auto recovery
- Redeploy to multi AZ for resilliency/disaster recovery
- Enhance data security and protection
  - Use Cloudfront enforce secure end-to-end connection to origin servers by https
- Use managed services like EC2, RDS
- Break down to smaller services and contrainerized application for easier management and deployment
- Opportunistic refactoring. Rewrite application to serverless
- Standardlise application layers
- Move to SaaS, cloud-based commercial app

## Network
- Build highly availability network connectivity
    - Use highly available DNS
    - CDN
    - API gateway
    - Load balancing
    - Reverse proxies
- AWS ALB and NLB are reverse proxies. Reversed proxy improve web performance by caching, security, evenly distributing traffic
- Difference between proxy, reversed proxy
    - (Forward) Proxy sit between user and internet. Forward request on behalf user. For caching, bypass restriction, enhance privacy.
    - Reversed Proxy sit between internet and server. Receive request on behalf server. Use for load balancer, caching, pSSL termination, protecting server from direct exposure

## AWS Security
- AWS Cloudtrail
- AWS Security Hub
    - Implement controls from market-proven security standard
    - Aggregate findings from all security services
    - Provide team with a single panel of glass for security findings
    - Enable standard CIS AWS Foundation Benchmarks and AWS Foundational Security Best Practices
- AWS Config
- AWS GuardDuty

## Best practise managing cost
- Use AWS Cost Explorer and Budget
- Implement resource tagging
- Choose the right model (reserved instance, saving plans)
- Regulary review and optimize resource usage

## Sync between 2 buckets
```
aws s3 sync s3://<bucket1>/ s3://<bucket2>/ --source-region us-east-1 --region ap-southeast-1
```