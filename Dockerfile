FROM golang:1.13

WORKDIR /app
COPY . ./
RUN go build -o /app/apcupsd_exporter cmd/apcupsd_exporter/main.go

EXPOSE 9162
ENTRYPOINT ["/app/entrypoint.sh"]

