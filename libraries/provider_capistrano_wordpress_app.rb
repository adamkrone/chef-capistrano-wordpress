require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoWordpressApp < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        capistrano_app new_resource.name do
          template new_resource.template
          deploy_root new_resource.deploy_root
          docroot new_resource.docroot
          deployment_user new_resource.deployment_user
          deployment_group new_resource.deployment_group
          apache_mpm 'prefork'
        end

        recipe_eval do
          run_context.include_recipe 'php::default'
          run_context.include_recipe 'php::module_mysql'
          run_context.include_recipe 'composer::default'
          run_context.include_recipe 'apache2::mod_php5'
          run_context.include_recipe 'apache2::mod_rewrite'
        end
      end

      action :delete do
        capistrano_app new_resource.name do
          deploy_root new_resource.deploy_root
          docroot new_resource.docroot
          action :delete
        end
      end
    end
  end
end
