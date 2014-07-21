#!/bin/bash

export APP_ROOT=/vagrant

sudo apt-get update

sudo apt-get install -y nginx autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libsqlite3-dev postgresql libpq-dev pv git nodejs

$APP_ROOT/deploy/ruby.sh

$APP_ROOT/deploy/rails.sh

$APP_ROOT/deploy/nginx.sh
