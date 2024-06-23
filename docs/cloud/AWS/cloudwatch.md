# CloudWatch

## AWS Insight query

```
fields @timestamp, @message
| sort @timestamp desc
| filter @message like 'Access denied'

fields @timestamp, @message
| sort @timestamp desc
| filter @message like 'unauthenticated'

fields @timestamp, @message
| sort @timestamp desc
| filter @message like /error/
| limit 20

fields @timestamp, @message
| sort @timestamp desc
| filter @message like /FAILED/
| limit 20

# error
fields @timestamp, @message
| filter @message not like /Dump thread metrics/
| sort @timestamp desc

# audit
fields @timestamp, @message
| filter @message like /FAILED_CONNECT/
| sort @timestamp desc

fields @timestamp, @message
| sort @timestamp desc
| filter @message not like /ap-southeast-1a,yanisthesmartest/
```

## Manual trigger AWS CloudWatch Alarm

```
aws cloudwatch set-alarm-state --alarm-name "CIS-3.2-ConsoleSigninWithoutMFA" --state-value ALARM --state-reason "test"
cloudwatch set-alarm-state --alarm-name "CIS-3.2-ConsoleSigninWithoutMFA" --state-value OK --state-reason "test"
```