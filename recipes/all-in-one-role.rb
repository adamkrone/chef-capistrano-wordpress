#
# Cookbook Name:: capistrano-wordpress
# Recipe:: all-in-one-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'capistrano-wordpress::web-app-role'
include_recipe 'capistrano-wordpress::mysql-role'
