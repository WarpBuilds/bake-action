ARG BUILD_TYPE=quick

FROM ubuntu:22.04 as base
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Quick build stage
FROM base as quick
RUN echo "This is a quick build" > /build-info.txt

# Heavy build stage
FROM base as heavy
# Simulate heavy build by installing more packages and running some commands
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*
RUN echo "This is a heavy build" > /build-info.txt
# Simulate some heavy processing
RUN dd if=/dev/zero of=/tmp/largefile bs=1M count=100
RUN rm /tmp/largefile

# Final stage
FROM ${BUILD_TYPE}
CMD ["cat", "/build-info.txt"] 