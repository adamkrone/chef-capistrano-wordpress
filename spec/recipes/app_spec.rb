require 'spec_helper'

describe 'capistrano-wordpress::app' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['capistrano_wordpress_app']).converge(described_recipe)
  end

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
    stub_command("php -m | grep 'Phar'").and_return(true)
  end

  it 'should include the apache2::mod_php5 recipe' do
    expect(chef_run).to include_recipe('apache2::mod_php5')
  end

  it 'should include the apache2::mod_rewrite recipe' do
    expect(chef_run).to include_recipe('apache2::mod_rewrite')
  end

  it 'should include the php::default recipe' do
    expect(chef_run).to include_recipe('php::default')
  end

  it 'should include the php::module_mysql recipe' do
    expect(chef_run).to include_recipe('php::module_mysql')
  end

  it 'should include the composer::default recipe' do
    expect(chef_run).to include_recipe('composer::default')
  end
end
