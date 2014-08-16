require "./events/happy_goose"
describe HappyGoose do 
  
  before :each do
  	@player = Player.new "test1"
  	@happy_goose_event = HappyGoose.new
  end

	it "name should return the friendly name" do
 		expect(HappyGoose.new.name).to eq "Happy Goose"
	end

	it "should move player to next goose" #do
	# 	goose_square_numbers = [5,9,14,18,23,27]
  # 	next_goose_square_number = @player.next_goose_square_number
  	
  # 	@happy_goose_event.run_on @player
 	# 	expect(@player.current_square).to be next_goose_square_number
	# end

end