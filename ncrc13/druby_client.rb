require 'drb/drb'

class User
  include DRbUndumped

  attr_accessor :key, :username

  def initialize(username)
    @username = username
    @key = nil
  end

  def message(key, str)
    puts str
  end
end

remote = 'druby://localhost:12345'
print "What's your username? "
username = gets.chomp
DRb.start_service

remote_object = DRbObject.new(nil, remote)
chat = User.new(username)
entry = remote_object.add_user(chat)

while gets
  entry.say($_)
end

