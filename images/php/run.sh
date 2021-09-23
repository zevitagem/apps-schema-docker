#if [ -d "/var/www/html/$APPPATH" ]; then
#    composer install --working-dir=/var/www/html/$APPPATH
#else
#    composer create-project laravel/laravel /var/www/html/$APPPATH;
#fi

#fixed to test, I don't know why the above code doesn't work --'
composer create-project laravel/laravel /var/www/html/$APPPATH;
chmod 777 /var/www/html/$APPPATH/storage -R;

#/var/www/html/$APPPATH/artisan migrate --force;
#/var/www/html/$APPPATH/artisan db:seed --force;
#cp /var/www/html/$APPPATH/.env.example /var/www/html/$APPPATH/.env;

