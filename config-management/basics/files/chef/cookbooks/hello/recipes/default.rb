#
# Cookbook:: hello
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#

package 'httpd'

service 'httpd' do
  action [:enable,:start]
end

template '/var/www/html/index.html' do
  notifies :restart, 'service[httpd]', :immediately
end
