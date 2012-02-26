require 'bundler/capistrano'
require 'capistrano/mountaintop'

 set :campfire_options, {
  :account => 'lovelycreative',
  :room => 'Developer Chat',
  :user => 'lovelybot',
  :token => 'f939a4dd629c6bbd4cf811f4dd1c8de1d08656ce',
  :ssl => true
 }

 load 'deploy/assets'

 # use this if using rbenv on server, capistrano uses a very basic interactive shell
 # that doesn't automatically include all paths
 set :default_environment, {
  'PATH' => "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
 }

 set :application, "harley_health_vip"

 set :normalize_asset_timestamps, false

 role :web, "178.79.159.74"

 role :app, "178.79.159.74"

 role :db, "178.79.159.74", :primary => true

 default_run_options[:pty] = true

 set :ssh_options, { :forward_agent => true }

 set :deploy_to, "/home/deploy/apps/harley_health_vip"

 set :user, "deploy"

 set :use_sudo, false

 set :scm, :git

 #set :scm_username, "deploy"

 #set :repository, "ssh://deploy@178.79.159.74/~/harley_health_vip.bare_repo.git/"
 set :repository, "git@github.com:bwwd/harley_health_vip.git"

 set :branch, "staging"

 # this caused problems after switching to a different repo
 #set :repository_cache, "git_cache"

 set :deploy_via, :remote_cache

 set :git_enable_submodules, 1

# tasks
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

#before 'deploy:update' do
  #system 'git push linode master'
#end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test"
  end
end

after 'deploy:update_code', 'bundler:bundle_new_release'

# after 'deploy:update_code', 'deploy:symlink_shared'
before 'deploy:assets:precompile', 'deploy:symlink_shared'
