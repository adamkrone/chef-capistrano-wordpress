#
# Cookbook Name:: capistrano-wordpress
# Recipe:: apache2
#
# Copyright (C) 2014
#
#
#

node.normal['apache']['user'] = 'deploy'
node.normal['apache']['group'] = 'deploy'
node.normal['apache']['mpm'] = 'event'

include_recipe 'apache2::default'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_rewrite'
