require 'spec_helper'

describe ProjectsController, " handling GET /projects for a tracker" do

  before do
    @tracker = mock_model(Tracker) 
    @projects = mock("projects")
    @tracker.stub!(:projects).and_return(@projects)
    @tracker.stub!(:all_projects_from_pivotal).and_return(@pivo_projects)
    Tracker.stub!(:find).and_return(@tracker)
  end

  def do_get 
    get :index, :tracker_id => 1
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end

  it "should find tracker with params[:tracker_id]" do 
    Tracker.should_receive(:find).with("1").and_return(@tracker)
    do_get
  end

  it "should get trackers projects" do
    @tracker.should_receive(:projects).and_return(@projects)
    do_get
  end

  it "should assign the found projects for the view" do
    do_get
    assigns[:projects].should be(@projects)
  end
  
  describe "GET ical" do
    it "gets an ical formatted string" do
      
    end
  end

end