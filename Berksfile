source 'https://api.berkshelf.com'

metadata

cookbook 'apt'
cookbook 'chef-solo-search', github: 'edelight/chef-solo-search'
cookbook 'users'
cookbook 'sudo'
cookbook 'ssh-hardening', github: 'TelekomLabs/chef-ssh-hardening', tag: 'v1.0.2'
cookbook 'nodejs'
cookbook 'php'
cookbook 'composer'
cookbook 'capistrano-base', github: 'thirdwavellc/chef-capistrano-base'

group :test do
  cookbook 'capistrano-base-test', github: 'thirdwavellc/chef-capistrano-base', rel: 'spec/fixtures/cookbooks/capistrano-base-test'
  cookbook 'capistrano-wordpress-test', path: 'spec/fixtures/cookbooks/capistrano-wordpress-test'
end
