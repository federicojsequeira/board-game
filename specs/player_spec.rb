require "./player"
describe Player do 
  
  before :each do
	 	@player = Player.new "test"
  end

  describe "when initialized" do
	  it "should not contain an empty or nil name" do
	 		expect(@player.name).not_to be_nil
	 		expect(@player.name).not_to be_empty
	  end
  end

end
