require "./square"
require "./event"
describe Square do 
  
  before :each do
	 	@square = Square.new 0, Event.new
  end

  describe "when initialized" do
	  it "should contain a number equal or greather than zero" do
	 		expect(@square.number).to be >= 0
	  end
  end

end
