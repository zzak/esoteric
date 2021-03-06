# -*- coding: utf-8 -*-
# https://gist.github.com/tyru/368331
# original: https://gist.github.com/ohac/368246
require 'curses'

def val2aa(wave, val)
  wave[(val + 0x8000) * wave.size / 0x10000]
end

def write_wave(counter)
  [
    ['˾_˼ߎ˨-˧H˕ߙ˦˥՟T˺˭'.split(//u), 79],    # 文字化けする...
    ['旦上二本与卉亠十廿卞广下'.split(//u), 39],
    #['.+^+.+^+.'.split(//u), 79],
  ].each do |pr|
    12.times do |y|
      # Curses::setpos(y - 1)
      str = pr[1].times.map{|x|val2aa(pr[0],0x7fff*Math.sin(x+counter/3.0+y))}.join
      Curses::addstr str + "\n"
    end
  end
end

def do_loop()
  Curses::init_screen

  (1..12).each {|i|
    Curses::clear
    write_wave i
    Curses::refresh
    sleep 0.5
  }

  Curses::close_screen
end

do_loop


=begin
$ ruby aawave.rb
+.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........+
.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++
++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.
+........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^
........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+
.......++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.
......++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^
.....++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^
....++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.
...++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+
..++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^
.++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.++........++.^+.^^.+^.
=end
