require 'curses'
module LifeGame
  class World 
    attr_reader :width, :height
    def initialize(width=40, height=40)
      @width = width
      @height = height
      @world = Array.new(height) { Array.new(width) { [true,*Array.new(5,false)].sample } }

    end

    def to_a
      @world
    end

    def to_s
      @world.map {|line| line.map {|cell| cell ? '*' : ' '}.join('') + "\n" }.join('')
    end

    def next!
      @world = @world.map.with_index do |line, i|
        line.map.with_index do |cell, j|
          alives = count_around(i, j)
          cell ? (alives == 2  || alives == 3) : alives == 3
        end
      end
    end

    private
    def count_around(i, j)
      counter = @world[i][j] ? -1 : 0
      [-1,0,1].each do |di|
        [-1,0,1].each do |dj|
          if (0 <= i+di && i+di < @height) && (0 <= j+dj && j+dj < @width) && @world[i+di][j+dj]
            counter += 1
          end
        end
      end

      counter
    end
  end
end

w = LifeGame::World.new
puts w.to_s

Curses.init_screen
loop do
  Curses.setpos(0,0)
  w.next!
  Curses.addstr(w.to_s)
  Curses.refresh
  sleep(0.1)
end
