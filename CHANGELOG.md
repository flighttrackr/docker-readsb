# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Added new options `RANGE_OUTLINE_HOURS`, `NET_JSON_PORT_INTERVAL`, `NET_JSON_PORT_INCLUDE_NOPOSITION`

### Changed
- Update Readsb to [#73b5355](https://github.com/wiedehopf/readsb/commit/73b535575765657aee5e14d54d0812af242b5ba0)

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
