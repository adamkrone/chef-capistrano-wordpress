require 'spec_helper'

describe 'capistrano-wordpress::php' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should include the php::default recipe' do
    expect(chef_run).to include_recipe('php::default')
  end

  it 'should include the php::module_mysql recipe' do
    expect(chef_run).to include_recipe('php::module_mysql')
  end
end
