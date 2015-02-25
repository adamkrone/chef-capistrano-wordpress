def create_capistrano_wordpress_app(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:capistrano_wordpress_app, :create, resource_name)
end
