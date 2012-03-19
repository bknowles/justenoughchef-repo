#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2012, Just Enough Chef Tutorial
#
# License: Apache 2.0

p = package "mkpasswd" do
  action: nothing
end

p.run_action(:install)

bash "fix ubuntu user passwd and ssh" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  usermod -p "$(echo opstrain_0150 | mkpasswd -m sha-512 -s)" ubuntu
  sed -i "s/^PasswordAuthentication no$/PasswordAuthentication yes/" /etc/ssh/sshd_config && /etc/init.d/ssh restart
  EOH
end
