#
# Bootstrap Chef with Chef Solo
#

log_level       :info
log_location    STDOUT
file_cache_path "/tmp/chef-solo"
cookbook_path   "/tmp/chef-solo/cookbooks"
ssl_verify_mode :verify_none

Chef::Log::Formatter.show_time = true
