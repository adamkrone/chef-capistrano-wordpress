#
# Cookbook Name:: capistrano-wordpress
# Recipe:: environment
#
# Copyright (C) 2014
#
#
#

vars = {
  DB_NAME: "#{node['capistrano_base']['db']['name']}_#{node['capistrano_base']['environment']}",
  DB_USER: node['capistrano_base']['db']['user'],
  DB_PASSWORD: node['capistrano_base']['db']['user_password'],
  DB_HOST: node['capistrano_base']['db']['host'],
  WP_ENV: node['capistrano_wordpress']['environment'],
  WP_HOME: node['capistrano_wordpress']['home'],
  WP_SITEURL: node['capistrano_wordpress']['siteurl']
}

node.normal['capistrano_base']['env_variables'] = vars

include_recipe 'capistrano-base::environment'
