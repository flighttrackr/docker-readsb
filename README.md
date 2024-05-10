# Readsb

[![Release](https://github.com/flighttrackr/docker-readsb/actions/workflows/release.yml/badge.svg)](https://github.com/flighttrackr/docker-readsb/actions/workflows/release.yml)

This project makes [wiedehopf]'s [Readsb] software available as a Docker image.

Due to the API limitations of Docker Hub, we use GitHub as container image registry.

The image is compiled with RTLSDR, BladeRF, HackRF and SoapySDR enabled (BladeRF, HackRF and SoapySDR are untested).

## Other projects

We have other Flighttracking projects, check our [GitHub profile].

## Supported architectures

- linux/amd64
- linux/arm/v6
- linux/arm/v7
- linux/arm64
- linux/386

## Tested adapters

- _Should work with every RTL-SDR dongle_
- `0bda:2838` Realtek Semiconductor Corp. RTL2838 DVB-T

## Run container

```shell
docker run \
  -it --rm \
  --device=/dev/bus/usb:/dev/bus/usb \
  ghcr.io/flighttrackr/readsb:latest
```

## Environment variables

Since Readsb offers a lot of setting options, we refer here to our [entrypoint.sh] script and [Dockerfile].


[wiedehopf]: https://github.com/wiedehopf
[Readsb]: https://github.com/wiedehopf/readsb
[GitHub profile]: https://github.com/flighttrackr
[entrypoint.sh]: ./entrypoint.sh
[Dockerfile]: ./Dockerfile
