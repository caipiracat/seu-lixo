require 'rvm/capistrano'
require 'bundler/capistrano'

server 'ec2-23-20-70-26.compute-1.amazonaws.com', :web, :app, :db, primary: true

set :application, 'seulixo.com'
set :repository,  'git@github.com:rodrigomello/seu-lixo.git'
set :user,        'ubuntu'
set :deploy_to,   "/home/#{user}/rails_apps/#{application}"
set :use_sudo,    false
set :scm,         :git

after 'deploy:update_code', 'deploy:symlink_shared'

namespace :deploy do
  task :start do
    run "cd #{current_path} && bundle exec unicorn -c config/unicorn.rb -E #{rails_env} -D"
  end

  task :stop do
    run "cd #{current_path} && kill -s QUIT `cat tmp/pids/unicorn.pid`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{current_path}/tmp/pids/unicorn.pid`"
  end

  desc 'Symlink shared configs and folders on each release.'
    task :symlink_shared do
      run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end

  namespace :db do
    desc 'Populates the Production Database'
    task :seed do
      run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=production"
    end
  end
end
