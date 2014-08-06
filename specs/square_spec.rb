require "./square"
require "./event"
describe Square do 
  
  before :each do
	 	events = []
	 	events << Event.new
	 	@square = Square.new events
  end

  describe "when initialized" do
	  it "should contain at least one event" do
	 		expect(@square.events.count).to be >= 1
	  end
  end

end
