
marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

chef_gem 'chef-rewind'
require 'chef/rewind'

if node['rightscale'] && node['rightscale']['instance_uuid']
  node.override['collectd']['fqdn'] = node['rightscale']['instance_uuid']
end

include_recipe 'collectd::default'

# collectd::default recipe attempts to delete collectd plugins that were not
# created during the same runlist as this recipe. Some common plugins are installed
# as a part of base install which runs in a different runlist. This resource
# will safeguard the base plugins from being removed.
rewind 'ruby_block[delete_old_plugins]' do
  action :nothing
end

log "Setting up monitoring for Apache Kafka..."


# Set up kafka monitoring
collectd_plugin 'kafka' do
  template 'kafka.conf.erb'
  cookbook 'kafka'
  options({
              :collectd_lib => node['collectd']['plugin_dir'],
              :instance_uuid => node['rightscale']['instance_uuid'],
          })
end

