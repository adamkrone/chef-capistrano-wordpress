require 'spec_helper'

describe 'capistrano-wordpress-test::app' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['capistrano_wordpress_app']).converge(described_recipe)
  end

  before do
    stub_command('/usr/sbin/apache2 -t').and_return(true)
    stub_command("php -m | grep 'Phar'").and_return(true)
  end

  it 'should create capistrano_wordpress_app[my-app]' do
    expect(chef_run).to create_capistrano_wordpress_app('my-app')
  end

  it 'should create capistrano_app[my-app]' do
    expect(chef_run).to create_capistrano_app('my-app')
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

  it 'should create template[/etc/php5/apache2/php.ini]' do
    expect(chef_run).to create_template('/etc/php5/apache2/php.ini')
  end

  it 'should enable/start service[apache2]' do
    expect(chef_run).to enable_service('apache2')
    expect(chef_run).to start_service('apache2')
  end
end
