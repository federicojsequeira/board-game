require "./direction"
class Event
	attr_accessor :name

	def name
		self.nil? ? '' : self.class_name.split(/(?=[A-Z])/).join(' ')
	end

	def class_name
		self.class.name
	end

end