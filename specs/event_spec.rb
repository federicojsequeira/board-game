require "./event"
describe Event do 
  
  before :each do
  	@player = Player.new "test1"
  end

  describe "methods" do
  	it "name should return the event friendly name" do
	 		expect(Event.new("happy_goose").name).to eq "Happy Goose"
	 		expect(Event.new("angry_goose").name).to eq "Angry Goose"
  	end
  end

  describe "happy goose" do
	  it "should move player to next goose" #do
	  	# next_goose_square_number = @player.board_game.next_goose_square_number
	  	
	  	# event = Event.new "happy_goose"
	  	# event.apply_to @player
	 		# expect(@player.current_square).to be next_goose_square_number
	  #end
	end
  	
  describe "angry goose" do
	  it "should move player to previous goose" #do
	  	# previous_goose_square_number = @player.board_game.previous_goose_square_number
	  	
	  	# event = Event.new "angry_goose"
	  	# event.apply_to @player
	 		# expect(@player.current_square).to be previous_goose_square_number
	  #end
  end

end