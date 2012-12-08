preload_app true

listen 5002
worker_processes 4
timeout 300

APP_PATH = '/home/ubuntu/rails_apps/lumini.com.br/current'
base_dir = APP_PATH
shared_path = '/home/ubuntu/rails_apps/lumini.com.br/shared'
working_directory base_dir

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stdout.log"

pid APP_PATH + "/tmp/pids/unicorn.pid"

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end