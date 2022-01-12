control 'service' do
    impact 1
    desc 'Apache2 service is running'
  
    case os[:family]
    when 'debian', 'suse'
      describe service('apache2') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end
    else
      describe service('httpd') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end
    end
  end