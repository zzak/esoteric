require 'fiddle'

class Time
  attr_reader :handle, :value

  def initialize (time_t = nil)
    @handle = Fiddle::dlopen(nil)
    @value = Fiddle::Function.new(
      @handle['time'],
      [Fiddle::TYPE_VOIDP],
      Fiddle::TYPE_LONG
    ).call(time_t)
  end

  def - (time_t)
    Fiddle::Function.new(@handle['difftime'],
       [Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP],
       Fiddle::TYPE_DOUBLE).call(@value, time_t.value)
  end
end

time1 = Time.new
sleep 15
time2 = Time.new
puts time2 - time1

