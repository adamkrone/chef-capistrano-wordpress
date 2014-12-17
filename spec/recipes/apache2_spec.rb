require 'spec_helper'

describe 'capistrano-wordpress::apache2' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
  end

  it 'should include the capistrano-base::apache2 recipe' do
    expect(chef_run).to include_recipe('capistrano-base::apache2')
  end

  it 'should include the apache2::mod_php5 recipe' do
    expect(chef_run).to include_recipe('apache2::mod_php5')
  end

  it 'should include the apache2::mod_rewrite recipe' do
    expect(chef_run).to include_recipe('apache2::mod_rewrite')
  end
end
