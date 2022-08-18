#!/bin/sh

rm -f tmp/pids/server.pid
bundle exec rake db:mongoid:create_indexes
bundle exec falcon host
# bin/rails server -b 0.0.0.0 -p 3000