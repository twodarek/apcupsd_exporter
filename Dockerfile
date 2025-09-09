FROM golang:1.24

RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get autoremove -y && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

WORKDIR /app
COPY . ./
RUN go build -o /app/apcupsd_exporter cmd/apcupsd_exporter/main.go

EXPOSE 9162
ENTRYPOINT ["/app/entrypoint.sh"]

