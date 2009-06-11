maintainer "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license "Apache 2.0"
description "Configures database"
long_description "Configures#{cookbook.name}"
version "0.7"

depends "mysql::server"

attribute "railsapp/db/user",
  :display_name => "Railsapp DB User",
  :description => "User that owns the application database",
  :default => "railsapp/app_name"

attribute "railsapp/db/password",
  :display_name => "Railsapp DB Password",
  :description => "Password for the database user, randomly generated",
  :default => "random"

attribute "railsapp/db/database",
  :display_name => "Railsapp DB Database",
  :description => "Name of the database the application should use",
  :default => "railsapp/app_name_railsapp/environment"

