apt_update 'Update the apt cache daily' do
    frequency 86_400
    action :periodic
end

mysql_service 'default' do
    port '3306'
    version '5.7'
    initial_root_password 'abc123'
    action [:create, :start]
end

mysql_client 'default' do
    action :create
end

mysql_database 'db_wordpress' do
    host 'localhost'
    user 'root'
    action :create
end

mysql_user 'wordpress_user' do
    password 'passwordpress'
    database_name 'db_wordpress'
    privileges [:all]
    action [:create, :grant]
end

mysql_database 'flush the privileges' do
    sql 'flush privileges'
    action :query
end