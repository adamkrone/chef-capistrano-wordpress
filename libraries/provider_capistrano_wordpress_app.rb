#
# Cookbook:: capistrano-wordpress
# Provider:: capistrano_wordpress_app
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

require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoWordpressApp < Chef::Provider::LWRPBase
      include Chef::DSL::IncludeRecipe
      use_inline_resources if defined?(use_inline_resources)
      provides :capistrano_wordpress_app

      def whyrun_supported?
        true
      end

      action :create do
        node.normal['apache']['docroot_dir'] = new_resource.deploy_root
        node.normal['apache']['user'] = new_resource.deployment_user
        node.normal['apache']['group'] = new_resource.deployment_group
        node.normal['apache']['mpm'] = 'prefork'

        include_recipe 'apache2::default'
        include_recipe 'php::default'
        include_recipe 'php::module_mysql'
        include_recipe 'composer::default'
        include_recipe 'apache2::mod_php'
        include_recipe 'apache2::mod_rewrite'

        capistrano_app new_resource.name do
          cookbook new_resource.cookbook
          template new_resource.template
          deploy_root new_resource.deploy_root
          web_root new_resource.web_root if new_resource.web_root
          deployment_user new_resource.deployment_user
          deployment_group new_resource.deployment_group
          server_name new_resource.server_name
          server_aliases new_resource.server_aliases if new_resource.server_aliases
        end

        service 'apache2'

        # TODO: make this less gnarly and key off php version, not OS version
        case node['platform_family']
        when 'ubuntu'
          case node['platform_version'].to_f
          when 16.04
            execute 'enable php7.0-cgi.conf' do
              command 'a2enconf php7.0-cgi'
              action :run
              notifies :restart, 'service[apache2]', :delayed
            end

            php_template_path = '/etc/php/7.0/apache2/php.ini'
          else
            php_template_path = '/etc/php5/apache2/php.ini'
          end
        else
          php_template_path = '/etc/php5/apache2/php.ini'
        end

        template php_template_path do
          source node['php']['ini']['template']
          cookbook node['php']['ini']['cookbook']
          variables(directives: node['php']['directives'])
          notifies :restart, 'service[apache2]', :delayed
        end
      end

      action :delete do
        capistrano_app new_resource.name do
          deploy_root new_resource.deploy_root
          server_name new_resource.server_name
          action :delete
        end
      end
    end
  end
end
