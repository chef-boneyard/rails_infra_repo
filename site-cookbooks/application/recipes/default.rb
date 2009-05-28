#
# Cookbook Name:: application
# Recipe:: default
#
# Copyright 2009, Opscode, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

r = gem_package "chef-deploy" do
  source "http://gems.engineyard.com"
  action :nothing
end

r.run_action(:install)

Gem.clear_paths
require "chef-deploy"

include_recipe "git"
case node[:railsapp][:db][:type]
when "sqlite"
  include_recipe "sqlite"
  gem_package "sqlite3-ruby" 
when "mysql"
  include_recipe "mysql::client"
end
include_recipe "rails"
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_rails"

%w{config log pids sqlite system}.each do |dir|
  directory "/srv/#{node[:railsapp][:app_name]}/shared/#{dir}" do
    recursive true
    owner "railsdev"
    group "railsdev"
    mode "0775"
  end
end

database_server = search(:node, "database_master:true").map {|n| n['fqdn']}.first

template "/srv/#{node[:railsapp][:app_name]}/shared/config/database.yml" do
  source "database.yml.erb"
  owner "railsdev"
  group "railsdev"
  variables :database_server => database_server
  mode "0664"
end

file "/srv/#{node[:railsapp][:app_name]}/shared/sqlite/production.sqlite3" do
  owner "railsdev"
  group "railsdev"
  mode "0664"
end

deploy "/srv/#{node[:railsapp][:app_name]}" do
  repo "git://github.com/radiant/radiant.git"
  branch node[:railsapp][:branch]
  user "railsdev"
  enable_submodules false
  migrate node[:railsapp][:migrate]
  migration_command node[:railsapp][:migrate_command]
  environment node[:railsapp][:environment]
  shallow_clone true
  revision node[:railsapp][:revision]
  action node[:railsapp][:action].to_sym
  restart_command "touch tmp/restart.txt"
end

web_app "#{node[:railsapp][:app_name]}" do
  docroot "/srv/#{node[:railsapp][:app_name]}/current/public"
  template "#{node[:railsapp][:app_name]}.conf.erb"
  server_name "#{node[:railsapp][:app_name]}.#{node[:domain]}"
  server_aliases [ "#{node[:railsapp][:app_name]}", node[:hostname] ]
  rails_env "production"
end

apache_site "000-default" do
  enable false
end
