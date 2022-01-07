execute 'test-nagios-config' do
    command 'wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp'
    action :run
end