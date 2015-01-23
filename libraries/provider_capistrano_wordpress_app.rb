require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CapistranoWordpressApp < Chef::Provider::LWRPBase
      include Chef::DSL::IncludeRecipe
      use_inline_resources if defined?(use_inline_resources)

      def whyrun_supported?
        true
      end

      action :create do
        node.normal['apache']['docroot_dir'] = '/var/www'
        node.normal['apache']['user'] = new_resource.deployment_user
        node.normal['apache']['group'] = new_resource.deployment_group
        node.normal['apache']['mpm'] = 'prefork'
        node.normal['apache']['prefork']['startservers'] = 5
        node.normal['apache']['prefork']['minspareservers'] = 5
        node.normal['apache']['prefork']['maxspareservers'] = 10
        node.normal['apache']['prefork']['serverlimit'] = 30
        node.normal['apache']['prefork']['maxrequestworkers'] = 30
        node.normal['apache']['prefork']['maxconnectionsperchild'] = 2_000
        include_recipe 'apache2::default'

        capistrano_app new_resource.name do
          template new_resource.template
          cookbook new_resource.cookbook
          deploy_root new_resource.deploy_root
          docroot new_resource.docroot
          deployment_user new_resource.deployment_user
          deployment_group new_resource.deployment_group
        end

        include_recipe 'php::default'
        include_recipe 'php::module_mysql'
        include_recipe 'composer::default'
        include_recipe 'apache2::mod_php5'
        include_recipe 'apache2::mod_rewrite'
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
