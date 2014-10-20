#
# Cookbook Name:: capistrano-wordpress
# Recipe:: web-app-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'apt::default'
include_recipe 'capistrano-base::user'
include_recipe 'capistrano-base::ssh'
include_recipe 'capistrano-base::nodejs'
include_recipe 'capistrano-wordpress::php'
include_recipe 'capistrano-wordpress::composer'
include_recipe 'capistrano-wordpress::apache2'
include_recipe 'capistrano-base::chown'
include_recipe 'capistrano-base::app'
include_recipe 'capistrano-wordpress::environment'
