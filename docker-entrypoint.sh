#!/bin/sh

rm -f tmp/pids/server.pid
rake db:mongoid:create_indexes
bin/rails server -b 0.0.0.0 -p 3000