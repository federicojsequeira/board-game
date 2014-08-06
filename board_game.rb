class BoardGame
	attr_accessor :players, :squares

	def initialize players, squares
		@squares = squares
		@players = players
		@players.each do |player|
			player.board_game = self
			player.current_square = 1
		end
	end

	def throw_dice
		rand(1..6)
	end

	def player_names
		players.map(&:name)
	end

end
