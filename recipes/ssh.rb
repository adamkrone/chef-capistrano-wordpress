#
# Cookbook Name:: capistrano-wordpress
# Recipe:: ssh
#
# Copyright (C) 2014
#
#
#

node.normal['ssh']['allow_agent_forwarding'] = true

include_recipe 'ssh-hardening::default'
