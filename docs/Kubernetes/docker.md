# Docker

## CMD vs ENTRYPOINT
| `entrypoint` | `CMD` |
| ------------ | ----- |
| Set the process to execute when container start | Supplies default arguments to process |

```
FROM alpine:latest
ENTRYPOINT ["ls"]
CMD ["-alh"]
```