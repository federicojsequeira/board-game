require "./events/angry_goose"
describe AngryGoose do 
  
  before :each do
    players = []
    2.times do |i| 
      players << Player.new("test"+i.to_s)
    end
    @player = players.first

    squares = {}
    63.times do |i|
        squares[i+1] = Square.new(i+1)
    end

    board_game = BoardGame.new players, squares

    @angry_goose_event = AngryGoose.new
  end

	it "name should return the friendly name" do
 		expect(@angry_goose_event.name).to eq "Angry Goose"
	end

	it "should move player to previous goose" do
        @player.current_square = 9
        @angry_goose_event.run_on @player
        expect(@player.current_square).to eq 5

        @player.current_square = 23
        @angry_goose_event.run_on @player
        expect(@player.current_square).to eq 18

        @player.current_square = 26
        @angry_goose_event.run_on @player
        expect(@player.current_square).to eq 23    
	end

end