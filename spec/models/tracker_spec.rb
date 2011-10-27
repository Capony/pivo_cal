describe Tracker do
  before do
    @tracker = Tracker.new
  end
  
  it "can be instantiated" do
    @tracker.should be_an_instance_of(Tracker)
  end
  
  it "is not valid without a token" do
    @tracker.should_not be_valid
  end
  
  it "is valid with pivotal token" do
    @tracker.pivotal_token = "123456"
    @tracker.should be_valid
  end
  
  it "can get projects from pivotal" do
    
  end
end