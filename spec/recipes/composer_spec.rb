require 'spec_helper'

describe 'capistrano-wordpress::composer' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command("php -m | grep 'Phar'").and_return(true)
  end

  it 'should include the composer::default recipe' do
    expect(chef_run).to include_recipe('composer::default')
  end
end
