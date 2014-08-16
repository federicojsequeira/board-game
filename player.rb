class Player
	attr_accessor :board_game, :name, :current_square

	def initialize name
		@name = name
	end

	def move dice_number
		final_square = @current_square + dice_number
		if final_square >= @board_game.squares.count
			final_square = @board_game.squares.count
		elsif final_square < 0
			final_square = 0
		end
		@current_square = final_square
	end

	def next_goose_square_number
		goose_square_numbers = @board_game.goose_square_numbers
		closest_next_number(goose_square_numbers, self.current_square)
	end

	def previous_goose_square_number
		goose_square_numbers = @board_game.goose_square_numbers
		closest_previous_number(goose_square_numbers, self.current_square)
	end

	def run_event
		event = @board_game.squares[@current_square].event
		if event.direction.to_s == "up"
			self.move(event.number)
		else
			self.move(event.number*-1)
		end
	end

	private
	def closest_next_number(numbers, value)
		numbers.map{ |x| x if x > value }.compact.min
	end 	

	def closest_previous_number(numbers, value)
		numbers.map{ |x| x if x < value }.compact.max
	end 	
end