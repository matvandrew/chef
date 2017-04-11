action :install do
  package 'nginx' do
    package_name 'nginx'
    action :install
  end
end

action :setup do
  service 'nginx' do
    action :enable
  end
end

action :stop do 
  service 'nginx' do
    action :stop
  end
end

action :start do 
  service 'nginx' do
    action :start
  end
end

action :restart do 
  service 'nginx' do
    action :restart
  end
end

action :reload do 
  service 'nginx' do
    action :reload
  end
end
