require 'curses'

include Curses

message = 'yes im lazy'

init_screen
start_color
init_pair(COLOR_GREEN, COLOR_GREEN, COLOR_BLACK)
width = lines / 2 - 3
height = cols / 2 - (message.length / 2)
setpos(width, height)
attron(color_pair(COLOR_GREEN)|A_BOLD) do
  addstr(message)
end
refresh
getch

