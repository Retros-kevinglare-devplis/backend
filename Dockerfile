FROM ruby:3.1.2
RUN gem install bundler --version "2.3.19"
RUN mkdir /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install

EXPOSE 9292 9293

CMD ./docker-entrypoint.sh
