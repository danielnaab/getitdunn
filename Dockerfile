FROM ruby:2.2.10-alpine

#RUN apt-get update \
#  && apt-get install --force-yes -y nodejs
RUN apk update && \
  apk add nodejs git make g++

ADD . /src
WORKDIR /src

RUN bundle install
