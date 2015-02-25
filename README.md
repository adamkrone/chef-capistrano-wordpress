# capistrano-wordpress

[![Latest Version](http://img.shields.io/github/release/thirdwavellc/chef-capistrano-wordpress.svg?style=flat-square)][release]
[![Build Status](http://img.shields.io/travis-ci/thirdwavellc/chef-capistrano-wordpress.svg?style=flat-square)][build]
[![Coverage Status](https://img.shields.io/coveralls/thirdwavellc/chef-capistrano-wordpress.svg?style=flat-square)][coverage]

[release]: https://github.com/thirdwavellc/chef-capistrano-wordpress/releases
[build]: https://travis-ci.org/thirdwavellc/chef-capistrano-wordpress
[coverage]: https://coveralls.io/r/thirdwavellc/chef-capistrano-wordpress

Installs and configures wordpress applications, optimized for capistrano
deployment. Designed as a layer on top of
[capistrano-base](https://github.com/thirdwavellc/chef-capistrano-base),
adding only what's missing.

## LWRPs

This cookbook is intended to be consumed through its LWRP, and therefore
doesn’t include any recipes. The capistrano_wordpress_app LWRP is meant to
replace the capistrano_app LWRP included in capistrano-base. All other LWRPs in
capistrano-base still apply for wordpress apps. Here is an overview of the
LWRPs provided:

**Note:** The first attribute listed for each LWRP is also the name attribute.

### capistrano_wordpress_app

**Attributes:**

| Name						 | Description																		| Type	 | Required | Default								 |
| ---------------- | ---------------------------------------------- | ------ | -------- | ---------------------- |
| app_name				 | Name of the application												| String | true			| N/A										 |
| cookbook				 | Cookbook that contains the web config template | String | false		| 'capistrano-wordpress' |
| template				 | Name of the web config template.								| String | false		| 'web_app.conf.erb'		 |
| deploy_root			 | Directory where all applications are deployed	| String | false		| '/var/www'						 |
| deployment_user  | User that deploys the application.							| String | false		| 'deploy'							 |
| deployment_group | Group that deploys the application.						| String | false		| 'deploy'							 |
| server_name			 | ServerName in Apache config.										| String | true			| N/A										 |
| server_aliases	 | List of ServerAlias in Apache config.					| String | false		| nil										 |


**Example:**

```ruby
capistrano_wordpress_app 'my-app' do
  server_name 'my-app.com'
end
```
