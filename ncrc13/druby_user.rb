require 'drb/drb'
require_relative 'chat/server'

class Client
  include DRbUndumped

  attr_accessor :username, :remote, :server

  def initialize(server, remote)
    @server = server
    @remote = remote
    @username = remote.username
    @key = remote.key = Time.new
  end

  def say(msg)
    @server.distribute(@remote, msg)
  end

  def listen(msg)
    @remote.message(@key, msg)
  end
end

DRb.start_service 'druby://localhost:12345', Server.new
DRb.thread.join
