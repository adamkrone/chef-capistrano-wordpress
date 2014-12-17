require 'spec_helper'

describe 'capistrano-wordpress::environment' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should include the capistrano-base::environment recipe' do
    expect(chef_run).to include_recipe('capistrano-base::environment')
  end
end
