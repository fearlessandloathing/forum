#!/bin/bash

gem install bundler

cd $APP_ROOT

bundle install

foreman export --app gobcom --user root upstart /etc/init
