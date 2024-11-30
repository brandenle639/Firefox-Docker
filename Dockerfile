FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND teletype
COPY install.sh /install.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN /install.sh || true
RUN rm -r /install.sh
USER fire
WORKDIR /home/fire
ENTRYPOINT /entrypoint.sh