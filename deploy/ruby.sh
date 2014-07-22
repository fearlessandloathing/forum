#!/bin/bash

cd $APP_ROOT/deploy/vendor

echo $APP_ROOT > /test.txt

if [ ! -d ruby-2.1.2 ]; then
  echo Need to recompile ruby >&2
  pv ruby-2.1.2.tar.gz | tar zxp
  cd ruby-2.1.2
  ./configure
  make
  cd ..
fi

cd ruby-2.1.2

make install

#cp /vagrant/deploy/vendor/ruby-2.1.2.tar.gz /opt

#cd /opt

#tar xzvf ruby-2.1.2.tar.gz

#cd ruby-2.1.2

#./configure

#make

#make install

