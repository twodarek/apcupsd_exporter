# apcupsd_exporter [![Linux Test Status](https://github.com/twodarek/apcupsd_exporter/workflows/Linux%20Test/badge.svg)](https://github.com/twodarek/apcupsd_exporter/actions)  [![GoDoc](http://godoc.org/github.com/twodarek/apcupsd_exporter?status.svg)](http://godoc.org/github.com/twodarek/apcupsd_exporter)

Command `apcupsd_exporter` provides a Prometheus exporter for the
[apcupsd](http://www.apcupsd.org/) Network Information Server (NIS). MIT
Licensed.

## Usage

Available flags for `apcupsd_exporter` include:

```
$ ./apcupsd_exporter -h
Usage of ./apcupsd_exporter:
  -apcupsd.addr string
        address of apcupsd Network Information Server (NIS) (default ":3551")
  -apcupsd.network string
        network of apcupsd Network Information Server (NIS): typically "tcp", "tcp4", or "tcp6" (default "tcp")
  -telemetry.addr string
        address for apcupsd exporter (default ":9162")
  -telemetry.path string
        URL path for surfacing collected metrics (default "/metrics")
```

For running `apcupsd_exporter` in docker:

Prerequisites:
 - [apcupsd](https://linux.die.net/man/8/apcupsd) and [apcaccess](https://linux.die.net/man/8/apcaccess) installed on the docker host

```
$ docker run ghcr.io/twodarek/apcupsd_exporter:latest --expose 9162:9162 --env APCUPS_ADDR=<docker_host_ip>:3551
```

## Example Prometheus config

```
scrape_configs:
  - job_name: 'ups'
    static_configs:
    - targets: ['<docker_host_ip>:9162']
    scrape_interval: 1s
    scrape_timeout: 1s
```
