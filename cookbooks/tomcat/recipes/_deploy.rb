tomcat_home = node['tomcat']['install_path'] + node['tomcat']['install_dir']

remote_file '/tmp/testweb.zip' do
  source node['tomcat']['app_url']
  action :create
end

execute "unpack app" do
  user node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  command "unzip -o /tmp/testweb.zip -d /tmp"
end

remote_file "#{tomcat_home}/webapps/testweb.war" do
  source 'file:///tmp/testweb/testweb.war'
  owner node['tomcat']['tomcat_user']
  group node['tomcat']['tomcat_group']
  mode '0755'
  action :create
end