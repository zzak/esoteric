require 'drb/drb'

class Connection
  include DRbUndumped
  attr_accessor :username
  attr_reader :remote
  def initialize(server, remote)
    @username = remote.username
    @key = remote.key = Time.now
    @server = server
    @remote = remote
  end

  def say(str)
    @server.distribute(@remote, str)
  end

  def listen(str)
    @remote.message(@key, str)
  end
end

class Server
  attr_accessor :messages, :users
  def initialize
    @users = {}
    @messages = {}
  end

  def add_user(remote)
    client = Connection.new(self, remote)
    @users[remote] = client
    return client
  end

  def distribute(remote, str)
    @username = @users[remote].username
    msg = "<#{@username}> #{str}"
    msg2 = ">#{@username}< #{str}"
    @users.keys.each do |m|
      @users[m].listen(msg2) if remote == m
      @users[m].listen(msg)
    end
  end
end

DRb.start_service 'druby://localhost:12345', Server.new
DRb.thread.join


