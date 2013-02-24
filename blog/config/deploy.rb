set :application, "set your application name here"
set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

# http://keighl.com/post/fast-rails-assets-precompile-capistrano
namespace :deploy do
  task :default do
    update
    assets.precompile
    restart
    cleanup
    # etc
  end
end
 
namespace :assets do
  desc "Precompile assets locally and then rsync to app servers"
  task :precompile, :only => { :primary => true } do
    run_locally "bundle exec rake assets:precompile;"
    servers = find_servers :roles => [:app], :except => { :no_release => true }
    servers.each do |server|
      run_locally "rsync -av ./public/assets/ #{user}@#{server}:#{current_path}/public/assets/;"
    end
    run_locally "rm -rf public/assets"
  end
end