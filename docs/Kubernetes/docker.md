# Docker

## Key Docker Instructions

1. `FROM`: Set base image
2. `RUN`: Executes a command in a new layer
3. `COPY`: Copy files and directories from build context into container
4. `ADD`: Similar as COPY with added extract feature
5. `ENV`: Set environment variables
6. `EXPOSE`: Inform docker which port to listen
7. `ENTRYPOINT`: Configure container to be executable
8. `CMD`: Specifies a default command when container started
9. `VOLUME`: Create a mount point for external storage volume
10. `WORKDIR`: Set the working directory for subsequent command

## Best Practices

1. Use minial base images
2. Use multi-stage builds
3. Reduce layers. Combining command to reduce number of layer
4. Optimize layer caching. Order least change command at the top
5. Delete log, temporary files and caches to reduce image size
6. Never include sensitive data (password, API key)
7. Use `.dockerignore`
8. Run non-root user
9. Scan for vulnerabilities. Use Trivy

## Example Dockerfile
```
FROM nginx:latest
COPY ./webapp /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Example 2
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
```

## Command
- `docker run`
- `docker build`
- `docker pull`
- `docker push`
- `docker image`: List all local docker image
- `docker ps`
- `docker stop`
- `docker rm`: Remove docker container
- `docker rmi`: Remove docker image
- `docker exec`
- `docker logs`
- `docker compose`

## CMD vs ENTRYPOINT
| `entrypoint` | `CMD` |
| ------------ | ----- |
| Set fixed command when container start | Set default command/argument |
| Append argument at runtime | Can overridden at runtime |

```
FROM alpine:latest
ENTRYPOINT ["ls"]
CMD ["-alh"]
```

## ADD vs COPY
| `COPY` | `ADD` |
| ------ | ----- |
| Copy files and directories to docker image | Same as Copy with additional extract compressed files and copy files from remote via URL |

## Advantage of Docker
- Portability: Containers run consistently across different environments
- Efficiency: Lightweight compared to virtual machines, saving system resources
- Isolation: Containers are isolated, reducing conflicts between applications
- Scalability: Easy to scale and distribute containerized applications
- Rapid Deployment: Quick to build and deploy applications
- Version Control and Reusability: Facilitates version control and reuse of container images
- Simplified Configuration: Simplifies the setup and configuration of applications

## Disadvantage of Docker
- Security Concerns: Containers share the host OS kernel, potentially leading to security vulnerabilities
- Complexity: Managing and orchestrating numerous containers can be complex
- Persistent Storage: Managing data persistence for containers can be challenging
- Performance Overhead: Some performance overhead, especially in high-density environments
- Compatibility: Not all applications are suitable for containerization
- Learning Curve: Requires learning new tools and concepts