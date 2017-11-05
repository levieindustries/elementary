FROM ruby:2.4.2-alpine3.6
MAINTAINER Lars Levie <larslevie@gmail.com>

RUN apk --update add \
      curl \
      postgresql-client \
      nodejs \
      make \
      tzdata

WORKDIR /code
COPY Gemfile Gemfile.* /code/
COPY docker/* /code/docker/
RUN chmod 655 /code/docker/*

ENV BUNDLE_GEMFILE=/code/Gemfile \
      BUNDLE_JOBS=4 \
      BUNDLE_RETRY=3 \
      BUNDLE_PATH=/bundle

RUN ./docker/install-gems

ENV CONTAINERPILOT=/etc/containerpilot.json5
ENV CONTAINERPILOT_VERSION 3.5.0
RUN curl -Lso /tmp/containerpilot.tar.gz \
      "https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz" \
    && tar -xz -f /tmp/containerpilot.tar.gz \
    && mv containerpilot /bin/ \
    && rm /tmp/containerpilot.tar.gz

COPY containerpilot.json5 /etc/
COPY . /code/

ENV CONSUL_URL consul

EXPOSE 3000

CMD ["/bin/containerpilot"]
