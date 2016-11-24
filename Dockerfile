FROM ubuntu:16.04

ENV CLICKHOUSE_CONFIG /etc/clickhouse-server/config.xml
ENV CLICKHOUSE_VERSION 1.1.54074

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4
RUN mkdir -p /etc/apt/sources.list.d
RUN echo "deb http://repo.yandex.ru/clickhouse/xenial stable main" | tee /etc/apt/sources.list.d/clickhouse.list

RUN apt-get update && apt-get install -y clickhouse-server-common=$CLICKHOUSE_VERSION && apt-get clean

EXPOSE 9000 8123 9009

CMD ["service", "clickhouse-server", "start --config=$CLICKHOUSE_CONFIG"]
