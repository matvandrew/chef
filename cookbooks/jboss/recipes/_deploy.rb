remote_file '/tmp/hudson.zip' do
  source node['jboss']['app_url']
  action :create
end

execute "unpack app" do
  user node['jboss']['jboss_user']
  group node['jboss']['jboss_group']
  command "unzip -o /tmp/hudson.zip -d #{node['jboss']['install_path'] + node['jboss']['install_dir']}/standalone/deployments/"
end

data = data_bag_item( 'hudson', 'engine' )

template "#{node['jboss']['install_path'] + node['jboss']['install_dir']}/standalone/deployments/hudson/hudson.xml" do
  source "hudson.erb"
  variables( engine: data['engine'] )
  action :create
  notifies :restart, 'service[jboss]', :immediately
end
