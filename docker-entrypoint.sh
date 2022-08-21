#!/bin/sh

bundle exec rake db:mongoid:create_indexes
bundle exec ./falcon.rb
