require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CapistranoWordpressApp < Chef::Resource::LWRPBase
      self.resource_name = :capistrano_wordpress_app
      actions :create, :delete
      default_action :create

      attribute :app_name, kind_of: String, name_attribute: true
      attribute :cookbook, kind_of: String, default: 'capistrano-wordpress'
      attribute :template, kind_of: String, default: 'app.conf.erb'
      attribute :deploy_root, kind_of: String, required: true
      attribute :docroot, kind_of: String, required: true
      attribute :deployment_user, kind_of: String, default: 'deploy'
      attribute :deployment_group, kind_of: String, default: 'deploy'
      attribute :server_name, kind_of: String, default: nil
      attribute :server_aliases, kind_of: Array, default: []
    end
  end
end
