#
# Cookbook Name:: capistrano-wordpress-test
# Recipe:: environment
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

env_vars = {
  DB_NAME: 'my_app_production',
  DB_USER: 'my-app',
  DB_PASSWORD: 'my-app-password',
  DB_HOST: 'localhost',
  WP_ENV: 'production',
  WP_HOME: 'http://my-app.com',
  WP_SITEURL: 'http://my-app.com/wp'
}

capistrano_shared_file '.env' do
  app_root '/var/www/my-app'
  template '.env.erb'
  variables(environment_variables: env_vars)
end
