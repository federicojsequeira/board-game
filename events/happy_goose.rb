class HappyGoose < Event
	
	def run_on player
		player.current_square = player.next_goose_square_number
	end
	
end