#
# Cookbook Name:: capistrano-wordpress
# Recipe:: app
#
# Copyright (C) 2014
#
#
#

web_app node['capistrano_wordpress']['app_name'] do
  template 'app.conf.erb'
  docroot '/var/www/current/web'
end
