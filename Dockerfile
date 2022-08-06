FROM ruby:3.1.2
RUN gem install bundler --version "2.3.19"
RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app
RUN bundle install
COPY . /app

EXPOSE 3000 8080

CMD ./docker-entrypoint.sh

