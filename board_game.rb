class BoardGame
	attr_accessor :players, :squares, :winner

	def initialize players, squares
		@players = players
		@players.each do |player|
			player.board_game = self
			player.current_square = 1
		end

		squares.each_value { |sq| sq.event = Event.new }
		squares[1].event = HappyGoose.new
		squares[5].event = AngryGoose.new
		squares[9].event = HappyGoose.new
		squares[14].event = HappyGoose.new
		squares[18].event = AngryGoose.new
		squares[23].event = HappyGoose.new		
		squares[27].event = AngryGoose.new
		squares[32].event = HappyGoose.new
		squares[36].event = AngryGoose.new
		squares[41].event = AngryGoose.new
		squares[45].event = HappyGoose.new
		squares[50].event = AngryGoose.new
		squares[54].event = HappyGoose.new
		squares[59].event = AngryGoose.new
		squares[63].event = Win.new
		@squares = squares
	end

	def player_names
		players.map(&:name)
	end

	def goose_square_numbers
		numbers = []
		@squares.each_pair do |number, square| 
			numbers << number if (square.event.name == "Happy Goose" || square.event.name == "Angry Goose")
		end
		numbers
	end

end
