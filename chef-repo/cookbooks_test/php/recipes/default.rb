#
# Cookbook:: php
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
 
# install php.
package "php" do
    action :install
end
package "php-pear" do
    action :install
end
package 'libapache2-mod-php' do
  action :install
  notifies :restart, "service[apache2]"
end
# Install php-mysql.
package 'php-mysql' do
    action :install
    notifies :restart, "service[apache2]"
end

#####

package 'php-curl' do
    action :install
    notifies :restart, "service[apache2]"
end

package 'php-gd' do
    action :install
    notifies :restart, "service[apache2]"
end

package 'php-mbstring' do
    action :install
    notifies :restart, "service[apache2]"
end

package 'php-xml' do
    action :install
    notifies :restart, "service[apache2]"
end

package 'php-xmlrpc' do
    action :install
    notifies :restart, "service[apache2]"
end