#copy tomcat.conf
template "/etc/httpd/conf.d/tomcat.conf" do
  source "tomcat.conf.erb"
end
service 'httpd' do
  action :restart
end

