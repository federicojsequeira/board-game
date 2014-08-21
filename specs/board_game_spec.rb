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

	 	squares = {}
	 	63.times do |i|
	 		squares[i+1] = Square.new(i+1)
	 	end

	 	@board_game = BoardGame.new players, squares
  end

  describe "when game starts" do
  	describe "the board" do
	  	it "should contain 63 squares" do
	 			expect(@board_game.squares.count).to be 63
	  	end

		  it "should contain at least one player" do
	 			expect(@board_game.players.count).to be > 1
	  	end

		  it "must not contain players with the same name" do
		  	players_names = @board_game.player_names
				same_name_players = players_names.detect{ |e| players_names.count(e) > 1 }
		 		expect(same_name_players).to be_nil
		  end
		end

		describe "players" do
		  it "must be on first square" do
		  	player_squares = []
		  	@board_game.players.count.times { player_squares << 1 }
		  	expect(@board_game.players.map(&:current_square)).to eq player_squares
		  end

		  it "must be playing in a board game" do
		  	board_game = @board_game.players.map(&:board_game).uniq
		  	expect(board_game.count).to be 1
		  	expect(board_game.first).to be @board_game
		  end
	  end

	  describe "event" do
		  it "on square numbers 9, 14, 23, 32, 45 and 54 must be Happy Goose" do
		  	expect(@board_game.squares[9].event.name).to eq "Happy Goose"
	  		expect(@board_game.squares[14].event.name).to eq "Happy Goose"
  			expect(@board_game.squares[23].event.name).to eq "Happy Goose"
				expect(@board_game.squares[32].event.name).to eq "Happy Goose"  			
				expect(@board_game.squares[45].event.name).to eq "Happy Goose"
				expect(@board_game.squares[54].event.name).to eq "Happy Goose"
		  end

		  it "on square numbers 5, 18, 27, 36, 41, 50 and 59 must be Angry Goose" do
		  	expect(@board_game.squares[5].event.name).to eq "Angry Goose"
	  		expect(@board_game.squares[18].event.name).to eq "Angry Goose"
  			expect(@board_game.squares[27].event.name).to eq "Angry Goose"
  			expect(@board_game.squares[36].event.name).to eq "Angry Goose"
  			expect(@board_game.squares[41].event.name).to eq "Angry Goose"
  			expect(@board_game.squares[50].event.name).to eq "Angry Goose"
  			expect(@board_game.squares[59].event.name).to eq "Angry Goose"
		  end

		  it "on square numbers 63 must be Win" do
		  	expect(@board_game.squares[63].event.name).to eq "Win"
		  end		  
	  end

	end

  describe "methods" do
		it "players names should return all players names" do
			players = @board_game.players
	 		players.first.name = "test1"
	 		players.last.name = "test2"
			expect(@board_game.player_names.count).to be 2
			expect(@board_game.player_names.first).to eq "test1"
			expect(@board_game.player_names.last).to eq "test2"
		end

		it "goose square numbers should return the square numbers with goose event" do
			expect(@board_game.goose_square_numbers).to eq [1,5,9,14,18,23,27,32,36,41,45,50,54,59]
		end
	end

end
