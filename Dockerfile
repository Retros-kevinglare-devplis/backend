FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs
RUN gem install bundler --version '2.3.19'
RUN mkdir /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
EXPOSE 9292
