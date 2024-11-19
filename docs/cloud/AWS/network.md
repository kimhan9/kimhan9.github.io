# AWS Network

## Security Group vs Network Access Control List (NACL)

| Security Group | NACL |
| -------------- | ---- |
| Apply to instance | Apply to subnet |
| Stateful. Automatically allows return traffic | Stateless. Need allow both inbound and outbound |
| Default: deny all inbound | Default: allow all traffic |
| Allow rules only | Can specify allow and deny rules |

## ALB vs NLB

| Type | ALB | NLB |
| ---- | --- | --- |
| Layer | Operate at layer 7, application layer | Operate at layer 4, network layer |
| Protocol | Support HTTP, HTTPS protocol | Support TCP, UDP, TLS protocol |
| Target type | Work with IP, instance, lambda | Work with IP, instance, ALB |
| | Application-level traffic management and routing | Best for high performance, low latency |
| | SSL termination, session persistence, content-based routing | Media streaming, gaming |