require 'spec_helper'

describe Project do

  before(:each) do
    @project = FactoryGirl.build(:project)
  end

  it "is valid with name, manager and organization" do
    @project.should be_valid
  end

  it "is not valid with an empty name" do
    @project.name = nil
    @project.should_not be_valid
  end
  
  it "is not valid with an empty manager" do
    @project.manager = nil
    @project.should_not be_valid
  end
  
  it "is not valid with an empty organization" do
    @project.organization = nil
    @project.should_not be_valid
  end
end
