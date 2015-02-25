require 'spec_helper'

describe 'capistrano-wordpress-test::web_app_role' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['mysql']['server_debian_password'] = 'my-root-password'
      node.set['mysql']['server_root_password'] = 'my-root-password'
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

  it 'should include the capistrano-base-test::user recipe' do
    expect(chef_run).to include_recipe('capistrano-base-test::user')
  end

  it 'should include the capistrano-base-test::ssh recipe' do
    expect(chef_run).to include_recipe('capistrano-base-test::ssh')
  end

  it 'should include the capistrano-wordpress-test::app recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress-test::app')
  end

  it 'should include the capistrano-wordpress-test::environment recipe' do
    expect(chef_run).to include_recipe('capistrano-wordpress-test::environment')
  end
end
