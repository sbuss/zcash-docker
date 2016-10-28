FROM debian:jessie

RUN apt-get update && \
    apt-get install -y libgomp1 wget

WORKDIR /root
COPY out /root/zcash
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
