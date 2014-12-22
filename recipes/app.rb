#
# Cookbook Name:: capistrano-wordpress
# Recipe:: app
#
# Copyright (C) 2014
#
#
#

capistrano_wordpress_app 'bedrock' do
  template node['capistrano_base']['app_template']
  deploy_root node['capistrano_base']['app_deploy_root']
  docroot node['capistrano_base']['app_docroot']
  deployment_user node['capistrano_base']['deployment_user']
  deployment_group node['capistrano_base']['deployment_group']
end
