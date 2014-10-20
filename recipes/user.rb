#
# Cookbook Name:: capistrano-wordpress
# Recipe:: user
#
# Copyright (C) 2014
#
#
#

include_recipe "users"

users_manage node['capistrano_wordpress']['deployment_user'] do
  group_id 3000
  action :create
end

sudo node['capistrano_wordpress']['deployment_user'] do
  user node['capistrano_wordpress']['deployment_user']
  nopasswd true
end
