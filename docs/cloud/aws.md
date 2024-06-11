# AWS

## Security Group vs Network Access Control List (NACL)

| Security Group | NACL |
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
- Continous deployment: blue/green deployment
- Use AWS auto scaling
  - Allow horizontal scaling
  - Instance swap
  - Self healing, auto recovery
- Redeploy to other AZ
- Enhance data security and protection
  - Use Cloudfront enforce secure end-to-end connection to origin servers by https
- Use managed services like EC2, RDS
- Break down to smaller services and contrainerized application for easier management and deployment
- Standardlise application layers
- Move to SAAS

## AWS Security
- Cloudtrail
- Security Hub
  - Implement controls from market-proven security standard
  - Aggregate findings from all security services
  - Provide team with a single panel of glass for security findings
  - Enable standard CIS AWS Foundation Benchmarks and AWS Foundational Security Best Practices
- Config
- GuarDuty

## Best practise managing cost
- Use AWS Cost Explorer and Budget
- Implement resource tagging
- Choose the right model (reserved instance, saving plans)
- Regulary review and optimize resource usage