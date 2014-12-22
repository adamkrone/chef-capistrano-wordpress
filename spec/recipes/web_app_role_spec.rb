require 'spec_helper'

describe 'capistrano-wordpress::web_app_role' do
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
  end

  it 'should include the apt::default recipe' do
    expect(chef_run).to include_recipe('apt::default')
  end

  it 'should include the capistrano-base::user recipe' do
    expect(chef_run).to include_recipe('capistrano-base::user')
  end

  it 'should include the capistrano-base::ssh recipe' do
    expect(chef_run).to include_recipe('capistrano-base::ssh')
  end

  it 'should include the capistrano-wordpress::app recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::app')
  end

  it 'should include the capistrano-wordpress::environment recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::environment')
  end
end
