#
# Cookbook Name:: zabbix_lwrp
# Provider:: screen
#
# Author:: LLC Express 42 (cookbooks@express42.com)
#
# Copyright (C) 2015 LLC Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

use_inline_resources

provides :zabbix_screen if defined? provides

def whyrun_supported?
  true
end

action :sync do
  converge_by("Create data for #{new_resource}.") do
    add_data(node, node['fqdn'], screens:
      {
        new_resource.name => {
          hsize:       new_resource.hsize,
          vsize:       new_resource.vsize,
          screenitems: new_resource.screen_items.map(&:to_hash),
        },
      })
  end
end
