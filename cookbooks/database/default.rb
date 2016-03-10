# mysql
node['database']['mysql'].each do |item|
  pachage item
end

# create mysql user
user node['mysql']['user'] do
  gid node['mysql']['group']
  shell '/sbin/nologin'
end

execute 'pip module install' do
  command 'pip install mysql-python'
end

execute 'copy original config file' do
  command 'cp /etc/mysql/my.cnf /etc/mysql/my.cnf.orig'
end

execute 'auto start mysql' do
  action :nothing
  command 'update-rc.d mysql defaults'
  subscribes :run, 'execute[copy rc script]', :immediately
end

# postgresql
# node['database']['postgresql'].each do |item|
#   pachage item
# end
