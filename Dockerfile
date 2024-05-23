# Builder
FROM alpine:3.20.0 AS builder

ARG UPSTREAM_REMOTE
ARG UPSTREAM_BRANCH
ARG UPSTREAM_COMMIT

# Packages
RUN apk add --no-cache build-base git ncurses-dev zstd-dev zlib-dev \
    librtlsdr-dev bladerf-dev hackrf-dev soapy-sdr-dev

# Workdir
WORKDIR /app

# Get readsb
RUN git clone -b ${UPSTREAM_BRANCH} ${UPSTREAM_REMOTE} . && \
    git -c advice.detachedHead=false checkout ${UPSTREAM_COMMIT} && \
    mkdir patches

# Apply patches
COPY patches/* patches/
RUN if [ $(ls patches/*.patch > /dev/null) ]; then git apply patches/*.patch; fi

# Compile
RUN make readsb RTLSDR=yes BLADERF=yes HACKRF=yes SOAPYSDR=yes


# Release
FROM alpine:3.20.0 AS release

# Packages
RUN apk add --no-cache bash ncurses-libs zstd-libs zlib \
    rtl-sdr bladerf-libs hackrf-libs soapy-sdr-libs

# Workdir
WORKDIR /app

COPY --from=builder /app/readsb /app/readsb
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh /app/readsb && \
    mkdir /data

# Environment
ENV LAT="" \
    LON="" \
    MAX_RANGE="360" \
    METRIC="no" \
    INTERACTIVE="no" \
    NO_INTERACTIVE="yes" \
    INTERACTIVE_TTL="" \
    ENABLE_BIASTEE="no" \
    QUIET="yes" \
    DEBUG="" \
    DEVEL="" \
    \
    UUID="" \
    UUID_FILE="/data/uuid.txt" \
    \
    DEVICE_TYPE="rtlsdr" \
    DEVICE="" \
    GAIN="-10" \
    FREQ="1090000000" \
    PREAMBLE_THRESHOLD="" \
    SDR_BUFFER_SIZE="" \
    \
    FIX="yes" \
    NO_FIX="no" \
    FILTER_DF="" \
    DCFILTER="no" \
    AGGRESSIVE="no" \
    \
    SHOW_ONLY="" \
    RAW="" \
    ONLYADDR="no" \
    \
    MODEAC="yes" \
    MODEAC_AUTO="no" \
    \
    MLAT="yes" \
    FORWARD_MLAT_BEAST="yes" \
    FORWARD_MLAT_SBS="yes" \
    \
    STATS="" \
    STATS_RANGE="" \
    STATS_EVERY="" \
    \
    HEATMAP_DIR="" \
    HEATMAP="" \
    \
    GNSS="no" \
    SNIP="" \
    WRITE_PROM="" \
    WRITE_STATE="" \
    WRITE_STATE_EVERY="" \
    WRITE_STATE_ONLY_ON_EXIT="no" \
    WRITE_GLOBE_HISTORY="" \
    WRITE_JSON="" \
    WRITE_JSON_EVERY="" \
    WRITE_JSON_GLOBE_INDEX="no" \
    WRITE_JSON_GZIP="no" \
    WRITE_JSON_BINCRAFT_ONLY="" \
    WRITE_BINCRAFT_OLD="no" \
    WRITE_RECEIVER_ID_JSON="no" \
    JSON_LOCATION_ACCURACY="2" \
    JSON_TRACE_INTERVAL="" \
    JSON_RELIABLE="" \
    AUTO_EXIT="" \
    RANGE_OUTLINE_HOURS="" \
    \
    JAERO_TIMEOUT="" \
    \
    DB_FILE="" \
    DB_FILE_LT="" \
    \
    RECEIVER_FOCUS="" \
    CPR_FOCUS="" \
    LEG_FOCUS="" \
    TRACE_FOCUS="" \
    \
    NET="yes" \
    NET_BUFFER="" \
    NET_VERBATIM="" \
    NET_HEARTBEAT="60" \
    NET_CONNECTOR="" \
    NET_CONNECTOR_DELAY="" \
    NET_ONLY="no" \
    NET_BIND_ADDRESS="" \
    NET_RECEIVER_ID="" \
    NET_INGEST="" \
    NET_GARBAGE="" \
    NET_API_PORT="" \
    API_SHUTDOWN_DELAY="" \
    NET_JSON_PORT="" \
    NET_JSON_PORT_INTERVAL="" \
    NET_JSON_PORT_INCLUDE_NOPOSITION="no" \
    NET_RO_SIZE="" \
    NET_RO_INTERVAL="0.05" \
    NET_RO_INTERVAL_BEAST_REDUCE="" \
    NET_BO_PORT="" \
    NET_BI_PORT="" \
    NET_RO_PORT="" \
    NET_RI_PORT="" \
    NET_UAT_REPLAY_PORT="" \
    NET_UAT_IN_PORT="" \
    NET_SBS_REDUCE="" \
    NET_SBS_PORT="" \
    NET_SBS_IN_PORT="" \
    NET_SBS_JAERO_PORT="" \
    NET_SBS_JAERO_IN_PORT="" \
    NET_ASTERIX_OUT_PORT="" \
    NET_ASTERIX_IN_PORT="" \
    NET_ASTERIX_REDUCE="" \
    NET_VRS_INTERVAL="" \
    NET_VRS_PORT="" \
    NET_BEAST_REDUCE_INTERVAL="" \
    NET_BEAST_REDUCE_FILTER_DIST="" \
    NET_BEAST_REDUCE_FILTER_ALL="" \
    NET_BEAST_REDUCE_OUT_PORT="" \
    TAR1090_USE_API="no" \
    \
    ENABLE_AGC="no" \
    PPM="0" \
    \
    BLADERF_FPGA="" \
    BLADERF_DECIMATION="" \
    BLADERF_BANDWIDTH="" \
    \
    HACKRF_ENABLE_AMPGAIN="" \
    HACKRF_VGAGAIN="" \
    \
    DUMP_BEAST="" \
    BEAST_SERIAL="" \
    BEAST_DF1117_ON="no" \
    BEAST_MLAT_OFF="no" \
    BEAST_CRC_OFF="no" \
    BEAST_DF045_ON="no" \
    BEAST_FEC_OFF="no" \
    BEAST_MODEAC="no" \
    BEAST_BAUDRATE="" \
    \
    IFILE="" \
    IFORMAT="" \
    THROTTLE="no" \
    \
    SOAPY_DEVICE="" \
    SOAPY_ANTENNA="" \
    SOAPY_BANDWIDTH="" \
    SOAPY_ENABLE_AGC="no" \
    SOAPY_GAIN_ELEMENT="" \
    \
    CUSTOM=""

# Entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]

# Command
CMD [ "sh", "-c", "/app/readsb" ]
