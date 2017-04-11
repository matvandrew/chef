# Cookbook Name:: web
# Recipe:: default

web 'nginx or apache' do 
  action [:install, :setup, :restart]
  if node.role?('apache_web_server')
    provider 'web_apache'
  elsif node.role?('nginx_web_server')
    provider 'web_nginx'
  else
  	puts "please try apache or nginx role"
  end
end
