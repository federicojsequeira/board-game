class BoardGame
	attr_accessor :players, :squares

	def initialize players, squares
		@players = players
		@players.each do |player|
			player.board_game = self
			player.current_square = 1
		end

		squares.each { |sq| sq.event = Event.new }
		squares[5].event = HappyGoose.new
		squares[14].event = HappyGoose.new
		squares[23].event = HappyGoose.new
		squares[9].event = AngryGoose.new
		squares[18].event = AngryGoose.new
		squares[27].event = AngryGoose.new
		@squares = squares
	end

	def throw_dice
		rand(1..6)
	end

	def player_names
		players.map(&:name)
	end

	def goose_square_numbers
		squares_numbers = @squares.map.with_index do 
			|square, index| index if (square.event.name == "Happy Goose" || square.event.name == "Angry Goose")
		end
		squares_numbers.compact
	end

end
