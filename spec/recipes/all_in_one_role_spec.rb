require 'spec_helper'

describe 'capistrano-wordpress::all-in-one-role' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['mysql']['server_debian_password'] = 'password'
      node.set['mysql']['server_root_password'] = 'password'
      node.set['mysql']['server_repl_password'] = 'password'
    end.converge(described_recipe)
  end

  before do
    stub_command("php -m | grep 'Phar'").and_return(true)
    stub_command('/usr/sbin/apache2 -t').and_return(true)
    stub_command("\"/usr/bin/mysql\" -u root -e 'show databases;'").and_return(true)
  end

  it 'should include the capistrano-wordpress::web-app-role recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::web-app-role')
  end

  it 'should include the capistrano-wordpress::mysql-role recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::mysql-role')
  end
end
