#
# Cookbook Name:: capistrano-wordpress
# Recipe:: app
#
# Copyright 2014 Adam Krone <adam.krone@thirdwavellc.com>
# Copyright 2014 Thirdwave, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

capistrano_wordpress_app 'bedrock' do
  template node['capistrano_base']['app_template']
  deploy_root node['capistrano_base']['app_deploy_root']
  docroot node['capistrano_base']['app_docroot']
  deployment_user node['capistrano_base']['deployment_user']
  deployment_group node['capistrano_base']['deployment_group']
end
