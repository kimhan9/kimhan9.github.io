FROM golang:1.22-alpine as builder
WORKDIR /app
ADD . /app
RUN go build -o main-application main.go

FROM gcr.io/distroless/static-debian11
COPY --from=builder /app/main-application /
EXPOSE 8000
CMD ["/main-application"]