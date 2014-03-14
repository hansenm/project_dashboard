require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/projects'
      page.should have_content('Projects')
    end
  end

  describe "GET /projects/new" do
    it "Loads the new project form" do
      visit '/projects/new'
      page.should have_content("Add a New Project")
    end
  end
end

feature "Project Management" do
  scenario "creating a new project" do
    visit projects_path
    click_link "New Project"

    fill_in "Name", with: "Test Project"
    fill_in "Manager", with: "Jane Doe"
    fill_in "Organization", with: "CWS"
    click_button "Save"

    expect(page).to have_text("Test Project")
  end

  scenario "editing an existing project" do
    # Create a project
    @project = FactoryGirl.build(:project)
    @project.save

    # Visit the project show page, click the edit link
    visit project_path(@project)
    click_link "Edit"

    # Give it a new name and save
    fill_in "Name", with: "Testing"
    click_button "Save"
    expect(page).to have_text("Testing")
  end

  scenario "delete an existing project" do
    # Create a project
    @project = FactoryGirl.build(:project)
    @project.save

    # Visit the project show page, click the delete link
    visit project_path(@project)
    click_link "Delete"

    # Visit the project show page again, which should break
    visit project_path(@project)
    page.status_code.should == 404
  end
end
