require 'spec_helper'

describe StatusReport do

  before(:each) do
    @status_report = FactoryGirl.build(:status_report)
  end

  it "is valid with project id, summary, and overall" do
    @status_report.should be_valid
  end

  it "is not valid without a project" do
    @status_report.project = nil
    @status_report.should_not be_valid
  end
  
  it "is not valid with an empty summary" do
    @status_report.summary = nil
    @status_report.should_not be_valid
  end
  
  it "is not valid with an empty overall status" do
    @status_report.overall = nil
    @status_report.should_not be_valid
  end
end
