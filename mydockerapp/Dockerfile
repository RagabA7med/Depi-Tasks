FROM ubuntu:22.04

ARG APP_VERSION=1.0

ENV APP_VERSION=${APP_VERSION}

WORKDIR /app

COPY entrypoint.sh .

RUN apt-get update && apt-get install -y curl gcc

ENTRYPOINT ["./entrypoint.sh"]

CMD ["bash"]

