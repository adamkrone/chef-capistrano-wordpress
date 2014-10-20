#
# Cookbook Name:: capistrano-wordpress
# Recipe:: web-app-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'apt::default'
include_recipe 'capistrano-wordpress::user'
include_recipe 'capistrano-wordpress::ssh'
include_recipe 'nodejs::default'
include_recipe 'capistrano-wordpress::php'
include_recipe 'capistrano-wordpress::composer'
include_recipe 'capistrano-wordpress::apache2'
include_recipe 'capistrano-wordpress::chown'
include_recipe 'capistrano-wordpress::app'
include_recipe 'capistrano-wordpress::environment'
