# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Added untested support for BladeRF, HackRF, SoapySDR
- Added many new options

### Changed
- Switch to Readsb dev branch
- Update Readsb to [#3dc36ea](https://github.com/wiedehopf/readsb/commit/3dc36eac3d1905ead7427b3180f5885e0a7ba15f)

## [1.3.0] - 2022-07-26
### Added
- Added new options `RANGE_OUTLINE_HOURS`, `NET_JSON_PORT_INTERVAL`, `NET_JSON_PORT_INCLUDE_NOPOSITION`, `WRITE_BINCRAFT_OLD`, `TAR1090_USE_API`
- Added zstd

### Changed
- Update Readsb to [#7ac8db5](https://github.com/wiedehopf/readsb/commit/7ac8db5110ea16a824e103788d37dd90774f9547)
- Removed patches as they are no longer necessary

## [1.2.0] - 2022-02-27
### Changed
- Update Readsb to [#c04c005](https://github.com/wiedehopf/readsb/commit/c04c005d0eb4e325fd8f39cbfb64ca0199615072)
- Change multiple default values, see [#f0e03c7](https://github.com/flighttrackr/docker-readsb/commit/f0e03c75a15b03733a1e546237b7d68fb49787b8)

## [1.1.0] - 2021-11-30
### Changed
- Update Alpine from 3.14 to 3.15
- Update Readsb to [#b27ba6b](https://github.com/wiedehopf/readsb/commit/b27ba6bde1d31e8eef6b75d7c7e15adec5d0d0f3)
- Added new option `BEAST_BAUDRATE`

## [1.0.1] - 2021-11-24
### Changed
- Add new Docker tag `:edge`, which reflects the current state of the main branch
- GitHub Build workflow doesn't run twice on dependabot pull requests
- Use centralized GitHub Action workflows

## [1.0.0] - 2021-11-23
### Changed
- First release based on Readsb [#4871fa0](https://github.com/wiedehopf/readsb/tree/4871fa05f322eb9be62d30a3fba6e8bb952308d0)
