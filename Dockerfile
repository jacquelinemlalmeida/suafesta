FROM ruby:3.1.0

ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    BUNDLE_WITHOUT="development:test"

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs yarn git curl

WORKDIR /app

COPY Gemfile* package.json yarn.lock ./
RUN bundle install && yarn install

COPY . .

# 🔑 Recebe o secret no build
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

# ✅ Usa a master key como variável de ambiente (sem arquivo físico)
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
