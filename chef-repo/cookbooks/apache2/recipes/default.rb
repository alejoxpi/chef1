apt_update 'Update the apt cache daily' do
    frequency 86_400
    action :periodic
end

package "apache2" do
    action :install
end

service "apache2" do
    action [:enable, :start]
end