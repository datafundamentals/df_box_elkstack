remote_file "/tmp/#{node['df_kibana']['kibana_version']}.tar.gz" do
	source "https://download.elasticsearch.org/kibana/kibana/#{node['df_kibana']['kibana_version']}.tar.gz"
	mode "0775" 
end

directory "/opt/kibana" do 
	recursive true
	mode "0755"
end

execute "extract kibana to directory" do 
	command "tar xvf /tmp/#{node['df_kibana']['kibana_version']}.tar.gz --strip=1 -C /opt/kibana" 
	action :run
	user "root" 
	not_if do ::File.exists?('/opt/kibana/bin/kibana') end
end

template "/opt/kibana/config/kibana.yml" do 
	source "kibana.yml.erb" 
	mode "0755" 
end

remote_file "/etc/init.d/kibana4" do 
	source node['df_kibana']['initscript']
	mode "0755"
end

service "kibana4" do 
	action :start
end

