package 'curl'

ruby_rbenv_plugin 'rbenv-download' do
  git_url node['ruby_rbenv_download']['git_url']
  git_ref node['ruby_rbenv_download']['git_ref']
end
