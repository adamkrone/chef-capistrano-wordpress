#
# Cookbook Name:: capistrano-wordpress
# Recipe:: database-mysql
#
# Copyright (C) 2014
#
#
#

include_recipe 'database::mysql'

mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database_user node['capistrano_wordpress']['db']['user'] do
  connection mysql_connection_info
  password node['capistrano_wordpress']['db']['user_password']
  action :create
end

node['capistrano_wordpress']['db']['environments'].each do |env|
  database_name = "#{node['capistrano_wordpress']['db']['name']}_#{env}"

  mysql_database database_name do
    connection mysql_connection_info
    action :create
  end

  mysql_database_user node['capistrano_wordpress']['db']['user'] do
    connection mysql_connection_info
    database_name database_name
    privileges [:all]
    action :grant
  end
end
