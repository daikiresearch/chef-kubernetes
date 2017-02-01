#
# Cookbook Name:: Replication
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/Users/daiki/kubernetes/site-cookbooks/Replication/config/Replication.yaml" do
  source "Replication.yaml.erb"
  action :create
  variables({
    :apiVersion => node['Replication']['apiVersion'],
    :kind => node['Replication']['kind'],
    :name => node['metadata']['name'],
    :selector_key => node['spec']['selector']['key'],
    :selector_value => node['spec']['selector']['value'],
    :template_metadata_name => node['spec']['template']['metadata']['name'],
    :template_metadata_labels_key => node['spec']['template']['metadata']['labels']['key'],
    :template_metadata_labels_value => node['spec']['template']['metadata']['labels']['value'],
    :replicas => node['spec']['replicas'],
    :container_name => node['spec']['spec']['container']['name'],
    :container_image => node['spec']['spec']['container']['image'],
    :container_port => node['spec']['spec']['container']['ports']['containerPort'],
    :status_availableReplicas => node['status']['availableReplicas']
  })
end

execute 'action' do
  command 'sudo kubectl create -f /Users/daiki/kubernetes/site-cookbooks/Replication/config/Replication.yaml'
  action :run
end
