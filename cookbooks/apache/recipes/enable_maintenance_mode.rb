template "/etc/httpd/conf.d/tomcat.conf" do
  source "maintenance.conf.erb"
  variables({
    :maintenance_file => node[:apache][:maintenance]
})
end
service 'httpd' do
  action :restart
end
