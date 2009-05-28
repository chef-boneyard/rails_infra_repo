#
# Cookbook Name:: operations
# Recipe:: master
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

include_recipe "base"

include_recipe "chef::server"

unless node[:ec2]
  include_recipe "djbdns::cache"
  include_recipe "djbdns::internal_server"
  include_recipe "gems::server"
end

include_recipe "rsyslog::server"
include_recipe "openldap::server"
include_recipe "openldap::auth"

# include_recipe "deploy::master"
# include_recipe "rsync::server"
# include_recipe "git::server"

# include_recipe "operations::monitoring"
