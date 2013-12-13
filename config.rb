package :test_sudo do
  # use_sudo true

  transfer "test.txt", "/root/test.txt", sudo: true
  runner "touch /root/test.txt"

  verify do
    matches_local "test.txt", "/root/test.txt"
  end
end

policy :app, roles: :app do
  requires :test_sudo
end

deployment do
  # mechanism for deployment
  delivery :capistrano do
    require "capistrano"
    set :use_sudo, true
    set :run_method, :sudo
    set :user, "vagrant"
    set :password, "vagrant"
    server "127.0.0.1:22222", :app
    logger.level = ::Capistrano::Logger::DEBUG
  end
end
