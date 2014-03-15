require 'spec_helper'

describe "StatusReports" do

  describe "Get /projects/status_reports/new" do
    it "successfully loads a new status reports page" do
      @project = FactoryGirl.build(:project)
      @project.save
      get new_project_status_report_path(@project)
      response.status.should be(200)
    end
  end

  describe "POST /projects/status_reports" do
    it "successfully creates a new status report" do
      @project = FactoryGirl.build(:project)
      @project.save
      
      post project_status_reports_path(@project.id), status_report: { "summary" => "Test", 
                                                                      "overall" => "test", 
                                                                      "reported_on(1i)" => "2014", 
                                                                      "reported_on(2i)" => "1", 
                                                                      "reported_on(3i)" => "15"}
      response.status.should be(302)
    end
    
    it "doesn't redirect an invalid status report" do
      @status_report = FactoryGirl.build(:status_report)
      @status_report.save
      post project_status_reports_path(@status_report.project), status_report: { summary: "", overall: "test"}
      response.status.should be(200)
    end
  end

  describe "Get /projects/status_reports/id/edit" do
    it "successfully loads a new status reports page" do
      @status_report = FactoryGirl.build(:status_report)
      @status_report.save
      get edit_project_status_report_path(@status_report.project, @status_report)
      response.status.should be(200)
    end
  end
  
  describe "Put /projects/id/status_reports/id" do
    it "successfully updates a status report" do
      @status_report = FactoryGirl.build(:status_report)
      @status_report.save
      put project_status_report_path(@status_report.project, @status_report), status_report: { summary: "Test", overall: "test"}
      response.status.should be(302)
    end
    
    it "doesn't redirect an invalid status report" do
      @status_report = FactoryGirl.build(:status_report)
      @status_report.save
      put project_status_report_path(@status_report.project, @status_report), status_report: { summary: "", overall: "test"}
      response.status.should be(200)
    end
  end

  describe "DELETE /projects/id/status_reports/id" do
    it "successfully deletes a status report" do
      @status_report = FactoryGirl.build(:status_report)
      @status_report.save
      
      delete project_status_report_path(@status_report.project,@status_report)
      response.status.should be(302)
    end
  end

end
