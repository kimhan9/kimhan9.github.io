# Docker

## `CMD` vs `ENTRYPOINT`
- `entrypoint` set the process to execute when container start
- `cmd` supplies default arguments to process
```
FROM alpine:latest
ENTRYPOINT ["ls"]
CMD ["-alh"]
```