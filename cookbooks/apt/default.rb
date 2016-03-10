execute 'package update' do
  command 'apt-get update -y'
end

node['packages'].each do |item|
  package item
end
