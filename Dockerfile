FROM python:3.6-jessie
MAINTAINER Chai Feng <chaifeng@chaifeng.com>

RUN pip install mycli==1.16.0

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mycli"]
