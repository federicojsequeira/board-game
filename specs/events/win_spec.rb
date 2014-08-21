require "./events/win"
describe Win do 
  
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

    @board_game = BoardGame.new players, squares

    @win_event = Win.new
  end

  it "name should return the friendly name" do
  		expect(@win_event.name).to eq "Win"
  end

  it "should define player as the winner" do
    @win_event.run_on @player
    expect(@board_game.winner).to be @player
  end

end