# AWS

## Security Group vs Network Access Control List (NACL)

| Security Group | NACL |
| Apply to instance | Apply to subnet |
| Stateful. Automatically allows return traffic | Stateless. Need allow both inbound and outbound |
| Default: deny all inbound | Default: allow all traffic |
| Allow rules only | Can specify allow and deny rules |

## How to make sure ALB receive traffic from Cloufront?
- Configure Cloudfront to add custom header to ALB.
- Configure ALB only forward request that contain the custom header.