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
  
  describe "Get /projects/new" do
    it "successfully loads a new project page" do
      get new_project_path
      response.status.should be(200)
    end
  end
  
  describe "POST /projects" do
    it "successfully add a new project" do
      post projects_url, project: { name: "My Project", manager: "John Doe", organization: "CWS" }
      response.status.should be(302) # "Redirected if valid project"
    end
    
    it "doesn't redirect an invalid project" do
      post projects_url, project: { name: "My Project" }
      response.status.should be(200)
    end
  end
  
  describe "Get /projects/id/edit" do
    it "successfully loads a project edit page" do
      @project = FactoryGirl.build(:project)
      @project.save
      get project_edit_path(@project)
      response.status.should be(200)
    end
  end
  
  describe "PUT /projects/id" do
    it "successfully edits a project" do
      @project = FactoryGirl.build(:project)
      @project.save
      put project_url(@project), project: { name: "My Project", manager: "John Doe", organization: "CWS" }
      response.status.should be(302)
    end
    
    it "doesn't redirect an invalid project" do
      @project = FactoryGirl.build(:project)
      @project.save
      put project_url(@project), project: { name: "", manager: "John Doe", organization: "CWS" }
      resonse.status.should be(200)
    end
  end
end
