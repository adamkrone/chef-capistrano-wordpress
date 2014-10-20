#
# Cookbook Name:: capistrano-wordpress
# Recipe:: apache2
#
# Copyright (C) 2014
#
#
#

include_recipe 'capistrano-base::apache2'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_rewrite'
