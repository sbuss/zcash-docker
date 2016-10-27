FROM debian:jessie

RUN apt-get update && \
    apt-get install -y \
        build-essential pkg-config libc6-dev m4 g++-multilib \
        autoconf libtool ncurses-dev unzip git python \
        zlib1g-dev wget bsdmainutils automake


WORKDIR /
RUN cd /
RUN wget https://github.com/zcash/zcash/archive/v1.0.0-rc3.tar.gz
RUN tar -xzf v1.0.0-rc3.tar.gz && mv /zcash-1.0.0-rc3 /zcash
COPY build.sh /
RUN chmod +x /build.sh
CMD ["/build.sh"]
