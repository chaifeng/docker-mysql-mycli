FROM python:3.9.7-bullseye
MAINTAINER Chai Feng <chaifeng@chaifeng.com>

RUN pip3 install PyMySQL==0.9.2 mycli==1.20.0

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mycli"]
