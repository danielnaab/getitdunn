FROM ruby:2.2.10

RUN apt-get update \
  && apt-get install --force-yes -y nodejs

ADD . /src
WORKDIR /src

RUN bundle install
