tomcat_inst = node['tomcat']['install_path']
tomcat_home = node['tomcat']['install_path'] + node['tomcat']['install_dir']
tomcat_app_user = node['tomcat']['tomcat_user']
tomcat_app_group = node['tomcat']['tomcat_group']

package "unzip" do
  action :install
end

#Create user tomcat
user node['tomcat']['tomcat_user'] do
    manage_home true
    home '/opt/tomcat'
    action :create
end

remote_file 'opt/tomcat/apache-tomcat-8.5.12.tar.gz' do
  source node['tomcat']['package_url']
  owner node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  mode '0755'
  action :create
end

#Unzip tomcat archive
execute 'untar tomcat archive' do
  user node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  command "tar -xf /opt/tomcat/apache-tomcat-8.5.12.tar.gz -C #{tomcat_inst}"
end

#Yes, it's bash!
#bash 'install_something' do
#    user 'root'
#    cwd '/opt'
#    code <<-EOH
#    chown -R #{tomcat_app_user}:#{tomcat_app_group} #{tomcat_home}
#    EOH
#end

# Install init script
template "/etc/init.d/tomcat8" do
  source "tomcat8.erb"
  mode "0755"
  owner "root"
  group "root"
end

# Configure Tomcat users
template "#{tomcat_home}/conf/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  mode "0755"
  owner "root"
  group "root"
end

service "tomcat8" do
  action [:enable, :start]
end
