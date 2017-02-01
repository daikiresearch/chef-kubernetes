#
# Cookbook Name:: Service
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/Users/daiki/kubernetes/site-cookbooks/Service/config/service.yaml" do
  source "service.yaml.erb"
  action :create
  variables({
    :apiVersion => node['Service']['apiVersion'],
    :kind => node['Service']['kind'],
    :name => node['metadata']['name'],
    :label_key => node['metadata']['labels']["key"],
    :label_value => node['metadata']['labels']["value"],
    :spec_type => node['spec']['type'],
    :spec_selector_key => node['spec']['selector']['key'],
    :spec_selector_value => node['spec']['selector']['value'],
    :spec_ports_protocol => node['spec']['ports']['protocol'],
    :spec_ports_port => node['spec']['ports']['port'],
    :spec_ports_targetPort => node['spec']['ports']['targetPort'],
    :spec_ports_NodePort => node['spec']['ports']['NodePort'],
    :status_loadBalancer_ip => node['status']['loadBalancer']['ingress']['ip']
  })
end

execute 'action' do
  command 'sudo kubectl create -f /Users/daiki/kubernetes/site-cookbooks/Service/config/service.yaml'
  action :run
end
