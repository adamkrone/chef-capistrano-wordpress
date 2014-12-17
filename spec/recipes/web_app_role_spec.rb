require 'spec_helper'

describe 'capistrano-wordpress::web-app-role' do
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

  it 'should include the capistrano-base::nodejs recipe' do
    expect(chef_run).to include_recipe('capistrano-base::nodejs')
  end

  it 'should include the capistrano-wordpress::php recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::php')
  end

  it 'should include the capistrano-wordpress::composer recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::composer')
  end

  it 'should include the capistrano-wordpress::apache2 recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::apache2')
  end

  it 'should include the capistrano-base::app recipe' do
    expect(chef_run).to include_recipe('capistrano-base::app')
  end

  it 'should include the capistrano-wordpress::environment recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress::environment')
  end
end
