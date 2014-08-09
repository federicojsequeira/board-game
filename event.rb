require "./direction"
class Event
	attr_accessor :direction, :number

	def initialize
		rand_number = rand(0..1)
		if rand_number == 0
			@direction = Direction.new "down"
		else
			@direction = Direction.new "up"
		end
		@number = rand(1..6)
	end
end