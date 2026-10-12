FROM mcr.microsoft.com/devcontainers/base:bookworm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openscad \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*