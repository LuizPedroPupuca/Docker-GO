FROM golang:alpine AS builder
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY main.go .
RUN go build -o main .

FROM scratch
COPY --from=builder /app/main /app/main
CMD ["/app/main"]