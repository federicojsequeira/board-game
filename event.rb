require "./direction"
class Event
	attr_accessor :name

	def initialize name
		@name = name
	end

	def name
		@name.split('_').each { |w| w.capitalize! }.join(' ')
	end
end