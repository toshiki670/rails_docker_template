FROM ruby:2.5.0
LABEL maintainer 'Toshiki Kawazoe <toshiki.k.000@gmail.com>'

# set environment variables
ENV LANG C.UTF-8
ENV APP_ROOT /myapp

# install essential libraries
RUN apt-get update -qq && apt-get install -y build-essential mysql-client libpq-dev

# install node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs

# install yarn
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# move to app_root
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# bundle install
ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install

ADD . $APP_ROOT
