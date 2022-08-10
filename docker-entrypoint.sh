#!/bin/sh

rm -f tmp/pids/server.pid
bundle exec rake db:mongoid:create_indexes
bundle exec falcon serve --bind http://0.0.0.0:3000
# bin/rails server -b 0.0.0.0 -p 3000