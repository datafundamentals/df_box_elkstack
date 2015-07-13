apt_repository 'elasticsearch' do 
	uri 'http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main'
	key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
end

apt_package 'elasticsearch' do 
	# version '1.4.4.'
	action :install
end

template '/etc/elasticsearch/elasticsearch.yml' do 
	source 'elasticsearch.yml.erb'
	action :create
end

service 'elasticsearch' do 
	action :restart
end
