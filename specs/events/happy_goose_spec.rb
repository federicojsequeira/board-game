require "./events/happy_goose"
describe HappyGoose do 
  
  before :each do
    players = []
    2.times do |i| 
      players << Player.new("test"+i.to_s)
    end
    @player = players.first

    squares = []
    63.times do |i|
      squares << Square.new(i)
    end

    board_game = BoardGame.new players, squares

    @happy_goose_event = HappyGoose.new
  end

	it "name should return the friendly name" do
 		expect(@happy_goose_event.name).to eq "Happy Goose"
	end

	it "should move player to next goose" do
		# goose_square_numbers = [5,9,14,18,23,27]
    
    @player.current_square = 5
  	@happy_goose_event.run_on @player
 		expect(@player.current_square).to eq 9

    @player.current_square = 18
    @happy_goose_event.run_on @player
    expect(@player.current_square).to eq 23

    @player.current_square = 22
    @happy_goose_event.run_on @player
    expect(@player.current_square).to eq 23
	end

end