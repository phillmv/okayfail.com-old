set :rvm_ruby_string, '1.9.2'                     # Or:
#set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"") # Read from local system

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                               # Load RVM's capistrano plugin.

set :application, "okayfail.com"
set :repository,  "git@github.com:phillmv/okayfail.com.git"
set :use_sudo, false
set :scm, :git
set :deploy_to, "/var/www/#{application}"

role :web, "okayfail.com"

namespace :deploy do
  task :run_jekyll do
    run "cd #{current_path} && jekyll"
  end
end

after "deploy:restart", "deploy:run_jekyll"

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
