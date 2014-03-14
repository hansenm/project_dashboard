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
end
    


## spec/features/widget_management_spec.rb
#feature "widget management" do
#  scenario "creating a new widget" do
#    visit root_url
#    click_link "New Widget"
#
#    fill_in "Name", with: "Awesome Widget"
#    click_button "Create Widget"
#
#    expect(page).to have_text("Widget was successfully created.")
#  end
#end