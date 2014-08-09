require "./board_game"
require "./player"
require "./square"
require "./event"
describe BoardGame do 
  
  before :each do
	 	players = []
	 	2.times do |i| 
	 		players << Player.new("test"+i.to_s)
	 	end
	 	
	 	events = []
	 	events << Event.new
	 	squares = []
	 	2.times do |i| 
	 		squares << Square.new(i, events)
	 	end

	 	@board_game = BoardGame.new players, squares
  end

  describe "when game starts" do
	  it "should contain at least one square" do
	 		expect(@board_game.squares.count).to be > 1
	  end

	  it "should contain at least one player" do
	 		expect(@board_game.players.count).to be > 1
	  end

	  it "must not contain players with the same name" do
	  	players_names = @board_game.player_names
			same_name_players = players_names.detect{ |e| players_names.count(e) > 1 }
	 		expect(same_name_players).to be_nil
	  end

	  it "players current square must be first square" do
	  	player_squares = []
	  	@board_game.players.count.times { player_squares << 1 }
	  	expect(@board_game.players.map(&:current_square)).to eq player_squares
	  end
	  
	  it "players must be associated with the board game" do
	  	board_game = @board_game.players.map(&:board_game).uniq
	  	expect(board_game.count).to be 1
	  	expect(board_game.first).to be @board_game
	  end
  end

  describe "methods" do
  	it "throw dice should return a number between 1 and 6" do
		  expect(1..6).to include(@board_game.throw_dice())
		end

		it "players names should return all players names" do
			players = @board_game.players
	 		players.first.name = "test1"
	 		players.last.name = "test2"
			expect(@board_game.player_names.count).to be 2
			expect(@board_game.player_names.first).to eq "test1"
			expect(@board_game.player_names.last).to eq "test2"
		end
	end

end
