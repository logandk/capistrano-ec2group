Gem::Specification.new do |s|
  s.name = "capistrano-ec2group"
  s.version = "1.0.4"

  s.author = "Logan Raarup"
  s.email = "logan@logan.dk"
  s.date = "2009-06-19"
  
  s.homepage = "http://github.com/logandk/capistrano-ec2group"
  s.summary = "Capistrano plugin for deploying to Amazon EC2 instances by security groups."
  
  s.has_rdoc = true
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README.markdown"]
  
  s.files = ["MIT-LICENSE", "Rakefile", "README.markdown", "lib/capistrano/ec2group.rb", "test/ec2group_test.rb"]
  s.require_paths = ["lib"]
  
  s.add_dependency "capistrano", ">=2.1.0"
  s.add_dependency "right_aws"
end
