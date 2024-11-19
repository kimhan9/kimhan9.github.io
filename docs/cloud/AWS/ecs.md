# ECS

Generate ECS task definition skeleton
```
aws ecs register-task-definition --generate-cli-skeleton
```

Generate ECS service definition skeleton
```
aws ecs create-service --generate-cli-skeleton
```

## Cloudformation

[Example ECS Cloudformation template 1](cf1.json)

Example ECS Cloudformation template 2
```
# ECS template
version: '3'
services:
  dev:
    build:
      context: .
      dockerfile: cmd/proxy/Dockerfile
      args:
        GOLANG_VERSION: 1.13
      environment:
        - ATHENS_TRACE_EXPORTER=jaeger
        - ATHENS_TRACE_EXPORTER_URL=http://172.30.2.27:14268
        - ATHENS_STORAGE_TYPE=memory
        - AWS_REGION=ap-southeast-1
        - AWS_ACCESS_KEY_ID=<access-key>
        - AWS_SECRET_ACCESS_KEY=<secret>
        - ATHENS_S3_BUCKET_NAME=kim-athens
      ports:
        - 3000:3000
      depends_on:
        - jaeger
    jaeger:
      environment:
       - COLLECTOR_ZIPKIN_HTTP_PORT=9441
      image: jaegertracing/all-in-one:latest
      ports:
        - 14268:14268
        - 9411:9411
        - 5775:5775/udp
        - 6831:6831/udp
        - 6832:6832/udp
        - 5778:5778
        - 16686:16686

# Athens parameter
ATHENS_STORAGE_TYPE=s3
AWS_REGION=ap-southeast-1
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
ATHENS_S3_BUCKET_NAME=kim-athens

# Build docker image
docker-compose build

# Authenticate your Docker client to your registry.
$(aws ecr get-login --no-include-email --region ap-southeast-1)

# Push to AWS repository
docker-compose push

# Test Athens proxy
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
export GOPROXY=<athens-elb-url>
git clone <https://github.com/athens-artifacts/walkthrough.git>
cd walkthrough
go run .

```

## Create ECS service

```
aws ecs register-task-definition --cli-input-json file://epps-core-staging-tf.json

SERVICE_NAME="epps-core-staging"
TARGET_GROUP_ARN="<target-group-arn>"
CONTAINER_PORT=10082

aws ecs create-service \
  --cluster Staging \
  --service-name ${SERVICE_NAME} \
  --task-definition ${SERVICE_NAME} \
  --desired-count 1 \
  --deployment-configuration "maximumPercent=200,minimumHealthyPercent=100,deploymentCircuitBreaker={enable=true,rollback=true}" \
  --placement-strategy type="spread",field="attribute:ecs.availability-zone" type="binpack",field="memory" \
  --load-balancers "targetGroupArn=${TARGET_GROUP_ARN},containerName=${SERVICE_NAME},containerPort=${CONTAINER_PORT}" \
  --launch-type EC2
```