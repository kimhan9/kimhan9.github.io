# Linux

- Check for a particular file size.
`du -sh <filename>`
- Check for open port.
`netstat -tulpn`

## How to Troubleshoot

- Collect info and identify the problem
  - Slow response, high latency, unable to reach server, timeout
  - Check for recent change make to app or infra
- Web server (infra) troubleshooting
  - See if processes is running
  - Check server health: 
    - CPU/memory usage
    - Storage usage, disk I/O
    - Network traffic, latency, throughput
    - Error rate
  - Compare current performance metrics against baseline
    - Analyze pattern: look for unusual spike traffic, bandwidth hogs, malicious activities
  - Verify web server log and look for error
  - Review configuration setting. Ensure infra is properly configure
- Application Performance Issue
  - Use Application Performance Monitoring (APM)
  - Help root cause analysis. Identify problem that could be cause by code issue, server performance, network latency
  - Check for response time, request rate, throughput, error rate, uptime
  - Check log for error
  - Check database query performance and number of connection
- End-user troubleshooting
  - Access app from user browser. Check for response time and DNS issue
