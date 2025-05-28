# Use imagem oficial do Ruby
FROM ruby:3.1.0

# Variáveis padrão de ambiente
ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true \
    BUNDLE_WITHOUT="development:test"

# Instala pacotes essenciais
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs yarn git curl

# Cria diretório da aplicação
WORKDIR /app

# Copia arquivos essenciais primeiro para aproveitamento de cache
COPY Gemfile* package.json yarn.lock ./
RUN bundle install && yarn install

# Copia o restante do app
COPY . .

# Pré-compila assets com a master key
RUN SECRET_KEY_BASE_DUMMY=1 RAILS_MASTER_KEY=${RAILS_MASTER_KEY} bundle exec rails assets:precompile

# Porta padrão
EXPOSE 3000

# Comando padrão
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
