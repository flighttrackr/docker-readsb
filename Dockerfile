# Builder
FROM alpine:3.16.2 AS builder

ARG UPSTREAM_REMOTE
ARG UPSTREAM_BRANCH
ARG UPSTREAM_COMMIT

# Packages
RUN apk add --no-cache build-base git librtlsdr-dev ncurses-dev zstd-dev zlib-dev

# Workdir
WORKDIR /app

# Get readsb
RUN git clone -b ${UPSTREAM_BRANCH} ${UPSTREAM_REMOTE} . && \
    git -c advice.detachedHead=false checkout ${UPSTREAM_COMMIT}

# Compile
RUN make readsb RTLSDR=yes


# Release
FROM alpine:3.16.2 AS release

# Packages
RUN apk add --no-cache bash rtl-sdr ncurses zstd zlib

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
    ENABLE_AGC="no" \
    PPM="0" \
    GAIN="-10" \
    FREQ="1090000000" \
    PREAMBLE_THRESHOLD="" \
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
    FORWARD_MLAT="yes" \
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
    NET_JSON_PORT="" \
    NET_JSON_PORT_INTERVAL="" \
    NET_JSON_PORT_INCLUDE_NOPOSITION="no" \
    NET_RO_SIZE="" \
    NET_RO_INTERVAL="0.05" \
    NET_RO_PORT="" \
    NET_RI_PORT="" \
    NET_BO_PORT="" \
    NET_BI_PORT="" \
    NET_SBS_REDUCE="" \
    NET_SBS_PORT="" \
    NET_SBS_IN_PORT="" \
    NET_SBS_JAERO_PORT="" \
    NET_SBS_JAERO_IN_PORT="" \
    NET_VRS_INTERVAL="" \
    NET_VRS_PORT="" \
    NET_BEAST_REDUCE_INTERVAL="" \
    NET_BEAST_REDUCE_FILTER_DIST="" \
    NET_BEAST_REDUCE_FILTER_ALL="" \
    NET_BEAST_REDUCE_OUT_PORT="" \
    TAR1090_USE_API="no" \
    \
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
    CUSTOM=""

# Entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]

# Command
CMD [ "sh", "-c", "/app/readsb" ]
