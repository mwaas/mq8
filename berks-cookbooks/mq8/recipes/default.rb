#
# Cookbook:: mq8
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

ibm_mq_installation 'Installation1' do
  source 'http://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/messaging/mqadv/mqadv_dev80_linux_x86-64.tar.gz'
  accept_license true
  primary true
end

ibm_mq_queue_manager 'CL1QM1' do
  action [:create, :start]
end

execute 'runmqsc' do
  command "echo 'define qlocal(foo) replace' | runmqsc CL1QM1"
  user 'mqm'
  group 'mqm'
end

