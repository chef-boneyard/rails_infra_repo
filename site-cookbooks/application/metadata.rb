maintainer "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license "Apache 2.0"
description "Configures a Rails Application"
version "0.7"

%w{ git sqlite mysql rails apache2 }.each do |cb|
  depends cb
end

supports "ubuntu"

attribute "railsapp/app_name",
  :display_name => "Railsapp Application Name",
  :description => "Name of the Rails application, used for deploy, hostname",
  :default => "radiant"

attribute "railsapp/revision",
  :display_name => "Railsapp Revision",
  :description => "Revision from the repository to deploy",
  :default => "HEAD"

attribute "railsapp/branch",
  :display_name => "Railsapp Branch",
  :description => "Branch from the repository to deploy",
  :default => "HEAD"

attribute "railsapp/environment",
  :display_name => "Railsapp Environment",
  :description => "Which environment to use for Rails",
  :default => "production"

attribute "railsapp/migrate_command",
  :display_name => "Railsapp Migration Command",
  :description => "The command to use for database migration",
  :default => "rake railsapp/environment db:migrate"

attribute "railsapp/migrate",
  :display_name => "Railsapp Migrate?",
  :description => "Whether to perform a database migration",
  :default => "false"

attribute "railsapp/action",
  :display_name => "Railsapp Action",
  :description => "The action for deployment, nothing or deploy",
  :default => "nothing"

