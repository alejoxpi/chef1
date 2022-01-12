require 'spec_helper'

  describe 'php::default' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge('apache2::default',described_recipe) }

    it 'add a package with an explicit action' do
      expect(chef_run).to install_package('php')
      expect(chef_run).to_not install_package('no_php')
    end

    it 'add a package and verify the notify' do
      expect(chef_run).to install_package('libapache2-mod-php')
      expect(chef_run.package('libapache2-mod-php')).to notify('service[apache2]').to(:restart)
      expect(chef_run.package('libapache2-mod-php')).to_not notify('service[apache2]').to(:install)
    end

  end

  describe 'apache2::default' do
    let(:chef_run_apache2) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }  

    it 'start a service with an explicit action' do
      expect(chef_run_apache2).to enable_service('apache2')
      expect(chef_run_apache2).to_not enable_service('no_apache2')
      expect(chef_run_apache2).to start_service('apache2')
      expect(chef_run_apache2).to_not start_service('no_apache2')
    end

    it 'does not match other actions' do
      expect(chef_run_apache2).to_not disable_service('apache2')
      expect(chef_run_apache2).to_not stop_service('apache2')
    end

  end

  describe 'wordpress::default' do
    let(:chef_run_wordpress) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04').converge(described_recipe) }  
  
    it 'runs a execute with an explicit action' do
      expect(chef_run_wordpress).to run_execute('c1')
      expect(chef_run_wordpress).to_not run_execute('c00')
    end
  end