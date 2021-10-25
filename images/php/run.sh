#if [ -d "/var/www/html/$APPPATH" ]; then
#    composer install --working-dir=/var/www/html/$APPPATH
#else
#    composer create-project laravel/laravel /var/www/html/$APPPATH;
#fi

#if [$HAS_AUTHENTICATION_TAIL == true]; then
#    composer require laravel/breeze --dev
#    php artisan breeze:install
#fi

#if [$HAS_AUTHENTICATION_BOOTS == true]; then
#    composer require laravel/ui
#    php artisan ui bootstrap --auth
#fi

# npm install
# npm run dev
# php artisan vendor:publish --tag=public
# php artisan migrate
# php artisan db:seed --force;
# chmod 777 /var/www/html/$APPPATH/storage -R;
# cp /var/www/html/$APPPATH/.env.example /var/www/html/$APPPATH/.env