FROM debian:jessie

EXPOSE 8232
EXPOSE 8233
EXPOSE 18232
EXPOSE 18233

RUN apt-get update && \
    apt-get install -y libgomp1 wget

WORKDIR /root
COPY out /root/zcash
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
