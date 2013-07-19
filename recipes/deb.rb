#
# Cookbook Name:: pypy
# Recipe:: tarball
#
# Copyright 2012, Michael S Klishin & Travis CI Development Team
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

# 1. Download the tarball to /tmp
require "tmpdir"

td = Dir.tempdir
tmp = File.join(td, node.pypy.deb.filename)
tmp_lib = File.join(td, node.pypy.deb.lib_filename)

remote_file(tmp) do
  source node.pypy.deb.url
  not_if "which pypy"
end

remote_file(tmp_lib) do
  source node.pypy.deb.lib_url
end

bash "install pypy.deb" do
  user "root"
  cwd  "/tmp"

  code <<-EOS
    dpkg -i #{tmp_lib}
    dpkg -i #{tmp}
  EOS

  #creates "#{node.pypy.tarball.installation_dir}/bin/pypy"
end

