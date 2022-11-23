FROM python:3.9.15-bullseye
MAINTAINER Chai Feng <chaifeng@chaifeng.com>

RUN pip3 install PyMySQL==1.0.2 mycli==1.26.1 \
    && apt-get update \
    && apt-get install -y less locales \
    && locale-gen en_US.UTF-8 \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mycli"]
