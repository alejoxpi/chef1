# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'pruebas'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'apache2::default','mysql::default'

# Specify a custom source for a single cookbook:
cookbook 'apache2', path: './cookbooks_test/apache2'
cookbook 'mysql', path: './cookbooks_test/mysql'
