#
# Cookbook Name:: database
# Attributes:: database
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
db_password = ""
chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
20.times { |i| db_password << chars[rand(chars.size-1)] }

railsapp Mash.new unless attribute?("railsapp")
railsapp[:db] = Mash.new                   unless railsapp.has_key?(:db)
railsapp[:db][:user] = railsapp[:app_name] unless railsapp[:db].has_key?(:user)
railsapp[:db][:password] = db_password     unless railsapp[:db].has_key?(:password)
railsapp[:db][:database] = "#{railsapp[:app_name]}_#{railsapp[:environment]}" unless railsapp[:db].has_key?(:database)
