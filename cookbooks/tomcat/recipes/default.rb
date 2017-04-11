if node['tomcat']['skip']
  Chef::Log.warn('Skipping install of Tomcat!')
else
  include_recipe 'tomcat::_install'

  include_recipe 'tomcat::_deploy'
end
