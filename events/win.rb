class Win < Event

	def run_on player
		player.board_game.winner = player
	end

end