require 'spec_helper'

describe 'capistrano-wordpress-test::environment' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should create capistrano_shared_file[.env]' do
    expect(chef_run).to create_capistrano_shared_file('.env')
  end
end
