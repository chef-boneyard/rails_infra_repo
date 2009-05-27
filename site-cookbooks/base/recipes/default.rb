#
# Cookbook Name:: base
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
include_recipe "ubuntu"
include_recipe "openldap::auth"
include_recipe "rsyslog::client"
include_recipe "runit"
include_recipe "ruby"
include_recipe "perl"
include_recipe "chef::client"
include_recipe "sudo"
include_recipe "zsh"
# include_recipe "git::client"
include_recipe "man"
include_recipe "openssh"
include_recipe "build-essential"
# include_recipe "rsync::client"
# include_recipe "munin::node"
# include_recipe "nagios::nrpe"
include_recipe "ntp"
include_recipe "postfix"
include_recipe "resolver"
include_recipe "nscd"
