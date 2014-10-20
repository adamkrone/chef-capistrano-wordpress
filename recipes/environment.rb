#
# Cookbook Name:: capistrano-wordpress
# Recipe:: environment
#
# Copyright (C) 2014
#
#
#

directory '/var/www/shared' do
  owner node['capistrano_wordpress']['deployment_user']
  action :create
end

template '/var/www/shared/.env' do
  source '.env.erb'
  owner node['capistrano_wordpress']['deployment_user']
  group node['capistrano_wordpress']['deployment_group']
  action :create
end
