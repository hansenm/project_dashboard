require 'spec_helper'

describe "Projects" do
  
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get projects_path
      response.status.should be(200)
    end
  end
  
  describe "GET /projects/id" do
    it "successfully loads the project show page" do
      @project = FactoryGirl.build(:project)
      @project.save
      get project_path(@project)
      response.status.should be(200)
    end
  end
  
  describe "POST /projects" do
    it "successfully add a new project" do
      post projects_url, project: { name: "My Project", manager: "John Doe", organization: "CWS" }
      expect(response.status).to eq(201) # "Created"
    end
  end
end
