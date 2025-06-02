FROM ruby:3.1

ENV BUNDLER_VERSION=2.5.18 \
  NODE_VERSION=20.12.2 \
  YARN_VERSION=1.22.22

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl git

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
  apt-get install -y nodejs && \
  npm install -g yarn@$YARN_VERSION

RUN gem install bundler -v "$BUNDLER_VERSION"

WORKDIR /app


COPY . .

COPY Gemfile* ./

RUN bundle install

RUN yarn install

EXPOSE 3000
