# https://gist.github.com/tana/881440

require 'curses'

to_o_pos = [[3, 2], [4, 2], [5, 2], [2, 3], [6, 3], [2, 4], [6, 4], [2, 5], [6, 5], [3, 6], [4, 6], [5, 6]]
to_r_pos = [[9, 2], [12, 2], [13, 2], [9, 3], [11, 3], [9, 4], [10, 4], [9, 5], [9, 6]]
to_z_pos = [[16, 2], [17, 2], [18, 2], [19, 2], [20, 2], [19, 3], [18, 4], [17, 5], [16, 6], [17, 6], [18, 6], [19, 6], [20, 6]]

def make_rand_pos_arr(count)
  arr = []
  count.times {
    arr << [rand(21), rand(9)]
  }
  return arr
end
o_pos = make_rand_pos_arr(to_o_pos.length)
r_pos = make_rand_pos_arr(to_r_pos.length)
z_pos = make_rand_pos_arr(to_z_pos.length)
def move(pos, to_pos)
  newpos = pos.dup
  newpos[0] = pos[0] + 1 if pos[0] < to_pos[0]
  newpos[1] = pos[1] + 1 if pos[1] < to_pos[1]
  newpos[0] = pos[0] - 1 if pos[0] > to_pos[0]
  newpos[1] = pos[1] - 1 if pos[1] > to_pos[1]
  return newpos
end
Curses::init_screen 
while true
  break if to_o_pos == o_pos && to_r_pos == r_pos && to_z_pos == z_pos
  Curses.clear
  i = 0
  o_pos = o_pos.map {|pos| i_ = i; i = i + 1; move(pos, to_o_pos[i_])}
  i = 0
  r_pos = r_pos.map {|pos| i_ = i; i = i + 1; move(pos, to_r_pos[i_])}
  i = 0
  z_pos = z_pos.map {|pos| i_ = i; i = i + 1; move(pos, to_z_pos[i_])}
  o_pos.each {|pos|
    Curses.setpos(pos[1], pos[0])
    Curses.addstr("o")
  }
  r_pos.each {|pos|
    Curses.setpos(pos[1], pos[0])
    Curses.addstr("r")
  }
  z_pos.each {|pos|
    Curses.setpos(pos[1], pos[0])
    Curses.addstr("z")
  }
  Curses.refresh
  sleep(0.2)
end
Curses.getch
