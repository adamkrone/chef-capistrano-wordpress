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
include_recipe 'capistrano-wordpress::app'
include_recipe 'capistrano-wordpress::environment'
