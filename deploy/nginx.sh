

rm /etc/nginx/sites-enabled/default

cp $APP_ROOT/deploy/conf/gobcom.conf /etc/nginx/sites-available

ln -sf /etc/nginx/sites-available/gobcom.conf /etc/nginx/sites-enabled/gobcom.conf

service nginx restart
