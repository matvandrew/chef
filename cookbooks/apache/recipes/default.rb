package "httpd" do
  action :install
end

#copy tomcat.conf
template "/etc/httpd/conf.d/tomcat.conf" do
  source "tomcat.conf.erb"
  mode "0755"
  owner "root"
  group "root"
end

#copy maintenance.html
template "/var/www/html/maintenance.html" do
  source "maintenance.html.erb"
  mode "0755"
  owner "root"
  group "root"
end

service "httpd" do
  action [:enable, :start]
end