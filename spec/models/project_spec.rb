require 'spec_helper'

describe Project do
  
  before do
    @project = Project.new
  end
  
  it "can be instantiated" do
    @project.should be_an_instance_of(Project)
  end

  #it "can be saved successfully" do
  #  Project.create.should be_persisted
  #end
  
  it "is not valid without a pivotal project_id" do
    @project.should_not be_valid
  end
  
  it "is valid with pivotal token" do
    @project.project_id = "123456"
    @project.should be_valid
  end
  
end