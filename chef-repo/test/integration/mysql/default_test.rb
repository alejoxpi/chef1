control 'service' do
    impact 1
    desc 'MySQL service is running'
  
    case os[:family]
    when 'debian', 'suse'
      describe service('mysqld') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end
    else
      describe service('mysqld') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
      end
    end
  end