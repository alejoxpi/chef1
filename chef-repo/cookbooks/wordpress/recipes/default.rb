execute 'c0' do
    command 'wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp'
    action :run
end

execute 'c1' do
    command 'sudo chmod +x /tmp/wp-cli.phar'
    action :run
end

execute 'c2' do
    command 'sudo mv /tmp/wp-cli.phar /usr/local/bin/wp'
    action :run
end

execute 'c3' do
    command 'sudo adduser www-data vagrant'
    action :run
end

execute 'c4' do
    command 'sudo chmod 775 $HOME'
    action :run
end

execute 'c5' do
    command 'sudo chown -R www-data:www-data /var/www/html'
    action :run
end

execute 'c6' do
    command 'sudo rm -fr /var/www/html/index.html'
    action :run
end

execute 'c8' do
    command 'sudo -u www-data wp core download --locale=es_ES --path=/var/www/html'
    action :run
end

execute 'c9' do
    command 'sudo -u www-data wp core config --dbname=db_wordpress --dbuser=wordpress_user --dbpass=passwordpress --dbhost=localhost --path=/var/www/html'
    action :run
end

execute 'c10' do
    command 'sudo -u www-data wp core install --url=192.168.33.40 --title=Prueba --admin_user=supervisor --admin_password=aabbccdd --admin_email=super@unir.com --skip-email --path=/var/www/html'
    action :run
end