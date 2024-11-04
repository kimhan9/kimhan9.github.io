# Docker

## Key Docker Instructions

1. FROM: Set base image
2. RUN: Executes a command in a new layer
3. CMD: Specifies a default command when container started
4. COPY: Copy files and directories from build context into container
5. ADD: Similar as COPY with added extract feature
6. ENV: Set environment variables
7. EXPOSE: Inform docker which port to listen
8. ENTRYPOINT: Configure container to be executable
9. VOLUME: Create a mount point for external storage volume
10. WORKDIR: Set the working directory for subsequent command

## Best Practices

1. Use minial base images
2. Reduce layers. Combining command to reduce number of layer
3. Optimize layer caching
4. Delete log, temporary files and caches to reduce image size
5. Never include sensitive data (password, API key)
6. Utilized .dockerignore
7. Employ multi-stage build
8. Run as non-root
9. Scan for vulnerabilities. Use Trivy


## CMD vs ENTRYPOINT
| `entrypoint` | `CMD` |
| ------------ | ----- |
| Set the process to execute when container start | Supplies default arguments to process |

```
FROM alpine:latest
ENTRYPOINT ["ls"]
CMD ["-alh"]
```

## ADD vs COPY
- COPY: Copy files and directories to docker image
- ADD: Same as Copy with additional extract compressed files and copy files from remote via URL

## Example
```
FROM nginx:latest
COPY ./webapp /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```