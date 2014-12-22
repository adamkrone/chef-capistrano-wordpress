#
# Cookbook Name:: capistrano-wordpress
# Recipe:: all-in-one-role
#
# Copyright (C) 2014
#
#
#

include_recipe 'capistrano-wordpress::web_app_role'
include_recipe 'capistrano-wordpress::mysql_role'
