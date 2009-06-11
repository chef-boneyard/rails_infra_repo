name "db_server"
description "Role for database servers."

recipes "database"

default_attributes(
  "rails_app" => {
    "db" => {
      "database" => "radiant_live",
      "password" => "radiant",
      "user" => "radiant"
    }
  }
)
