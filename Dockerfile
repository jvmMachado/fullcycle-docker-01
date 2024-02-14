FROM golang AS builder
WORKDIR /app
COPY main.go .
RUN go build main.go

FROM scratch
COPY --from=builder /app /app
ENTRYPOINT [ "/app/main" ]