FROM debian:jessie

WORKDIR /root
COPY out /root/zcash
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
CMD ["/root/start.sh"]
