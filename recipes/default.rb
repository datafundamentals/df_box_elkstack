#
# Cookbook Name:: df_box_elkstack
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


include_recipe 'df_java::default'

include_recipe 'df_box_elkstack::elasticsearch'
include_recipe 'df_box_elkstack::kibana'
include_recipe 'df_box_elkstack::nginx'

include_recipe 'df_box_elkstack::logstash'

