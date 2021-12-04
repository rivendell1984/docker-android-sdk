FROM ubuntu:20.04

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin"

ARG ANDROID_BUILD_TOOLS_VERSION="31.0.0"

RUN apt-get update -qq		&& \
    DEBIAN_FRONTEND=noninteractive apt-get -qy install curl git make openjdk-11-jdk unzip && \
    apt-get clean 		&& \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY scripts /opt/scripts

WORKDIR /opt/android-sdk-linux

RUN /opt/scripts/sdk-install.sh ${ANDROID_BUILD_TOOLS_VERSION}

CMD ["/opt/scripts/entrypoint.sh"]
