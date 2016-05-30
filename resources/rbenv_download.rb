resource_name :rbenv_download

property :rbenv_version,
  kind_of: String,
  default: lazy { |r| r.name }

property :root_path,
  kind_of: String

property :user,
  kind_of: String

property :environment,
  kind_of: Hash

property :global,
  kind_of: [TrueClass, FalseClass],
  default: false

# Ensure that the resource is applied regardless of whether we are in why_run
# or standard mode.
#
# Refer to chef/chef#4537 for this uncommon syntax
action_class do
  include Chef::Rbenv::ScriptHelpers

  def whyrun_supported?
    true
  end
end

action :install do
  command = "rbenv download #{new_resource.rbenv_version}"
  path_args = [rbenv_root, 'versions', "#{@new_resource.name}"]
  ruby_path = ::File.join(rbenv_root, 'versions', new_resource.rbenv_version)

  rbenv_script "download #{new_resource.rbenv_version}" do
    code        command
    user        new_resource.user if new_resource.user
    root_path   new_resource.root_path if new_resource.root_path
    environment new_resource.environment if new_resource.environment
    not_if { ::File.directory?(ruby_path) }
  end

  rbenv_global new_resource.rbenv_version do
    user        new_resource.user if new_resource.user
    root_path   new_resource.root_path if new_resource.root_path
    only_if { new_resource.global }
  end
end
