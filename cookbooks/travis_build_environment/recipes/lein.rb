remote_file '/usr/local/bin/lein' do
  source node['travis_build_environment']['lein_url']
  owner node['travis_build_environment']['user']
  group node['travis_build_environment']['group']
  mode 0o755
end

bash 'run lein self-install' do
  flags '-l'
  code 'lein self-install'
  user node['travis_build_environment']['user']
  group node['travis_build_environment']['group']
  not_if { File.exist?("#{node['travis_build_environment']['home']}/.lein/self-installs/leiningen-2.7.1-standalone.jar") }
  environment(
    'HOME' => node['travis_build_environment']['home']
  )
end
