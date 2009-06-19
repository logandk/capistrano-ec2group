capistrano-ec2group
=================================================

Capistrano plugin for deploying to Amazon EC2 instances by security groups.


Introduction
============

This plugin supports the deployment strategy of using the *security groups* feature of Amazon EC2. If you are using
auto-scaling of instances, new hostnames will be added and removed regularly, causing problems when you have to specify
your servers hostnames in your Capistrano recipes.

By using *security groups* to organize your instances by roles, you have created a simple database of instances that is
automatically updated as auto-scaling happens. By using a provisioning tool like Sprinkle, Moonshine, Chef, Puppet, Rubber
(etc.) to automatically configure instances upon launch (through EC2 `user-data`), you have a completely automated workflow for
configuring and deploying auto-scaling instances.


Installation
============

`capistrano-ec2group` is provided as a Ruby gem, with the following dependencies:

* Capistrano 2 gem
* RightAWS gem

You can install it with RubyGems:

	$ gem sources -a http://gems.github.com (you only have to do this once)
	$ gem install logandk-capistrano-ec2group


Usage
=====

In order to use the `capistrano-ec2group` plugin, you must require it in your `deploy.rb`:

	require 'capistrano/ec2group'

Then you must specify your Amazon EC2 credentials:

	set :aws_access_key_id, '???'
	set :aws_secret_access_key, '???'

Optionally setting additional parameters, such as the region:

	set :aws_params, :region => 'eu-west-1'
	
In order to define your instance groups, you must specify the security group name, the roles and params:

	group :webserver, :web
	group :app_myappname, :app
	group :lamp, :web, :app
	group "MySQL Servers", :db, :port => 22000
	
Then just sit back, relax and `cap deploy`!


Documentation
=============
Additional RDoc documentation is available at: [http://rdoc.info/projects/logandk/capistrano-ec2group](http://rdoc.info/projects/logandk/capistrano-ec2group)


Credits
=======
* Capistrano: [http://github.com/jamis/capistrano](http://github.com/jamis/capistrano)
* RightAws: [http://rightaws.rubyforge.org](http://rightaws.rubyforge.org)
* Amazon AWS: [http://aws.amazon.com](http://aws.amazon.com)

Copyright (c) 2009 Logan Raarup, released under the MIT license