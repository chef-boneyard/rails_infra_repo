name "ops_monitor"
description "Monitoring server for the infrastructure."

# These cookbooks/recipes don't exist yet, so don't actually use this role.
# It's here as a placeholder for future development.
recipes %w{
  munin::server
  nagios::server
}
