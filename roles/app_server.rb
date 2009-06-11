name "app_server"
description "Role for a Rails application server"

recipes "application"

default_attributes(
  "railsapp" => {
    "app_name" => "radiant",
    "migrate" => false,
    "action" => "deploy",
    "branch" => "HEAD",
    "revision" => "HEAD",
    "migrate_command" => "rake production db:migrate",
    "db" => {
      "database" => "radiant_live",
      "password" => "radiant",
      "user" => "radiant",
      "type" => "mysql"
    },
    "environment" => "production"
  }
)
