# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
require 'bundler/capistrano'

set :application, "prototyperobotics.com"
role :web, "50.56.206.231"                          # Your HTTP server, Apache/etc
role :app, "50.56.206.231"                          # This may be the same as your `Web` server
role :db,  "50.56.206.231", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/deployer/prototyperobotics"
set :user, "deployer"
set :use_sudo, false

# repo details
set :scm, :git
#set :git_username, "johndavid400"
set :repository, "git@github.com:johndavid400/prototype_robotics.git"
set :branch, "master"
set :git_enable_submodules, 1

# runtime dependencies
depend :remote, :gem, "bundler"

# tasks
namespace :deploy do
  before 'deploy:setup', :db

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

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/environments/production.rb #{release_path}/config/environments/production.rb"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    run "ln -nfs #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
  end

  desc "Precompile assets"
  task :precompile_assets, :roles => :app do
    run "cd #{release_path}; bundle exec rake assets:precompile RAILS_ENV=production"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after 'deploy:update_code', 'deploy:precompile_assets'
