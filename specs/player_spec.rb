require "./player"
require "./event"
require "./direction"
require "./square"
require "./board_game"
describe Player do 
  
  before :each do
	 	@player = Player.new "test1"
	 	player2 = Player.new "test2"
	 	players = [@player, player2]

	 	squares = []
	 	10.times do |i| 
	 		squares << Square.new(i)
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
	 		@player.move(5)
	 		expect(@player.current_square).to be 5

	 		@player.move(5)
	 		expect(@player.current_square).to be 10
	  end

	  it "should run square rule" #do
			# @player.current_square = 6
	  # 	@player.board_game.squares[6].event = Event.new

	  # 	@player.board_game.squares[6].event.direction = Direction.new('down')
	  # 	@player.board_game.squares[6].event.number = 4
	 	# 	@player.run_event
	 	# 	expect(@player.current_square).to be 2

			# @player.current_square = 6
	  # 	@player.board_game.squares[6].event.direction = Direction.new('up')
	  # 	@player.board_game.squares[6].event.number = 6
	 	# 	@player.run_event
	 	# 	expect(@player.current_square).to be 10

			# @player.current_square = 2
	  # 	@player.board_game.squares[2].event.direction = Direction.new('down')
	  # 	@player.board_game.squares[2].event.number = 6

	 	# 	@player.run_event
	 	# 	expect(@player.current_square).to be 0	 		
	  # end

  end

end
