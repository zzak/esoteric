# https://gist.github.com/deanh/710919
# IT'S SNOWING! xo, hdh.

require 'curses'
include Curses

class Snow
  def initialize
    draw
  end
  def draw_ground(first = 0, last = Curses::cols - 1)
    first.upto(last) do |i|
      setpos(Curses::lines - 10, i)
      addstr("_")
    end
  end
  def draw_snowman
    snowman = <<-'EOSNOWMAN'
                ::::::    .-~~\        ::::::
                          |::::|   /     \ _     |::::|
                  _ _     l~~~~!   ~x   .-~_)_   l~~~~!
               .-~   ~-.   \  /      ~x".-~   ~-. \  /
        _     /         \   ||    _  ( /         \ ||
        ||   T  o  o     Y  ||    ||  T o  o      Y||
      ==:l   l   <       !  (3  ==:l  l  <        !(3
         \\   \  .__/   /  /||     \\  \  ._/    / ||
          \\ ,r"-,___.-'r.//||      \\,r"-,___.-'r/||
           }^ \.( )   _.'//.||      }^\. ( )  _.-//||
          /    }~Xi--~  //  ||     /   }~Xi--~  // ||\
         Y    Y I\ \    "   ||    Y   Y I\ \    "  || Y
         |    | |o\ \       ||    |   | |o\ \      || |
         |    l_l  Y T      ||    |   l_l  Y T     || |
         l      "o l_j      |!    l     "o l_j     || !
          \                 ||     \               ||/
        .--^.     o       .^||.  .--^.     o       ||--. 
             "           ~  `'        "           ~`'
    EOSNOWMAN
    setpos(Curses::lines - 25, 10)
    addstr(snowman)
  end
  def draw(num = 150)
    draw_snowman
    draw_ground(0, 10)
    draw_ground(57)
    1.upto(num) do |i|
      setpos(rand(Curses::lines - 10), rand(Curses::cols))
      addstr("*")
    end
    refresh
  end
end

init_screen
begin
  snow = Snow.new
  i = 0
  loop do
    snow.draw
    sleep 0.1
    stdscr.clear if i % 2 == 0
    i += 1
  end
ensure
  close_screen
end
