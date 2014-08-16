require "./events/angry_goose"
describe AngryGoose do 
  
  before :each do
  	@player = Player.new "test1"
  end

	it "name should return the friendly name" do
 		expect(AngryGoose.new.name).to eq "Angry Goose"
	end

	it "should move player to previous goose" #do
	#end

end