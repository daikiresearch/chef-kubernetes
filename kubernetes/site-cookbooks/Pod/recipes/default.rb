#
# Cookbook Name:: Pod
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/Users/daiki/kubernetes/site-cookbooks/Pod/config/pod.yaml" do
  source "pod.yaml.erb"
  action :create
  variables({
    :apiVersion => node['Pod']['apiVersion'],
    :kind => node['Pod']['kind'],
    :name => node['metadata']['name'],
    :label_key => node['metadata']['label_key'],
    :label_value => node['metadata']['label_value'],
    :container_name_1 => node['containers_1']['name'],
    :container_image_1 => node['containers_1']['image'],
    :container_port_1 => node['containers_1']['containerPort'],
    :container_name_2 => node['containers_2']['name'],
    :container_image_2 => node['containers_2']['image'],
    :container_port_2 => node['containers_2']['containerPort'],
    :status_phase => node['status']['phase']
  })
end

execute 'action' do
  command 'sudo kubectl create -f /Users/daiki/kubernetes/site-cookbooks/Pod/config/pod.yaml'
  action :run
end
