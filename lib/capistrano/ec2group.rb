require 'right_aws'

unless Capistrano::Configuration.respond_to?(:instance)
  abort "capistrano/ec2group requires Capistrano 2"
end

module Capistrano
  class Configuration
    module Groups
      # Associate a group of EC2 instances with a role. In order to use this, you
      # must use the security groups feature in Amazon EC2 to group your servers
      # by role.
      # 
      # First, specify the security group name, then the roles and params:
      #
      #   group :webserver, :web
      #   group :app_myappname, :app
      #   group "MySQL Servers", :db, :port => 22000
      def group(which, *args)
        @ec2_api ||= RightAws::Ec2.new(fetch(:aws_access_key_id), fetch(:aws_secret_access_key), fetch(:aws_params, {}))

        @ec2_api.describe_instances.delete_if{|i| i[:aws_state] != "running"}.each do |instance|
          server(instance[:dns_name], *args) if instance[:aws_groups].include?(which.to_s)
        end
      end
    end
    
    include Groups
  end
end