require 'spec_helper'

feature "Status Report Management" do
  
  scenario "creating a new status report" do
    @project = FactoryGirl.build(:project)
    @project.save
    
    visit project_path(@project)
    click_link "New Status Report"

    fill_in "Summary", with: "Status Report Summary"
    fill_in "Overall", with: "Green"
    click_button "Save"

    expect(page).to have_text("Status Report Summary")
  end

  scenario "editing an existing status report" do
    # Create a status report
    @status_report = FactoryGirl.build(:status_report)
    @status_report.save

    # Visit the status report show page, click the edit link
    visit project_status_report_path(@status_report.project, @status_report)
    click_link "Edit"

    # Give it a new name and save
    fill_in "Summary", with: "Updated Summary"
    click_button "Save"
    expect(page).to have_text("Updated Summary")
  end

  scenario "delete an existing status_report" do
    # Create a status report
    @status_report = FactoryGirl.build(:status_report)
    @status_report.save

    # Visit the project show page, click the delete link
    visit project_status_report_path(@status_report.project, @status_report)
    click_link "Delete"

    # Visit the project show page again, which should break
    visit project_status_report_path(@status_report.project, @status_report)
    page.status_code.should == 404
  end
end
