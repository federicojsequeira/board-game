require "./player"
require "./event"
require "./square"
require "./board_game"
describe Player do 
  
  before :each do
	 	@player = Player.new "test1"
	 	player2 = Player.new "test2"
	 	players = [@player, player2]

    squares = {}
    63.times do |i|
      squares[i+1] = Square.new(i+1)
    end

	 	board_game = BoardGame.new players, squares
  end

  describe "when initialized" do
	  it "should not contain an empty or nil name" do
	 		expect(@player.name).not_to be_nil
	 		expect(@player.name).not_to be_empty
	  end
  end

  describe "when throw dice" do
	  it "should move to corresponding square" do
	 		@player.current_square = 0
	 		@player.move 5
	 		expect(@player.current_square).to eq 5

	 		@player.move 5
	 		expect(@player.current_square).to eq 10
	  end

    it "should run destiny square event" do
      @player.current_square = 5
      @player.run_event
      expect(@player.current_square).to eq 1      

      @player.current_square = 9
      @player.run_event
      expect(@player.current_square).to eq 14

      @player.current_square = 10
      @player.run_event
      expect(@player.current_square).to eq 10
    end
  end

  describe "methods" do
    it "throw dice should return a number between 1 and 6" do
      expect(1..6).to include @player.throw_dice
    end

  	it "should return next closest goose square number" do
  		@player.current_square = 6
  		expect(@player.next_goose_square_number).to eq 9
  		@player.current_square = 19
  		expect(@player.next_goose_square_number).to eq 23
  	end

  	it "should return previous closest goose square number" do
  		@player.current_square = 6
  		expect(@player.previous_goose_square_number).to eq 5
  		@player.current_square = 19
  		expect(@player.previous_goose_square_number).to eq 18
  	end
  end

end
