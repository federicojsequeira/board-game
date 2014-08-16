class BoardGame
	attr_accessor :players, :squares

	def initialize players, squares
		@players = players
		@players.each do |player|
			player.board_game = self
			player.current_square = 1
		end

		@squares = squares
		squares[5] = Event.new "happy_goose"
		squares[14] = Event.new "happy_goose"
		squares[23] = Event.new "happy_goose"
		squares[9] = Event.new "angry_goose"
		squares[18] = Event.new "angry_goose"
		squares[27] = Event.new "angry_goose"
	end

	def throw_dice
		rand(1..6)
	end

	def player_names
		players.map(&:name)
	end

end
