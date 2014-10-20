#
# Cookbook Name:: capistrano-wordpress
# Recipe:: chown
#
# Copyright (C) 2014
#
#
#

directory node['apache']['docroot_dir'] do
  owner node['capistrano_wordpress']['deployment_user']
  group node['capistrano_wordpress']['deployment_group']
  recursive true
  action :create
end
