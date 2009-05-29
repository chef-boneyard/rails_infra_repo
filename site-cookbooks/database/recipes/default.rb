#
# Cookbook Name:: database
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
include_recipe "mysql::server"

Gem.clear_paths
require 'mysql'

execute "create #{node[:railsapp][:db][:database]} database" do
  command "/usr/bin/mysqladmin -u root -p#{node[:mysql][:server_root_password]} create #{node[:railsapp][:db][:database]}"
  not_if do
    m = Mysql.new("localhost", "root", @node[:mysql][:server_root_password])
    m.list_dbs.include?(@node[:railsapp][:db][:database])
  end
end

execute "mysql-install-privileges" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} < /etc/mysql/grants.sql"
  action :nothing
end

template "/etc/mysql/grants.sql" do
  source "grants.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  variables(
    :user     => node[:railsapp][:db][:user],
    :password => node[:railsapp][:db][:password],
    :database => node[:railsapp][:db][:database]
  )
  notifies :run, resources(:execute => "mysql-install-privileges"), :immediately
end
