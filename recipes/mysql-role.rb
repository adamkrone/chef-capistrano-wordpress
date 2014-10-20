#
# Cookbook Name:: capistrano-wordpress
# Recipe:: mysql-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'apt::default'
include_recipe 'capistrano-wordpress::environment'
include_recipe 'capistrano-wordpress::user'
include_recipe 'capistrano-wordpress::ssh'
include_recipe 'nodejs::default'
include_recipe 'capistrano-wordpress::chown'
include_recipe 'capistrano-wordpress::mysql-server'
include_recipe 'capistrano-wordpress::database-mysql'
