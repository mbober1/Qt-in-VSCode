FROM debian:12.10-slim AS base

ENV DEBIAN_FRONTEND=noninteractive
ARG HOST_ARCH="x86_64"
ARG TOOLCHAIN_TARGET_ARCH="aarch64"
ARG TOOLCHAIN_VER="14.2.rel1"


FROM base AS toolchain_stage
RUN \
	apt-get -y update && \
	apt-get --no-install-recommends -y install \
		tar ca-certificates xz-utils

# Get cross-compilation toolchain
WORKDIR /opt
ADD https://developer.arm.com/-/media/Files/downloads/gnu/${TOOLCHAIN_VER}/binrel/arm-gnu-toolchain-${TOOLCHAIN_VER}-${HOST_ARCH}-${TOOLCHAIN_TARGET_ARCH}-none-linux-gnu.tar.xz /opt
RUN tar xf arm-gnu-toolchain-${TOOLCHAIN_VER}-${HOST_ARCH}-${TOOLCHAIN_TARGET_ARCH}-none-linux-gnu.tar.xz



FROM base AS final

ARG UID=1000
ARG GID=1000
ARG USERNAME="user"
SHELL ["/bin/bash", "-c"]

# Get dependences
RUN dpkg --add-architecture arm64
RUN \
	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get --no-install-recommends -y install \
		git \
		wget \
		ca-certificates \
		cmake \
		ninja-build \
		meson \
		pkg-config \
		pkg-config:arm64 \
		gdb \
		ssh \
		rsync \
    build-essential \
    libfontconfig1 \
    mesa-common-dev  \
    libglu1-mesa-dev \
    libgtest-dev \
		qtbase5-dev:amd64 \
		qtbase5-dev:arm64 \
		qttools5-dev-tools \
	&& \
	apt-get clean -y && \
	apt-get autoremove --purge -y && \
	rm -rf /var/lib/apt/lists/*

ENV PATH="$PATH:/opt/arm-gnu-toolchain-${TOOLCHAIN_VER}-${HOST_ARCH}-${TOOLCHAIN_TARGET_ARCH}-none-linux-gnu/bin"


# RUN \
# 	apt-get -y update && \
# 	apt-get --no-install-recommends -y install \
# 		qttools5-dev-tools:arm64 \
# 	&& \
# 	apt-get clean -y && \
# 	apt-get autoremove --purge -y && \
# 	rm -rf /var/lib/apt/lists/*
	
# Create user
RUN groupadd -g $GID -o ${USERNAME}
RUN useradd -u $UID -m -g ${USERNAME} ${USERNAME}
USER ${USERNAME}

WORKDIR /home/${USERNAME}
COPY --from=toolchain_stage /opt/arm-gnu-toolchain-${TOOLCHAIN_VER}-${HOST_ARCH}-${TOOLCHAIN_TARGET_ARCH}-none-linux-gnu /opt/arm-gnu-toolchain-${TOOLCHAIN_VER}-${HOST_ARCH}-${TOOLCHAIN_TARGET_ARCH}-none-linux-gnu
