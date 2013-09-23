class Server
  attr_accessor :messages
  attr_accessor :users

  def initialize
    @messages = {}
    @users = {}
  end

  def add_user remote
    client = Client.new self, remote
    @users[remote] = client
    client
  end

  def distribute(remote, str)
    username = @users[remote].username
    msg = "<#{username}> #{str}"
    msg2 = ">#{username}< #{str}"
    for m in @users.keys
      begin
        if m == remote
          @users[m].listen(msg2)
         else
          @users[m].listen(msg)
        end
      rescue
        p $!
        @users.delete(m)
      end
    end
  end
end
