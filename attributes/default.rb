default['capistrano_wordpress']['app_name'] = 'app'
default['capistrano_wordpress']['environment'] = 'production'
default['capistrano_wordpress']['deployment_user'] = 'deploy'
default['capistrano_wordpress']['deployment_group'] = 'www-data'

default['capistrano_wordpress']['db']['name'] = 'app'
default['capistrano_wordpress']['db']['user'] = 'deploy'
default['capistrano_wordpress']['db']['user_password'] = 'deploy'
default['capistrano_wordpress']['db']['environments'] = ['development', 'staging', 'production']
default['capistrano_wordpress']['db']['host'] = 'localhost'

default['capistrano_wordpress']['wp']['home'] = 'http://localhost'
default['capistrano_wordpress']['wp']['siteurl'] = 'http://localhost/wp'
