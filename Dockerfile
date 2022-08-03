FROM ruby:3.1.2
RUN gem install bundler --version "2.3.19"
RUN apt-get update -qq && apt-get install -y nodejs libv8-dev
RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app
COPY vendor /app/vendor
RUN bundle install
COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "puma"]

