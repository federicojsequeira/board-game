class AngryGoose < Event

	def run_on player
		player.current_square = player.previous_goose_square_number
	end

end