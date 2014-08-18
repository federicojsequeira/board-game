class Event
	attr_accessor :name

	def name
		self.nil? ? '' : self.class_name.split(/(?=[A-Z])/).join(' ')
	end

	def class_name
		self.class.name
	end

	def run_on player
		#each event type defines this method
	end

end