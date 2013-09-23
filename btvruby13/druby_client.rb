require 'drb/drb'

class User
  include DRbUndumped

  attr_accessor :key
  attr_reader :username

  def initialize username
    @username = username
    @key = nil
  end

  def message (remote, str)
    puts str
  end
end

remote = 'druby://localhost:12345'
print 'Whats your name? '
username = gets.chomp
chat = User.new(username)
DRb.start_service
remote_object = DRbObject.new(nil, remote)
entry = remote_object.add_user(chat)
while gets
  entry.say $_
end
