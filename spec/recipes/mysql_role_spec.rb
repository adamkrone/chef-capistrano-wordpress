require 'spec_helper'

describe 'capistrano-wordpress::mysql_role' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['mysql']['server_debian_password'] = 'password'
      node.set['mysql']['server_root_password'] = 'password'
      node.set['mysql']['server_repl_password'] = 'password'
    end.converge(described_recipe)
  end

  before do
    stub_command("\"/usr/bin/mysql\" -u root -e 'show databases;'")
      .and_return(true)
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

  it 'should include the capistrano-base::mysql_server recipe' do
    expect(chef_run).to include_recipe('capistrano-base::mysql_server')
  end

  it 'should include the capistrano-base::database_mysql recipe' do
    expect(chef_run).to include_recipe('capistrano-base::database_mysql')
  end
end
