apt_repository 'logstash' do 
	uri 'http://packages.elasticsearch.org/logstash/1.5/debian stable main'
	key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
end

apt_package "logstash" do 
	action :install
end

template "/etc/logstash/conf.d/01-lumberjack-input.conf" do 
	source "lumberjack-input.conf.erb" 
	action :create
end

template "/etc/logstash/conf.d/10-syslog.conf" do 
	source "syslog.conf.erb"
	action :create
end

template "/etc/logstash/conf.d/30-lumberjack-output.conf" do 
	source "lumberjack-output.conf.erb" 
	action :create
end

service "logstash" do 
	action :restart
end
