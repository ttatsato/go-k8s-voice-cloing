FROM golang:1.26-alpine AS builder
WORKDIR /app

COPY go.mod ./
RUN go mod download || true
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /voice-api ./cmd/api/main.go

FROM alpine:3.19
RUN apk add --no-cache ca-certificates
COPY --from=builder /voice-api .

EXPOSE 8080
CMD ["./voice-api"]
